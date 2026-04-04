enum ApiExceptionType {
  network,
  server,
  unknown,
}

class ApiException implements Exception {
  final ApiExceptionType type;
  final int? statusCode;
  final String? serverMessage;

  const ApiException({
    required this.type,
    this.statusCode,
    this.serverMessage,
  });

  @override
  String toString() => serverMessage ?? type.name;
}
