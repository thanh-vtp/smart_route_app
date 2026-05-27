// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDeviceModel _$UserDeviceModelFromJson(Map<String, dynamic> json) {
  return _UserDeviceModel.fromJson(json);
}

/// @nodoc
mixin _$UserDeviceModel {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcm_token')
  String get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_id')
  String get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_name')
  String? get deviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_type')
  String? get deviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_active_at')
  String? get lastActiveAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDeviceModelCopyWith<UserDeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceModelCopyWith<$Res> {
  factory $UserDeviceModelCopyWith(
          UserDeviceModel value, $Res Function(UserDeviceModel) then) =
      _$UserDeviceModelCopyWithImpl<$Res, UserDeviceModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'fcm_token') String fcmToken,
      @JsonKey(name: 'device_id') String deviceId,
      @JsonKey(name: 'device_name') String? deviceName,
      @JsonKey(name: 'device_type') String? deviceType,
      @JsonKey(name: 'last_active_at') String? lastActiveAt});
}

/// @nodoc
class _$UserDeviceModelCopyWithImpl<$Res, $Val extends UserDeviceModel>
    implements $UserDeviceModelCopyWith<$Res> {
  _$UserDeviceModelCopyWithImpl(this._value, this._then);

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
    Object? lastActiveAt = freezed,
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
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDeviceModelImplCopyWith<$Res>
    implements $UserDeviceModelCopyWith<$Res> {
  factory _$$UserDeviceModelImplCopyWith(_$UserDeviceModelImpl value,
          $Res Function(_$UserDeviceModelImpl) then) =
      __$$UserDeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'fcm_token') String fcmToken,
      @JsonKey(name: 'device_id') String deviceId,
      @JsonKey(name: 'device_name') String? deviceName,
      @JsonKey(name: 'device_type') String? deviceType,
      @JsonKey(name: 'last_active_at') String? lastActiveAt});
}

/// @nodoc
class __$$UserDeviceModelImplCopyWithImpl<$Res>
    extends _$UserDeviceModelCopyWithImpl<$Res, _$UserDeviceModelImpl>
    implements _$$UserDeviceModelImplCopyWith<$Res> {
  __$$UserDeviceModelImplCopyWithImpl(
      _$UserDeviceModelImpl _value, $Res Function(_$UserDeviceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceName = freezed,
    Object? deviceType = freezed,
    Object? lastActiveAt = freezed,
  }) {
    return _then(_$UserDeviceModelImpl(
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
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDeviceModelImpl extends _UserDeviceModel {
  const _$UserDeviceModelImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'fcm_token') required this.fcmToken,
      @JsonKey(name: 'device_id') required this.deviceId,
      @JsonKey(name: 'device_name') this.deviceName,
      @JsonKey(name: 'device_type') this.deviceType,
      @JsonKey(name: 'last_active_at') this.lastActiveAt})
      : super._();

  factory _$UserDeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDeviceModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'fcm_token')
  final String fcmToken;
  @override
  @JsonKey(name: 'device_id')
  final String deviceId;
  @override
  @JsonKey(name: 'device_name')
  final String? deviceName;
  @override
  @JsonKey(name: 'device_type')
  final String? deviceType;
  @override
  @JsonKey(name: 'last_active_at')
  final String? lastActiveAt;

  @override
  String toString() {
    return 'UserDeviceModel(userId: $userId, fcmToken: $fcmToken, deviceId: $deviceId, deviceName: $deviceName, deviceType: $deviceType, lastActiveAt: $lastActiveAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDeviceModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, fcmToken, deviceId,
      deviceName, deviceType, lastActiveAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeviceModelImplCopyWith<_$UserDeviceModelImpl> get copyWith =>
      __$$UserDeviceModelImplCopyWithImpl<_$UserDeviceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDeviceModelImplToJson(
      this,
    );
  }
}

abstract class _UserDeviceModel extends UserDeviceModel {
  const factory _UserDeviceModel(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'fcm_token') required final String fcmToken,
          @JsonKey(name: 'device_id') required final String deviceId,
          @JsonKey(name: 'device_name') final String? deviceName,
          @JsonKey(name: 'device_type') final String? deviceType,
          @JsonKey(name: 'last_active_at') final String? lastActiveAt}) =
      _$UserDeviceModelImpl;
  const _UserDeviceModel._() : super._();

  factory _UserDeviceModel.fromJson(Map<String, dynamic> json) =
      _$UserDeviceModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'fcm_token')
  String get fcmToken;
  @override
  @JsonKey(name: 'device_id')
  String get deviceId;
  @override
  @JsonKey(name: 'device_name')
  String? get deviceName;
  @override
  @JsonKey(name: 'device_type')
  String? get deviceType;
  @override
  @JsonKey(name: 'last_active_at')
  String? get lastActiveAt;
  @override
  @JsonKey(ignore: true)
  _$$UserDeviceModelImplCopyWith<_$UserDeviceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
