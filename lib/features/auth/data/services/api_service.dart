import 'package:dio/dio.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/core/storage/token_storage.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.ushare.vip/medora/api/',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
  }
  Future<Map<String, dynamic>> post({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  ApiException _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode;

    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.response == null) {
      return const ApiException(type: ApiExceptionType.network);
    }

    final data = e.response?.data;
    String? serverMessage;

    if (data is Map) {
      if (data['data'] is List && (data['data'] as List).isNotEmpty) {
        serverMessage = data['data'][0].toString();
      } else if (data['message'] != null) {
        serverMessage = data['message'].toString();
      }
    }

    return ApiException(
      type: ApiExceptionType.server,
      statusCode: statusCode,
      serverMessage: serverMessage,
    );
  }
}
