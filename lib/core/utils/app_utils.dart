import 'package:intl/intl.dart';

/// Utilidades para fechas
class DateUtils {
  static const String _dateFormat = 'dd/MM/yyyy';
  
  /// Convierte un DateTime a String en formato dd/MM/yyyy
  static String dateToString(DateTime date) {
    return DateFormat(_dateFormat).format(date);
  }
  
  /// Convierte un String en formato dd/MM/yyyy a DateTime
  static DateTime? stringToDate(String dateString) {
    try {
      return DateFormat(_dateFormat).parse(dateString);
    } catch (e) {
      return null;
    }
  }
  
  /// Valida si una fecha es válida y no es futura
  static bool isValidBirthDate(DateTime? date) {
    if (date == null) return false;
    final now = DateTime.now();
    return date.isBefore(now) && date.isAfter(DateTime(1900));
  }
}

/// Utilidades para validación
class ValidationUtils {
  /// Valida que el nombre tenga al menos 2 caracteres y solo letras
  static bool isValidName(String? name) {
    if (name == null || name.trim().isEmpty) return false;
    return name.trim().length >= 2 && RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(name.trim());
  }
  
  /// Valida que el campo no esté vacío
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
}
