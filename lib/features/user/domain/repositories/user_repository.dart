import '../entities/user.dart';

/// Repositorio abstracto para la gestión de usuarios
/// Implementa el principio de inversión de dependencias
abstract class UserRepository {
  /// Obtiene todos los usuarios
  Future<List<User>> getUsers();
  
  /// Obtiene un usuario por su ID
  Future<User?> getUserById(String id);
  
  /// Crea un nuevo usuario
  Future<void> createUser(User user);
  
  /// Actualiza un usuario existente
  Future<void> updateUser(User user);
  
  /// Elimina un usuario
  Future<void> deleteUser(String id);
  
  /// Busca usuarios por nombre
  Future<List<User>> searchUsersByName(String name);
}
