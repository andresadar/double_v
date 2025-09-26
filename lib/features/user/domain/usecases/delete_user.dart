import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

/// Use case para eliminar un usuario
class DeleteUser implements UseCase<void, String> {
  const DeleteUser(this.repository);

  final UserRepository repository;

  @override
  Future<void> call(String userId) async {
    return await repository.deleteUser(userId);
  }
}