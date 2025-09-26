import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../shared/providers/repository_providers.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/create_user.dart';
import '../../domain/usecases/get_users.dart';
import '../../domain/usecases/get_user_by_id.dart';

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
  return UserFormNotifier(ref.watch(createUserUseCaseProvider));
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
  UserFormNotifier(this._createUserUseCase) : super(const UserFormState());

  final CreateUser _createUserUseCase;

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
