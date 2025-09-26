import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../shared/providers/repository_providers.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/create_user.dart';
import '../../domain/usecases/get_users.dart';
import '../../domain/usecases/get_user_by_id.dart';
import '../../domain/usecases/delete_user.dart';

/// Provider para el caso de uso GetUsers
final getUsersUseCaseProvider = Provider<GetUsers>((ref) {
  return GetUsers(ref.watch(userRepositoryProvider));
});

/// Provider para el caso de uso CreateUser
final createUserUseCaseProvider = Provider<CreateUser>((ref) {
  return CreateUser(ref.watch(userRepositoryProvider));
});

/// Provider para el caso de uso GetUserById
final getUserByIdUseCaseProvider = Provider<GetUserById>((ref) {
  return GetUserById(ref.watch(userRepositoryProvider));
});

/// Provider para el caso de uso DeleteUser
final deleteUserUseCaseProvider = Provider<DeleteUser>((ref) {
  return DeleteUser(ref.watch(userRepositoryProvider));
});

/// Provider que obtiene la lista de usuarios
final usersProvider = FutureProvider<List<User>>((ref) async {
  final getUsersUseCase = ref.watch(getUsersUseCaseProvider);
  return await getUsersUseCase(NoParams());
});

/// Provider que obtiene un usuario específico por ID
final userByIdProvider = FutureProvider.family<User?, String>((ref, userId) async {
  final getUserByIdUseCase = ref.watch(getUserByIdUseCaseProvider);
  return await getUserByIdUseCase(GetUserByIdParams(userId));
});

/// Provider para el estado del formulario de usuario
final userFormProvider = StateNotifierProvider<UserFormNotifier, UserFormState>((ref) {
  return UserFormNotifier(ref.watch(createUserUseCaseProvider), ref);
});

/// Provider para manejar la eliminación de usuarios
final deleteUserProvider = StateNotifierProvider<DeleteUserNotifier, AsyncValue<void>>((ref) {
  return DeleteUserNotifier(ref.watch(deleteUserUseCaseProvider), ref);
});

/// Estado del formulario de usuario
class UserFormState {
  const UserFormState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  UserFormState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return UserFormState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

/// Notifier para manejar el estado del formulario de usuario
class UserFormNotifier extends StateNotifier<UserFormState> {
  UserFormNotifier(this._createUserUseCase, this._ref) : super(const UserFormState());

  final CreateUser _createUserUseCase;
  final Ref _ref;

  Future<void> createUser({
    required String firstName,
    required String lastName,
    required DateTime birthDate,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _createUserUseCase(CreateUserParams(
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
      ));
      
      // Invalidar el provider de usuarios para que se actualice la lista
      _ref.invalidate(usersProvider);
      
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  void resetForm() {
    state = const UserFormState();
  }
}

/// Notifier para manejar la eliminación de usuarios
class DeleteUserNotifier extends StateNotifier<AsyncValue<void>> {
  DeleteUserNotifier(this._deleteUserUseCase, this._ref) : super(const AsyncValue.data(null));

  final DeleteUser _deleteUserUseCase;
  final Ref _ref;

  Future<void> deleteUser(String userId) async {
    state = const AsyncValue.loading();

    try {
      await _deleteUserUseCase(userId);
      
      // Invalidar el provider de usuarios para que se actualice la lista
      _ref.invalidate(usersProvider);
      
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
