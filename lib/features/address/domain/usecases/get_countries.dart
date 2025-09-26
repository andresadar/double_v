import '../../../../core/usecases/usecase.dart';
import '../repositories/address_repository.dart';

/// Caso de uso para obtener países disponibles
class GetCountries implements UseCase<List<String>, NoParams> {
  const GetCountries(this._repository);

  final AddressRepository _repository;

  @override
  Future<List<String>> call(NoParams params) async {
    return await _repository.getCountries();
  }
}
