import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';

part 'location_display_providers.g.dart';

/// Provider để quản lý trạng thái LocationDisplay (GPS)
@Riverpod(keepAlive: true)
class LocationDisplayProvider extends _$LocationDisplayProvider {
  static const _prefsKey = 'is_location_enabled';

  @override
  bool build() {
    // 1. Khởi tạo với giá trị mặc định là false
    // 2. Gọi hàm load async ngay lập tức
    _loadPersistedState();
    return false; // Mặc định tắt
  }

  /// Load trạng thái đã lưu từ SharedPreferences
  Future<void> _loadPersistedState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedState = prefs.getBool(_prefsKey) ?? false;

      // Nếu trạng thái đã lưu khác với trạng thái hiện tại (false)
      // thì cập nhật state. Việc này sẽ trigger listener bên MapPage
      if (savedState != state) {
        state = savedState;
        AppLogger.ui('Loaded persisted location state: $state');
      }
    } catch (e) {
      AppLogger.ui('Error loading location state: $e');
    }
  }

  /// Bật/Tắt và lưu vào máy
  Future<void> toggle() async {
    state = !state;
    await _persistState(state);
  }

  /// Bật và lưu
  Future<void> enable() async {
    if (!state) {
      state = true;
      await _persistState(true);
    }
  }

  /// Tắt và lưu
  Future<void> disable() async {
    if (state) {
      state = false;
      await _persistState(false);
    }
  }

  /// Helper để lưu xuống disk
  Future<void> _persistState(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefsKey, value);
      AppLogger.ui('Persisted location state: $value');
    } catch (e) {
      AppLogger.ui('Error saving location state: $e');
    }
  }
}
