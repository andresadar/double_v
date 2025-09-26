/// Excepciones personalizadas para la aplicación
class ServerException implements Exception {
  const ServerException(this.message);
  final String message;
}

class CacheException implements Exception {
  const CacheException(this.message);
  final String message;
}

class ValidationException implements Exception {
  const ValidationException(this.message);
  final String message;
}

class NotFoundException implements Exception {
  const NotFoundException(this.message);
  final String message;
}
