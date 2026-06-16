import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/common/data/theme_repository.dart';

part 'theme_provider.g.dart';

/// Provider cho ThemeRepository
@riverpod
ThemeRepository themeRepository(ThemeRepositoryRef ref) {
  // SharedPreferences sẽ được init từ main.dart
  throw UnimplementedError('ThemeRepository must be overridden in main.dart');
}

/// State notifier cho theme mode
@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    // Đọc theme mode từ repository khi khởi tạo
    final repository = ref.watch(themeRepositoryProvider);
    final savedMode = repository.getThemeMode();

    if (savedMode == null) {
      return ThemeMode.system; // Mặc định theo system
    }

    return savedMode ? ThemeMode.dark : ThemeMode.light;
  }

  /// Chuyển sang dark mode
  Future<void> setDarkMode() async {
    final repository = ref.read(themeRepositoryProvider);
    await repository.saveThemeMode(true);
    state = ThemeMode.dark;
  }

  /// Chuyển sang light mode
  Future<void> setLightMode() async {
    final repository = ref.read(themeRepositoryProvider);
    await repository.saveThemeMode(false);
    state = ThemeMode.light;
  }

  /// Chuyển về system default
  Future<void> setSystemMode() async {
    final repository = ref.read(themeRepositoryProvider);
    await repository.clearThemeMode();
    state = ThemeMode.system;
  }

  /// Chuyển đổi giữa light và dark mode
  Future<void> toggleTheme() async {
    if (state == ThemeMode.dark) {
      await setLightMode();
    } else {
      await setDarkMode();
    }
  }

  /// Set theme mode trực tiếp
  Future<void> setThemeMode(ThemeMode mode) async {
    final repository = ref.read(themeRepositoryProvider);

    switch (mode) {
      case ThemeMode.light:
        await repository.saveThemeMode(false);
        break;
      case ThemeMode.dark:
        await repository.saveThemeMode(true);
        break;
      case ThemeMode.system:
        await repository.clearThemeMode();
        break;
    }

    state = mode;
  }
}
