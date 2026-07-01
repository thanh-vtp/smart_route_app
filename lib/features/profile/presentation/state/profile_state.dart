import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(true) bool isLoading,
    @Default(false) bool isUpdatingProfile, // Trạng thái khi cập nhật tên
    @Default(true) bool isPushEnabled,
    @Default(false) bool isDarkMode, // Có thể lưu vào SharedPreferences sau
    @Default('Ô tô') String vehicleType, // Có thể lưu vào SharedPreferences sau
    String? errorMessage,
    String? successMessage,
  }) = _ProfileState;
}
