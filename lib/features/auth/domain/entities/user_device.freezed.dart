// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDevice {
  String get userId => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String? get deviceName => throw _privateConstructorUsedError;
  String? get deviceType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDeviceCopyWith<UserDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceCopyWith<$Res> {
  factory $UserDeviceCopyWith(
          UserDevice value, $Res Function(UserDevice) then) =
      _$UserDeviceCopyWithImpl<$Res, UserDevice>;
  @useResult
  $Res call(
      {String userId,
      String fcmToken,
      String deviceId,
      String? deviceName,
      String? deviceType});
}

/// @nodoc
class _$UserDeviceCopyWithImpl<$Res, $Val extends UserDevice>
    implements $UserDeviceCopyWith<$Res> {
  _$UserDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceName = freezed,
    Object? deviceType = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDeviceImplCopyWith<$Res>
    implements $UserDeviceCopyWith<$Res> {
  factory _$$UserDeviceImplCopyWith(
          _$UserDeviceImpl value, $Res Function(_$UserDeviceImpl) then) =
      __$$UserDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String fcmToken,
      String deviceId,
      String? deviceName,
      String? deviceType});
}

/// @nodoc
class __$$UserDeviceImplCopyWithImpl<$Res>
    extends _$UserDeviceCopyWithImpl<$Res, _$UserDeviceImpl>
    implements _$$UserDeviceImplCopyWith<$Res> {
  __$$UserDeviceImplCopyWithImpl(
      _$UserDeviceImpl _value, $Res Function(_$UserDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceName = freezed,
    Object? deviceType = freezed,
  }) {
    return _then(_$UserDeviceImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserDeviceImpl implements _UserDevice {
  const _$UserDeviceImpl(
      {required this.userId,
      required this.fcmToken,
      required this.deviceId,
      this.deviceName,
      this.deviceType});

  @override
  final String userId;
  @override
  final String fcmToken;
  @override
  final String deviceId;
  @override
  final String? deviceName;
  @override
  final String? deviceType;

  @override
  String toString() {
    return 'UserDevice(userId: $userId, fcmToken: $fcmToken, deviceId: $deviceId, deviceName: $deviceName, deviceType: $deviceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDeviceImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, userId, fcmToken, deviceId, deviceName, deviceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeviceImplCopyWith<_$UserDeviceImpl> get copyWith =>
      __$$UserDeviceImplCopyWithImpl<_$UserDeviceImpl>(this, _$identity);
}

abstract class _UserDevice implements UserDevice {
  const factory _UserDevice(
      {required final String userId,
      required final String fcmToken,
      required final String deviceId,
      final String? deviceName,
      final String? deviceType}) = _$UserDeviceImpl;

  @override
  String get userId;
  @override
  String get fcmToken;
  @override
  String get deviceId;
  @override
  String? get deviceName;
  @override
  String? get deviceType;
  @override
  @JsonKey(ignore: true)
  _$$UserDeviceImplCopyWith<_$UserDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
