import 'package:equatable/equatable.dart';

/// Clase abstracta base para todos los casos de uso
/// Implementa el principio de responsabilidad única
abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}

/// Para casos de uso que no requieren parámetros
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
