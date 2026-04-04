import 'package:medoraapp/core/error/api_exception.dart';

enum AuthFailureReason {
  invalidCredentials,
  emailTaken,
  network,
  server,
  unknown,
}

AuthFailureReason mapAuthFailureReason({
  ApiException? exception,
  String? serverMessage,
}) {
  final message = (serverMessage ?? exception?.serverMessage ?? '').toLowerCase();

  if (exception?.type == ApiExceptionType.network) {
    return AuthFailureReason.network;
  }

  if (message.contains('email') && message.contains('taken')) {
    return AuthFailureReason.emailTaken;
  }
  if (message.contains('مستخدم') && message.contains('بالفعل')) {
    return AuthFailureReason.emailTaken;
  }

  if (message.contains('invalid') ||
      message.contains('unauthorized') ||
      message.contains('credentials') ||
      message.contains('incorrect')) {
    return AuthFailureReason.invalidCredentials;
  }
  if (message.contains('غير') && message.contains('صحيح')) {
    return AuthFailureReason.invalidCredentials;
  }

  if (exception?.type == ApiExceptionType.server) {
    return AuthFailureReason.server;
  }

  return AuthFailureReason.unknown;
}

