// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserDevice {

 String get userId; String get fcmToken; String get deviceId; String? get deviceName; String? get deviceType;
/// Create a copy of UserDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDeviceCopyWith<UserDevice> get copyWith => _$UserDeviceCopyWithImpl<UserDevice>(this as UserDevice, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDevice&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType));
}


@override
int get hashCode => Object.hash(runtimeType,userId,fcmToken,deviceId,deviceName,deviceType);

@override
String toString() {
  return 'UserDevice(userId: $userId, fcmToken: $fcmToken, deviceId: $deviceId, deviceName: $deviceName, deviceType: $deviceType)';
}


}

/// @nodoc
abstract mixin class $UserDeviceCopyWith<$Res>  {
  factory $UserDeviceCopyWith(UserDevice value, $Res Function(UserDevice) _then) = _$UserDeviceCopyWithImpl;
@useResult
$Res call({
 String userId, String fcmToken, String deviceId, String? deviceName, String? deviceType
});




}
/// @nodoc
class _$UserDeviceCopyWithImpl<$Res>
    implements $UserDeviceCopyWith<$Res> {
  _$UserDeviceCopyWithImpl(this._self, this._then);

  final UserDevice _self;
  final $Res Function(UserDevice) _then;

/// Create a copy of UserDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? fcmToken = null,Object? deviceId = null,Object? deviceName = freezed,Object? deviceType = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,deviceType: freezed == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDevice].
extension UserDevicePatterns on UserDevice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDevice() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDevice value)  $default,){
final _that = this;
switch (_that) {
case _UserDevice():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDevice value)?  $default,){
final _that = this;
switch (_that) {
case _UserDevice() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String fcmToken,  String deviceId,  String? deviceName,  String? deviceType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDevice() when $default != null:
return $default(_that.userId,_that.fcmToken,_that.deviceId,_that.deviceName,_that.deviceType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String fcmToken,  String deviceId,  String? deviceName,  String? deviceType)  $default,) {final _that = this;
switch (_that) {
case _UserDevice():
return $default(_that.userId,_that.fcmToken,_that.deviceId,_that.deviceName,_that.deviceType);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String fcmToken,  String deviceId,  String? deviceName,  String? deviceType)?  $default,) {final _that = this;
switch (_that) {
case _UserDevice() when $default != null:
return $default(_that.userId,_that.fcmToken,_that.deviceId,_that.deviceName,_that.deviceType);case _:
  return null;

}
}

}

/// @nodoc


class _UserDevice implements UserDevice {
  const _UserDevice({required this.userId, required this.fcmToken, required this.deviceId, this.deviceName, this.deviceType});
  

@override final  String userId;
@override final  String fcmToken;
@override final  String deviceId;
@override final  String? deviceName;
@override final  String? deviceType;

/// Create a copy of UserDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDeviceCopyWith<_UserDevice> get copyWith => __$UserDeviceCopyWithImpl<_UserDevice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDevice&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType));
}


@override
int get hashCode => Object.hash(runtimeType,userId,fcmToken,deviceId,deviceName,deviceType);

@override
String toString() {
  return 'UserDevice(userId: $userId, fcmToken: $fcmToken, deviceId: $deviceId, deviceName: $deviceName, deviceType: $deviceType)';
}


}

/// @nodoc
abstract mixin class _$UserDeviceCopyWith<$Res> implements $UserDeviceCopyWith<$Res> {
  factory _$UserDeviceCopyWith(_UserDevice value, $Res Function(_UserDevice) _then) = __$UserDeviceCopyWithImpl;
@override @useResult
$Res call({
 String userId, String fcmToken, String deviceId, String? deviceName, String? deviceType
});




}
/// @nodoc
class __$UserDeviceCopyWithImpl<$Res>
    implements _$UserDeviceCopyWith<$Res> {
  __$UserDeviceCopyWithImpl(this._self, this._then);

  final _UserDevice _self;
  final $Res Function(_UserDevice) _then;

/// Create a copy of UserDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? fcmToken = null,Object? deviceId = null,Object? deviceName = freezed,Object? deviceType = freezed,}) {
  return _then(_UserDevice(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,deviceType: freezed == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
