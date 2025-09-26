import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Caso de uso para obtener todos los usuarios
class GetUsers implements UseCase<List<User>, NoParams> {
  const GetUsers(this._repository);

  final UserRepository _repository;

  @override
  Future<List<User>> call(NoParams params) async {
    return await _repository.getUsers();
  }
}
