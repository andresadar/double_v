import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../models/user_model.dart';

/// Implementación concreta de UserRepository
/// Maneja la lógica de acceso a datos y conversión entre capas
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required this.localDataSource,
  });

  final UserLocalDataSource localDataSource;

  @override
  Future<List<User>> getUsers() async {
    final userModels = await localDataSource.getUsers();
    return userModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<User?> getUserById(String id) async {
    final userModel = await localDataSource.getUserById(id);
    return userModel?.toEntity();
  }

  @override
  Future<void> createUser(User user) async {
    final userModel = UserModel.fromEntity(user);
    await localDataSource.createUser(userModel);
  }

  @override
  Future<void> updateUser(User user) async {
    final userModel = UserModel.fromEntity(user);
    await localDataSource.updateUser(userModel);
  }

  @override
  Future<void> deleteUser(String id) async {
    await localDataSource.deleteUser(id);
  }

  @override
  Future<List<User>> searchUsersByName(String name) async {
    final userModels = await localDataSource.searchUsersByName(name);
    return userModels.map((model) => model.toEntity()).toList();
  }
}
