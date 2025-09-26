import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Parámetros para actualizar un usuario
class UpdateUserParams extends Equatable {
  const UpdateUserParams({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
  });

  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;

  @override
  List<Object> get props => [id, firstName, lastName, birthDate];
}

/// Caso de uso para actualizar un usuario existente
class UpdateUser implements UseCase<void, UpdateUserParams> {
  const UpdateUser(this._repository);

  final UserRepository _repository;

  @override
  Future<void> call(UpdateUserParams params) async {
    // Obtener el usuario actual para preservar las direcciones
    final currentUser = await _repository.getUserById(params.id);
    if (currentUser == null) {
      throw Exception('Usuario no encontrado');
    }

    // Crear usuario actualizado preservando direcciones existentes
    final updatedUser = User(
      id: params.id,
      firstName: params.firstName,
      lastName: params.lastName,
      birthDate: params.birthDate,
      addresses: currentUser.addresses,
    );

    return await _repository.updateUser(updatedUser);
  }
}
