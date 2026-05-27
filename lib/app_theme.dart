import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF003265),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF005FB8),
    onPrimaryContainer: Color(0xFFCADCFF),
    secondary: Color(0xFF565F71),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD7E0F5),
    onSecondaryContainer: Color(0xFF5A6375),
    tertiary: Color(0xFF003838),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF036B6B),
    onTertiaryContainer: Color(0xFF98E9E8),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF93000A),
    background: Color(0xFFF8F9FA),
    onBackground: Color(0xFF191C1D),
    surface: Color(0xFFF8F9FA),
    onSurface: Color(0xFF191C1D),
    surfaceVariant: Color(0xFFE1E3E4),
    onSurfaceVariant: Color(0xFF424752),
    outline: Color(0xFF727783),
    outlineVariant: Color(0xFFC2C6D4),
    inverseSurface: Color(0xFF2E3132),
    onInverseSurface: Color(0xFFF0F1F2),
    inversePrimary: Color(0xFFA8C8FF),
    surfaceTint: Color(0xFF295EA4),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: lightColorScheme.surface,
      textTheme: GoogleFonts.interTextTheme(),
    );
  }
}
