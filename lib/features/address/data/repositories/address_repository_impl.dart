import '../../domain/entities/address.dart';
import '../../domain/repositories/address_repository.dart';
import '../datasources/address_data_sources.dart';
import '../models/address_model.dart';

/// Implementación concreta de AddressRepository
/// Maneja tanto datos locales como remotos
class AddressRepositoryImpl implements AddressRepository {
  const AddressRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final AddressLocalDataSource localDataSource;
  final LocationRemoteDataSource remoteDataSource;

  @override
  Future<List<Address>> getAddressesByUserId(String userId) async {
    final addressModels = await localDataSource.getAddressesByUserId(userId);
    return addressModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Address?> getAddressById(String id) async {
    final addressModel = await localDataSource.getAddressById(id);
    return addressModel?.toEntity();
  }

  @override
  Future<void> createAddress(Address address) async {
    final addressModel = AddressModel.fromEntity(address);
    await localDataSource.createAddress(addressModel);
  }

  @override
  Future<void> updateAddress(Address address) async {
    final addressModel = AddressModel.fromEntity(address);
    await localDataSource.updateAddress(addressModel);
  }

  @override
  Future<void> deleteAddress(String id) async {
    await localDataSource.deleteAddress(id);
  }

  @override
  Future<List<Address>> getAllAddresses() async {
    final addressModels = await localDataSource.getAllAddresses();
    return addressModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<String>> getCountries() async {
    return await remoteDataSource.getCountries();
  }

  @override
  Future<List<String>> getDepartments(String country) async {
    return await remoteDataSource.getDepartments(country);
  }

  @override
  Future<List<String>> getMunicipalities(String country, String department) async {
    return await remoteDataSource.getMunicipalities(country, department);
  }
}
