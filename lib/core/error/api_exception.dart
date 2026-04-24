enum ApiExceptionType {
  network,
  timeout,
  unauthorized,
  notFound,
  validation,
  server,
  unknown,
}

class ApiException implements Exception {
  final ApiExceptionType type;
  final int? statusCode;
  final String? serverMessage;

  const ApiException({required this.type, this.statusCode, this.serverMessage});

  @override
  String toString() => serverMessage ?? type.name;

  String get userMessage {
    if (serverMessage != null) return serverMessage!;

    switch (type) {
      case ApiExceptionType.network:
        return "No internet connection";
      case ApiExceptionType.timeout:
        return "Request timeout";
      case ApiExceptionType.unauthorized:
        return "Session expired";
      case ApiExceptionType.notFound:
        return "Resource not found";
      case ApiExceptionType.validation:
        return "Invalid input";
      case ApiExceptionType.server:
        return "Server error";
      case ApiExceptionType.unknown:
        return "Something went wrong";
    }
  }

  factory ApiException.fromStatusCode(int? code, String? message) {
    switch (code) {
      case 401:
        return ApiException(
          type: ApiExceptionType.unauthorized,
          statusCode: code,
          serverMessage: message,
        );
      case 404:
        return ApiException(
          type: ApiExceptionType.notFound,
          statusCode: code,
          serverMessage: message,
        );
      case 422:
        return ApiException(
          type: ApiExceptionType.validation,
          statusCode: code,
          serverMessage: message,
        );
      default:
        return ApiException(
          type: ApiExceptionType.server,
          statusCode: code,
          serverMessage: message,
        );
    }
  }
}
