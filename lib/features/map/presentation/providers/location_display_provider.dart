import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_display_provider.g.dart';

/// Provider để quản lý trạng thái LocationDisplay (GPS)
@Riverpod(keepAlive: true)
class LocationDisplayProvider extends _$LocationDisplayProvider {
  @override
  bool build() {
    return false; // Mặc định tắt
  }

  /// Bật LocationDisplay
  void enable() {
    state = true;
  }

  /// Tắt LocationDisplay
  void disable() {
    state = false;
  }

  /// Toggle LocationDisplay
  void toggle() {
    state = !state;
  }
}
