import 'package:flutter/material.dart';

/// Colores personalizados para la aplicación DoubleV
class AppColors {
  AppColors._();

  // Colores primarios - Paleta moderna Purple/Violet
  static const Color primary = Color(0xFF7C3AED); // Violet 600
  static const Color primaryLight = Color(0xFF8B5CF6); // Violet 500
  static const Color primaryDark = Color(0xFF6D28D9); // Violet 700

  // Colores secundarios - Teal/Cyan complementario
  static const Color secondary = Color(0xFF0891B2); // Cyan 600
  static const Color secondaryLight = Color(0xFF06B6D4); // Cyan 500
  static const Color secondaryDark = Color(0xFF0E7490); // Cyan 700

  // Colores neutros
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Colores de estado - Más vibrantes
  static const Color success = Color(0xFF059669); // Green 600
  static const Color warning = Color(0xFFD97706); // Amber 600
  static const Color error = Color(0xFFDC2626); // Red 600
  static const Color info = Color(0xFF2563EB); // Blue 600

  // Fondos de estado - Tonos suaves
  static const Color successBackground = Color(0xFFD1FAE5);
  static const Color warningBackground = Color(0xFFFEF3C7);
  static const Color errorBackground = Color(0xFFFEE2E2);
  static const Color infoBackground = Color(0xFFDEF7FF);

  // Colores de superficie
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF8FAFC);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardBorder = Color(0xFFE2E8F0);
  static const Color background = Color(0xFFFFFFFF);

  // Colores de texto
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);

  // Divisor
  static const Color divider = Color(0xFFE5E7EB);

  // Accent
  static const Color accent = Color(0xFF8B5CF6);

  // Gradientes actualizados
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFAF5FF), // Violet 50
      Color(0xFFF3E8FF), // Violet 100
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white,
      Color(0xFFFAF5FF), // Violet 50
    ],
  );

  // Colores específicos para funcionalidad
  static const Color floatingActionButtonBackground = primary;
  static const Color appBarBackground = Colors.transparent;
  static const Color navigationBarBackground = white;

  // Sombras
  static const Color shadowLight = Color(0x0D000000); // 5% opacidad
  static const Color shadowMedium = Color(0x1A000000); // 10% opacidad
  static const Color shadowDark = Color(0x33000000); // 20% opacidad
}
