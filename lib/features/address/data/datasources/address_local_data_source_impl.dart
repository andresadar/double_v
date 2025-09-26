import 'package:hive/hive.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/hive_config.dart';
import '../models/address_model.dart';
import 'address_data_sources.dart';

/// Implementación de AddressLocalDataSource usando Hive
class AddressLocalDataSourceImpl implements AddressLocalDataSource {
  AddressLocalDataSourceImpl();

  Box<AddressModel> get _box => HiveConfig.getAddressBox();

  @override
  Future<List<AddressModel>> getAddressesByUserId(String userId) async {
    try {
      return _box.values.where((address) => address.userId == userId).toList();
    } catch (e) {
      throw CacheException('Error al obtener direcciones: ${e.toString()}');
    }
  }

  @override
  Future<AddressModel?> getAddressById(String id) async {
    try {
      return _box.values.firstWhere(
        (address) => address.id == id,
        orElse: () => throw NotFoundException('Dirección no encontrada'),
      );
    } on NotFoundException {
      return null;
    } catch (e) {
      throw CacheException('Error al obtener dirección: ${e.toString()}');
    }
  }

  @override
  Future<void> createAddress(AddressModel address) async {
    try {
      await _box.put(address.id, address);
    } catch (e) {
      throw CacheException('Error al crear dirección: ${e.toString()}');
    }
  }

  @override
  Future<void> updateAddress(AddressModel address) async {
    try {
      if (!_box.containsKey(address.id)) {
        throw NotFoundException('Dirección no encontrada para actualizar');
      }
      await _box.put(address.id, address);
    } catch (e) {
      if (e is NotFoundException) rethrow;
      throw CacheException('Error al actualizar dirección: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteAddress(String id) async {
    try {
      if (!_box.containsKey(id)) {
        throw NotFoundException('Dirección no encontrada para eliminar');
      }
      await _box.delete(id);
    } catch (e) {
      if (e is NotFoundException) rethrow;
      throw CacheException('Error al eliminar dirección: ${e.toString()}');
    }
  }

  @override
  Future<List<AddressModel>> getAllAddresses() async {
    try {
      return _box.values.toList();
    } catch (e) {
      throw CacheException('Error al obtener todas las direcciones: ${e.toString()}');
    }
  }
}
