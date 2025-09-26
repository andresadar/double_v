import 'package:hive/hive.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/hive_config.dart';
import '../models/user_model.dart';
import 'user_local_data_source.dart';

/// Implementación de UserLocalDataSource usando Hive
class UserLocalDataSourceImpl implements UserLocalDataSource {
  UserLocalDataSourceImpl();

  Box<UserModel> get _box => HiveConfig.getUserBox();

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      return _box.values.toList();
    } catch (e) {
      throw CacheException('Error al obtener usuarios: ${e.toString()}');
    }
  }

  @override
  Future<UserModel?> getUserById(String id) async {
    try {
      return _box.values.firstWhere(
        (user) => user.id == id,
        orElse: () => throw NotFoundException('Usuario no encontrado'),
      );
    } on NotFoundException {
      return null;
    } catch (e) {
      throw CacheException('Error al obtener usuario: ${e.toString()}');
    }
  }

  @override
  Future<void> createUser(UserModel user) async {
    try {
      await _box.put(user.id, user);
    } catch (e) {
      throw CacheException('Error al crear usuario: ${e.toString()}');
    }
  }

  @override
  Future<void> updateUser(UserModel user) async {
    try {
      if (!_box.containsKey(user.id)) {
        throw NotFoundException('Usuario no encontrado para actualizar');
      }
      await _box.put(user.id, user);
    } catch (e) {
      if (e is NotFoundException) rethrow;
      throw CacheException('Error al actualizar usuario: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      if (!_box.containsKey(id)) {
        throw NotFoundException('Usuario no encontrado para eliminar');
      }
      await _box.delete(id);
    } catch (e) {
      if (e is NotFoundException) rethrow;
      throw CacheException('Error al eliminar usuario: ${e.toString()}');
    }
  }

  @override
  Future<List<UserModel>> searchUsersByName(String name) async {
    try {
      final searchTerm = name.toLowerCase().trim();
      return _box.values.where((user) {
        final fullName = '${user.firstName} ${user.lastName}'.toLowerCase();
        return fullName.contains(searchTerm);
      }).toList();
    } catch (e) {
      throw CacheException('Error al buscar usuarios: ${e.toString()}');
    }
  }
}
