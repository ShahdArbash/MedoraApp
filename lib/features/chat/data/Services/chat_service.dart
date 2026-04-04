import 'package:dio/dio.dart';
import 'package:medoraapp/features/chat/data/Services/api_service_chat.dart';
import 'package:medoraapp/features/chat/data/models/message_model.dart';

import '../../../../core/error/server_exception.dart';

class ChatService {
  final String apiKey = "AIzaSyAaDZwkn8WHJVnxMbpgzbJ2ggkm9j7ScUY";

  final String url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent";

  final String contentType = "application/json";
  Future<MessageModel> sendMessage(List<MessageModel> messages) async {
    try {
      Response response = await ApiServiceChat().post(
        url,
        data: {
          "contents": messages.map((message) => message.toJson()).toList(),
        },
        headers: {"Content-Type": contentType, "x-goog-api-key": apiKey},
      );

      final data = response.data;

      if (data == null || data['candidates'] == null) {
        throw const ServerException(
          ServerExceptionType.emptyResponse,
          debugMessage: 'Empty response from AI',
        );
      }

      final candidates = data['candidates'];

      if (candidates.isEmpty) {
        throw const ServerException(
          ServerExceptionType.emptyResponse,
          debugMessage: 'No response from AI',
        );
      }

      return MessageModel.fromJson(candidates[0]['content']);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final dynamic responseData = e.response?.data;
      final dynamic errorData = responseData is Map
          ? responseData['error']
          : null;
      final String? apiErrorMessage = errorData is Map
          ? errorData['message']?.toString()
          : null;
      final lower = (apiErrorMessage ?? '').toLowerCase();

      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.response == null) {
        throw ServerException(
          ServerExceptionType.network,
          debugMessage: e.message,
        );
      }

      if (statusCode == 429 || lower.contains('quota')) {
        throw ServerException(
          ServerExceptionType.quotaExceeded,
          debugMessage: apiErrorMessage,
        );
      }

      if (lower.contains('api key') || lower.contains('api-key')) {
        throw ServerException(
          ServerExceptionType.configuration,
          debugMessage: apiErrorMessage,
        );
      }

      throw ServerException(
        ServerExceptionType.unknown,
        debugMessage: apiErrorMessage ?? e.message,
      );
    } catch (e) {
      throw ServerException(
        ServerExceptionType.unknown,
        debugMessage: e.toString(),
      );
    }
  }
}
