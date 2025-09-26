import '../entities/address.dart';

/// Repositorio abstracto para la gestión de direcciones
/// Implementa el principio de inversión de dependencias
abstract class AddressRepository {
  /// Obtiene todas las direcciones de un usuario
  Future<List<Address>> getAddressesByUserId(String userId);
  
  /// Obtiene una dirección por su ID
  Future<Address?> getAddressById(String id);
  
  /// Crea una nueva dirección
  Future<void> createAddress(Address address);
  
  /// Actualiza una dirección existente
  Future<void> updateAddress(Address address);
  
  /// Elimina una dirección
  Future<void> deleteAddress(String id);
  
  /// Obtiene todas las direcciones
  Future<List<Address>> getAllAddresses();
  
  /// Obtiene los países disponibles (desde API externa)
  Future<List<String>> getCountries();
  
  /// Obtiene los departamentos de un país
  Future<List<String>> getDepartments(String country);
  
  /// Obtiene los municipios de un departamento
  Future<List<String>> getMunicipalities(String country, String department);
}
