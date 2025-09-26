import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/address.dart';
import '../repositories/address_repository.dart';

/// Parámetros para crear una dirección
class CreateAddressParams extends Equatable {
  const CreateAddressParams({
    required this.userId,
    required this.country,
    required this.department,
    required this.municipality,
    required this.street,
    this.additionalInfo,
  });

  final String userId;
  final String country;
  final String department;
  final String municipality;
  final String street;
  final String? additionalInfo;

  @override
  List<Object?> get props => [
    userId,
    country,
    department,
    municipality,
    street,
    additionalInfo,
  ];
}

/// Caso de uso para crear una dirección
class CreateAddress implements UseCase<void, CreateAddressParams> {
  const CreateAddress(this._repository);

  final AddressRepository _repository;

  @override
  Future<void> call(CreateAddressParams params) async {
    final address = Address(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: params.userId,
      country: params.country,
      department: params.department,
      municipality: params.municipality,
      street: params.street,
      additionalInfo: params.additionalInfo,
    );

    return await _repository.createAddress(address);
  }
}
