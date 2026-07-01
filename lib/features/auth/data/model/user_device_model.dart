import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_device.dart';

part 'user_device_model.freezed.dart';
part 'user_device_model.g.dart';

@freezed
abstract class UserDeviceModel with _$UserDeviceModel {
  const UserDeviceModel._();

  const factory UserDeviceModel({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'fcm_token') required String fcmToken,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'device_name') String? deviceName,
    @JsonKey(name: 'device_type') String? deviceType,
    @JsonKey(name: 'last_active_at') String? lastActiveAt,
  }) = _UserDeviceModel;

  factory UserDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceModelFromJson(json);

  Map<String, dynamic> toSupabase() {
    return toJson();
  }

  UserDevice toDomain() {
    return UserDevice(
      userId: userId,
      fcmToken: fcmToken,
      deviceId: deviceId,
      deviceName: deviceName,
      deviceType: deviceType,
    );
  }
}
