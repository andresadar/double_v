import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Parámetros para crear un usuario
class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
  });

  final String firstName;
  final String lastName;
  final DateTime birthDate;

  @override
  List<Object> get props => [firstName, lastName, birthDate];
}

/// Caso de uso para crear un usuario
class CreateUser implements UseCase<void, CreateUserParams> {
  const CreateUser(this._repository);

  final UserRepository _repository;

  @override
  Future<void> call(CreateUserParams params) async {
    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      firstName: params.firstName,
      lastName: params.lastName,
      birthDate: params.birthDate,
    );

    return await _repository.createUser(user);
  }
}
