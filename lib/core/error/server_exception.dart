enum ServerExceptionType {
  configuration,
  network,
  quotaExceeded,
  emptyResponse,
  unknown,
}

class ServerException implements Exception {
  final ServerExceptionType type;
  final String? debugMessage;

  const ServerException(this.type, {this.debugMessage});

  @override
  String toString() => debugMessage ?? type.name;
}
