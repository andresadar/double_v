/// Constantes generales de la aplicación
class AppConstants {
  // Hive Box Names
  static const String userBoxName = 'users';
  static const String addressBoxName = 'addresses';
  
  // API URLs (para futuras implementaciones con países/departamentos)
  static const String baseUrl = 'https://api.example.com';
  
  // Validation Messages
  static const String requiredFieldMessage = 'Este campo es obligatorio';
  static const String invalidDateMessage = 'Fecha inválida';
  static const String invalidNameMessage = 'El nombre debe tener al menos 2 caracteres';
  
  // Date Formats
  static const String dateFormat = 'dd/MM/yyyy';
  
  AppConstants._();
}
