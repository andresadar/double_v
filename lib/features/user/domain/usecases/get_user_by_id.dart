import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Parámetros para obtener un usuario por ID
class GetUserByIdParams extends Equatable {
  const GetUserByIdParams(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

/// Caso de uso para obtener un usuario por su ID
class GetUserById implements UseCase<User?, GetUserByIdParams> {
  const GetUserById(this._repository);

  final UserRepository _repository;

  @override
  Future<User?> call(GetUserByIdParams params) async {
    return await _repository.getUserById(params.id);
  }
}
