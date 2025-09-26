import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/address.dart';
import '../repositories/address_repository.dart';

/// Parámetros para obtener direcciones por ID de usuario
class GetAddressesByUserIdParams extends Equatable {
  const GetAddressesByUserIdParams(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

/// Caso de uso para obtener direcciones de un usuario
class GetAddressesByUserId implements UseCase<List<Address>, GetAddressesByUserIdParams> {
  const GetAddressesByUserId(this._repository);

  final AddressRepository _repository;

  @override
  Future<List<Address>> call(GetAddressesByUserIdParams params) async {
    return await _repository.getAddressesByUserId(params.userId);
  }
}
