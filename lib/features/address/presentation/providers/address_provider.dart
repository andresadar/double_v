import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../shared/providers/repository_providers.dart';
import '../../domain/entities/address.dart';
import '../../domain/usecases/create_address.dart';
import '../../domain/usecases/get_addresses_by_user_id.dart';
import '../../domain/usecases/get_countries.dart';
import '../../domain/usecases/delete_address.dart';

/// Provider para el caso de uso GetAddressesByUserId
final getAddressesByUserIdUseCaseProvider = Provider<GetAddressesByUserId>((ref) {
  return GetAddressesByUserId(ref.watch(addressRepositoryProvider));
});

/// Provider para el caso de uso CreateAddress
final createAddressUseCaseProvider = Provider<CreateAddress>((ref) {
  return CreateAddress(ref.watch(addressRepositoryProvider));
});

/// Provider para el caso de uso GetCountries
final getCountriesUseCaseProvider = Provider<GetCountries>((ref) {
  return GetCountries(ref.watch(addressRepositoryProvider));
});

/// Provider para el caso de uso DeleteAddress
final deleteAddressUseCaseProvider = Provider<DeleteAddress>((ref) {
  return DeleteAddress(ref.watch(addressRepositoryProvider));
});

/// Provider que obtiene las direcciones de un usuario
final addressesByUserIdProvider = FutureProvider.family<List<Address>, String>((ref, userId) async {
  final getAddressesUseCase = ref.watch(getAddressesByUserIdUseCaseProvider);
  return await getAddressesUseCase(GetAddressesByUserIdParams(userId));
});

/// Provider que obtiene los países disponibles
final countriesProvider = FutureProvider<List<String>>((ref) async {
  final getCountriesUseCase = ref.watch(getCountriesUseCaseProvider);
  return await getCountriesUseCase(NoParams());
});

/// Provider para el estado del formulario de dirección
final addressFormProvider = StateNotifierProvider<AddressFormNotifier, AddressFormState>((ref) {
  return AddressFormNotifier(ref.watch(createAddressUseCaseProvider), ref);
});

/// Provider para manejar la eliminación de direcciones
final deleteAddressProvider = StateNotifierProvider<DeleteAddressNotifier, AsyncValue<void>>((ref) {
  return DeleteAddressNotifier(ref.watch(deleteAddressUseCaseProvider), ref);
});

/// Estado del formulario de dirección
class AddressFormState {
  const AddressFormState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  AddressFormState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return AddressFormState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

/// Notifier para manejar el estado del formulario de dirección
class AddressFormNotifier extends StateNotifier<AddressFormState> {
  AddressFormNotifier(this._createAddressUseCase, this._ref) : super(const AddressFormState());

  final CreateAddress _createAddressUseCase;
  final Ref _ref;

  Future<void> createAddress({
    required String userId,
    required String country,
    required String department,
    required String municipality,
    required String street,
    String? additionalInfo,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _createAddressUseCase(CreateAddressParams(
        userId: userId,
        country: country,
        department: department,
        municipality: municipality,
        street: street,
        additionalInfo: additionalInfo,
      ));
      
      // Invalidar los providers de direcciones para que se actualicen
      _ref.invalidate(addressesByUserIdProvider);
      
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  void resetForm() {
    state = const AddressFormState();
  }
}

/// Notifier para manejar la eliminación de direcciones
class DeleteAddressNotifier extends StateNotifier<AsyncValue<void>> {
  DeleteAddressNotifier(this._deleteAddressUseCase, this._ref) : super(const AsyncValue.data(null));

  final DeleteAddress _deleteAddressUseCase;
  final Ref _ref;

  Future<void> deleteAddress(String addressId) async {
    state = const AsyncValue.loading();

    try {
      await _deleteAddressUseCase(addressId);
      
      // Invalidar el provider de direcciones para que se actualice la lista
      _ref.invalidate(addressesByUserIdProvider);
      
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
