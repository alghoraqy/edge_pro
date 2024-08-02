class ServerException implements Exception {}

class OfflineException implements Exception {}

class ValidationException implements Exception {
  final String? message;
  ValidationException({this.message});
}

class UnauthorizedException implements Exception {
  final String? message;
  UnauthorizedException({this.message});
}

class EmptyCashException implements Exception {}

class RegenerateTokenException implements Exception {
 const RegenerateTokenException();
}

class DataTypeChangeException implements Exception {}