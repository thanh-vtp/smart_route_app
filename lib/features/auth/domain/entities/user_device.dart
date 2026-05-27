import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device.freezed.dart';

@freezed
class UserDevice with _$UserDevice {
  const factory UserDevice({
    required String userId,
    required String fcmToken,
    required String deviceId,
    String? deviceName,
    String? deviceType,
  }) = _UserDevice;
}
