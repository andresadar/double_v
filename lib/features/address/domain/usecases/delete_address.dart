import '../../../../core/usecases/usecase.dart';
import '../repositories/address_repository.dart';

/// Use case para eliminar una dirección
class DeleteAddress implements UseCase<void, String> {
  const DeleteAddress(this.repository);

  final AddressRepository repository;

  @override
  Future<void> call(String addressId) async {
    return await repository.deleteAddress(addressId);
  }
}