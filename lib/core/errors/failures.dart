import 'package:equatable/equatable.dart';

/// Clase base para todas las excepciones personalizadas de la aplicación
abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

/// Falla en el almacenamiento local
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Falla en la conexión de red
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Falla de validación
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Falla cuando no se encuentra un recurso
class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}
