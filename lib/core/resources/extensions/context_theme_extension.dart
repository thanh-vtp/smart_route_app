import 'package:flutter/material.dart';

/// Extension for BuildContext - Theme & Style access
///
/// Quick access to app theme, text styles, and color schemes
extension ContextThemeExtension on BuildContext {
  /// Extension for quickly accessing app [TextTheme]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Extension for quickly accessing app [ColorScheme]
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Extension for quickly accessing app [Theme]
  ThemeData get theme => Theme.of(this);
}
