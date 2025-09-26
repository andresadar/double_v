import '../models/address_model.dart';

/// Data source abstracto para direcciones locales
abstract class AddressLocalDataSource {
  Future<List<AddressModel>> getAddressesByUserId(String userId);
  Future<AddressModel?> getAddressById(String id);
  Future<void> createAddress(AddressModel address);
  Future<void> updateAddress(AddressModel address);
  Future<void> deleteAddress(String id);
  Future<List<AddressModel>> getAllAddresses();
}

/// Data source abstracto para datos remotos de ubicación
abstract class LocationRemoteDataSource {
  Future<List<String>> getCountries();
  Future<List<String>> getDepartments(String country);
  Future<List<String>> getMunicipalities(String country, String department);
}
