import 'package:shared_preferences/shared_preferences.dart';

/// Repository quản lý việc lưu trữ và đọc theme mode từ local storage
class ThemeRepository {
  static const String _themeKey = 'app_theme_mode'; // key lưu theme

  final SharedPreferences _prefs;

  ThemeRepository(this._prefs);

  /// Lưu theme mode vào SharedPreferences
  /// [isDarkMode] - true: dark mode, false: light mode
  Future<void> saveThemeMode(bool isDarkMode) async {
    await _prefs.setBool(_themeKey, isDarkMode);
  }

  /// Đọc theme mode từ SharedPreferences
  /// Trả về null nếu chưa có setting (sẽ dùng system default)
  bool? getThemeMode() {
    return _prefs.getBool(_themeKey);
  }

  /// Xóa setting theme mode (về system default)
  Future<void> clearThemeMode() async {
    await _prefs.remove(_themeKey);
  }
}
