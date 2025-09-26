import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_utils.dart' as app_utils;
import '../providers/user_provider.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/date_picker_field.dart';

/// Página para crear o editar usuarios
class UserFormPage extends ConsumerStatefulWidget {
  const UserFormPage({super.key, this.userId});

  final String? userId; // null = crear, no null = editar

  @override
  ConsumerState<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends ConsumerState<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  DateTime? _selectedDate;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Si estamos editando, cargar los datos del usuario
    if (widget.userId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _loadUserData();
      });
    } else {
      _isInitialized = true;
    }
  }

  void _loadUserData() async {
    if (widget.userId != null && !_isInitialized) {
      final userAsyncValue = ref.read(userByIdProvider(widget.userId!));
      userAsyncValue.whenData((user) {
        if (user != null && mounted) {
          setState(() {
            _firstNameController.text = user.firstName;
            _lastNameController.text = user.lastName;
            _selectedDate = user.birthDate;
            _isInitialized = true;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(userFormProvider);
    
    // Si estamos cargando datos del usuario para editar
    if (widget.userId != null && !_isInitialized) {
      final userAsyncValue = ref.watch(userByIdProvider(widget.userId!));
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cargando...'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: userAsyncValue.when(
          data: (user) {
            if (user != null && !_isInitialized) {
              // Cargar datos una sola vez
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    _firstNameController.text = user.firstName;
                    _lastNameController.text = user.lastName;
                    _selectedDate = user.birthDate;
                    _isInitialized = true;
                  });
                }
              });
            }
            return const Center(child: CircularProgressIndicator());
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: $error'),
                ElevatedButton(
                  onPressed: () => context.pop(),
                  child: const Text('Volver'),
                ),
              ],
            ),
          ),
        ),
      );
    }
    
    // Escuchar cambios de estado para navegar cuando se complete
    ref.listen(userFormProvider, (previous, next) {
      if (next.isSuccess && previous?.isSuccess != true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.userId != null 
                ? 'Usuario actualizado exitosamente' 
                : 'Usuario creado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        // Resetear el formulario
        ref.read(userFormProvider.notifier).resetForm();
        // Navegar de vuelta
        if (context.mounted) {
          context.pop();
        }
      } else if (next.errorMessage != null && previous?.errorMessage != next.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userId != null ? 'Editar Usuario' : 'Crear Usuario'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: _firstNameController,
                labelText: 'Nombres',
                hintText: 'Ingresa tus nombres',
                prefixIcon: Icons.person_outline,
                validator: (value) {
                  if (!app_utils.ValidationUtils.isNotEmpty(value)) {
                    return 'El nombre es obligatorio';
                  }
                  if (!app_utils.ValidationUtils.isValidName(value)) {
                    return 'El nombre debe tener al menos 2 caracteres y solo letras';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _lastNameController,
                labelText: 'Apellidos',
                hintText: 'Ingresa tus apellidos',
                prefixIcon: Icons.person_outline,
                validator: (value) {
                  if (!app_utils.ValidationUtils.isNotEmpty(value)) {
                    return 'El apellido es obligatorio';
                  }
                  if (!app_utils.ValidationUtils.isValidName(value)) {
                    return 'El apellido debe tener al menos 2 caracteres y solo letras';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DatePickerField(
                labelText: 'Fecha de Nacimiento',
                hintText: 'Selecciona tu fecha de nacimiento',
                selectedDate: _selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
                validator: (date) {
                  if (date == null) {
                    return 'La fecha de nacimiento es obligatoria';
                  }
                  if (!app_utils.DateUtils.isValidBirthDate(date)) {
                    return 'Fecha de nacimiento inválida';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: formState.isLoading ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: formState.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        widget.userId != null ? 'Actualizar Usuario' : 'Crear Usuario',
                        style: const TextStyle(fontSize: 16),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (widget.userId != null) {
        // Editar usuario existente
        ref.read(userFormProvider.notifier).updateUser(
          id: widget.userId!,
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          birthDate: _selectedDate!,
        );
      } else {
        // Crear nuevo usuario
        ref.read(userFormProvider.notifier).createUser(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          birthDate: _selectedDate!,
        );
      }
    }
  }
}
