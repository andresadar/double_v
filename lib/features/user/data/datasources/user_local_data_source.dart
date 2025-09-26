import '../models/user_model.dart';

/// Data source abstracto para usuarios locales
abstract class UserLocalDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel?> getUserById(String id);
  Future<void> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<void> deleteUser(String id);
  Future<List<UserModel>> searchUsersByName(String name);
}
