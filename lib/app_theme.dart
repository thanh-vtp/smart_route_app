import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const ColorScheme _lightColorScheme = ColorScheme(
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

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    // Primary lấy từ Inverse Primary của Light (Xanh nhạt pastel)
    primary: Color(0xFFA8C8FF),
    onPrimary: Color(0xFF003265), // Đảo ngược lại
    primaryContainer: Color(0xFF00468A), // Xanh dương đậm làm nền thẻ
    onPrimaryContainer: Color(0xFFD6E3FF), // Chữ xanh nhạt trên thẻ
    // Secondary
    secondary: Color(0xFFBEC7DB),
    onSecondary: Color(0xFF283141),
    secondaryContainer: Color(0xFF3E4758),
    onSecondaryContainer: Color(0xFFDAE3F8),

    // Tertiary (Teal)
    tertiary: Color(0xFF92D2D1),
    onTertiary: Color(0xFF003838),
    tertiaryContainer: Color(0xFF004F4F),
    onTertiaryContainer: Color(0xFFAEEEED),

    // Error (Đỏ) - Đỏ nhạt để tránh chói
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),

    // Surfaces & Background (Dùng màu than tối từ OnSurface của Light)
    background: Color(0xFF191C1D),
    onBackground: Color(0xFFE1E3E4),
    surface: Color(0xFF191C1D), // Nền chính của App
    onSurface: Color(0xFFE1E3E4), // Chữ trắng xám
    surfaceVariant: Color(0xFF424752), // Thẻ (Card) sáng hơn nền một chút
    onSurfaceVariant: Color(0xFFC2C6D4),
    outline: Color(0xFF8C919E),
    outlineVariant: Color(0xFF424752),

    // Inverse
    inverseSurface: Color(0xFFE1E3E4),
    onInverseSurface: Color(0xFF191C1D),
    inversePrimary: Color(0xFF003265),
    surfaceTint: Color(0xFFA8C8FF),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      scaffoldBackgroundColor: _lightColorScheme.surface,
      textTheme: GoogleFonts.interTextTheme(Typography.material2021().black),
      appBarTheme: AppBarTheme(
        backgroundColor: _lightColorScheme.surface,
        foregroundColor: _lightColorScheme.onSurface,
        elevation: 0,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      scaffoldBackgroundColor: _darkColorScheme.surface,
      // Dùng font Inter dùng màu trắng mặc định (cho nền tối)
      textTheme: GoogleFonts.interTextTheme(Typography.material2021().white),
      appBarTheme: AppBarTheme(
        backgroundColor: _darkColorScheme.surface,
        foregroundColor: _darkColorScheme.onSurface,
        elevation: 0,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        // Bottom Sheet chuẩn MD3 Dark
        backgroundColor: _darkColorScheme.surfaceVariant,
        modalBackgroundColor: _darkColorScheme.surfaceVariant,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        ),
      ),
    );
  }
}
