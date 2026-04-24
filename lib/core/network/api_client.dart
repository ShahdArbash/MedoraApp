import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/core/storage/token_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late final Dio dio;

  factory ApiClient() => _instance;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    _addInterceptors();
  }

  static const String _baseUrl = "http://192.168.1.118:8000/api/";

  void _addInterceptors() {
    // 🔐 Token + Network Check
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 🌐 check internet
          final connectivity = await Connectivity().checkConnectivity();
          if (connectivity == ConnectivityResult.none) {
            return handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.connectionError,
              ),
            );
          }

          // 🔑 add token
          final token = await TokenStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
      ),
    );

    // 🔁 Retry interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          if (_shouldRetry(error)) {
            try {
              final response = await _retry(error.requestOptions);
              return handler.resolve(response);
            } catch (e) {
              return handler.next(error);
            }
          }
          handler.next(error);
        },
      ),
    );

    // 🔄 Refresh Token
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            final newToken = await _refreshToken();

            if (newToken != null) {
              await TokenStorage.saveTokens(
                accessToken: newToken,
                // refreshToken: await TokenStorage.getRefreshToken() ?? '',
              );

              error.requestOptions.headers['Authorization'] =
                  'Bearer $newToken';

              final response = await dio.fetch(
                error.requestOptions,
              ); // retry request

              return handler.resolve(response);
            }
          }

          handler.next(error);
        },
      ),
    );

    // 🧠 تحويل الأخطاء
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          final apiException = _mapToApiException(error);

          final newError = DioException(
            requestOptions: error.requestOptions,
            response: error.response,
            type: error.type,
            error: apiException, // 👈 هون السر
          );

          handler.next(newError);
        },
      ),
    );

    // 🐞 Logging
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  // 🔁 Retry logic
  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.receiveTimeout;
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    return dio.fetch(requestOptions);
  }

  // 🔄 Refresh token logic (تعدلي endpoint حسب الباك)
  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await TokenStorage.getRefreshToken();

      final response = await dio.post(
        "refresh-token",
        data: {"refresh_token": refreshToken},
      );

      return response.data["access_token"];
    } catch (e) {
      return null;
    }
  }

  ApiException _mapToApiException(DioException e) {
    if (e.type == DioExceptionType.connectionError) {
      return const ApiException(type: ApiExceptionType.network);
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const ApiException(type: ApiExceptionType.timeout);
    }

    final statusCode = e.response?.statusCode;
    final message = e.response?.data?['message'];

    return ApiException.fromStatusCode(statusCode, message);
  }
}
