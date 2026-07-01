// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDeviceModel _$UserDeviceModelFromJson(Map<String, dynamic> json) =>
    _UserDeviceModel(
      userId: json['user_id'] as String,
      fcmToken: json['fcm_token'] as String,
      deviceId: json['device_id'] as String,
      deviceName: json['device_name'] as String?,
      deviceType: json['device_type'] as String?,
      lastActiveAt: json['last_active_at'] as String?,
    );

Map<String, dynamic> _$UserDeviceModelToJson(_UserDeviceModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'fcm_token': instance.fcmToken,
      'device_id': instance.deviceId,
      'device_name': instance.deviceName,
      'device_type': instance.deviceType,
      'last_active_at': instance.lastActiveAt,
    };
