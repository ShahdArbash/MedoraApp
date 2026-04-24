import 'package:dio/dio.dart';
import 'package:medoraapp/features/chat/data/Services/api_service_chat.dart';
import 'package:medoraapp/features/chat/data/models/message_model.dart';

enum ChatFailureType {
  network,
  quotaExceeded,
  configuration,
  emptyResponse,
  unknown,
}

class ChatFailure implements Exception {
  final ChatFailureType type;
  final String? message;

  ChatFailure(this.type, {this.message});
}

class ChatService {
  final String apiKey = "YOUR_API_KEY";

  final String url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent";

  final String contentType = "application/json";

  Future<MessageModel> sendMessage(List<MessageModel> messages) async {
    try {
      final response = await ApiServiceChat().post(
        url,
        data: {"contents": messages.map((m) => m.toJson()).toList()},
        headers: {"Content-Type": contentType, "x-goog-api-key": apiKey},
      );

      final data = response.data;

      if (data == null || data['candidates'] == null) {
        throw ChatFailure(ChatFailureType.emptyResponse);
      }

      final candidates = data['candidates'];

      if (candidates.isEmpty) {
        throw ChatFailure(ChatFailureType.emptyResponse);
      }

      return MessageModel.fromJson(candidates[0]['content']);
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (_) {
      throw ChatFailure(ChatFailureType.unknown);
    }
  }

  ChatFailure _mapDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    final errorMessage = data['error']?['message']?.toString();

    final lower = (errorMessage ?? '').toLowerCase();

    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.response == null) {
      return ChatFailure(ChatFailureType.network, message: e.message);
    }

    if (statusCode == 429 || lower.contains('quota')) {
      return ChatFailure(ChatFailureType.quotaExceeded);
    }

    if (lower.contains('api key')) {
      return ChatFailure(ChatFailureType.configuration);
    }

    return ChatFailure(ChatFailureType.unknown, message: errorMessage);
  }
}
