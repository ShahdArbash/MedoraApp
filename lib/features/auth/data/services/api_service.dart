import 'package:dio/dio.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/core/network/api_client.dart';

class ApiService {
  final Dio dio = ApiClient().dio;

  Future<Map<String, dynamic>> post({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio.post(path, data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> get(String path) async {
    try {
      final response = await dio.get(path);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  ApiException _handleError(DioException e) {
    if (e.error is ApiException) {
      return e.error as ApiException;
    }

    return const ApiException(type: ApiExceptionType.unknown);
  }
}
