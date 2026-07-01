// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_incident_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportIncidentState {

 bool get isLoadingAddress; String? get address; bool get isSubmitting; bool get isSuccess; String? get errorMessage;
/// Create a copy of ReportIncidentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportIncidentStateCopyWith<ReportIncidentState> get copyWith => _$ReportIncidentStateCopyWithImpl<ReportIncidentState>(this as ReportIncidentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportIncidentState&&(identical(other.isLoadingAddress, isLoadingAddress) || other.isLoadingAddress == isLoadingAddress)&&(identical(other.address, address) || other.address == address)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingAddress,address,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'ReportIncidentState(isLoadingAddress: $isLoadingAddress, address: $address, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ReportIncidentStateCopyWith<$Res>  {
  factory $ReportIncidentStateCopyWith(ReportIncidentState value, $Res Function(ReportIncidentState) _then) = _$ReportIncidentStateCopyWithImpl;
@useResult
$Res call({
 bool isLoadingAddress, String? address, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$ReportIncidentStateCopyWithImpl<$Res>
    implements $ReportIncidentStateCopyWith<$Res> {
  _$ReportIncidentStateCopyWithImpl(this._self, this._then);

  final ReportIncidentState _self;
  final $Res Function(ReportIncidentState) _then;

/// Create a copy of ReportIncidentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoadingAddress = null,Object? address = freezed,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoadingAddress: null == isLoadingAddress ? _self.isLoadingAddress : isLoadingAddress // ignore: cast_nullable_to_non_nullable
as bool,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportIncidentState].
extension ReportIncidentStatePatterns on ReportIncidentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportIncidentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportIncidentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportIncidentState value)  $default,){
final _that = this;
switch (_that) {
case _ReportIncidentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportIncidentState value)?  $default,){
final _that = this;
switch (_that) {
case _ReportIncidentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoadingAddress,  String? address,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportIncidentState() when $default != null:
return $default(_that.isLoadingAddress,_that.address,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoadingAddress,  String? address,  bool isSubmitting,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ReportIncidentState():
return $default(_that.isLoadingAddress,_that.address,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoadingAddress,  String? address,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ReportIncidentState() when $default != null:
return $default(_that.isLoadingAddress,_that.address,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ReportIncidentState implements ReportIncidentState {
  const _ReportIncidentState({this.isLoadingAddress = true, this.address, this.isSubmitting = false, this.isSuccess = false, this.errorMessage});
  

@override@JsonKey() final  bool isLoadingAddress;
@override final  String? address;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of ReportIncidentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportIncidentStateCopyWith<_ReportIncidentState> get copyWith => __$ReportIncidentStateCopyWithImpl<_ReportIncidentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportIncidentState&&(identical(other.isLoadingAddress, isLoadingAddress) || other.isLoadingAddress == isLoadingAddress)&&(identical(other.address, address) || other.address == address)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingAddress,address,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'ReportIncidentState(isLoadingAddress: $isLoadingAddress, address: $address, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ReportIncidentStateCopyWith<$Res> implements $ReportIncidentStateCopyWith<$Res> {
  factory _$ReportIncidentStateCopyWith(_ReportIncidentState value, $Res Function(_ReportIncidentState) _then) = __$ReportIncidentStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoadingAddress, String? address, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$ReportIncidentStateCopyWithImpl<$Res>
    implements _$ReportIncidentStateCopyWith<$Res> {
  __$ReportIncidentStateCopyWithImpl(this._self, this._then);

  final _ReportIncidentState _self;
  final $Res Function(_ReportIncidentState) _then;

/// Create a copy of ReportIncidentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoadingAddress = null,Object? address = freezed,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_ReportIncidentState(
isLoadingAddress: null == isLoadingAddress ? _self.isLoadingAddress : isLoadingAddress // ignore: cast_nullable_to_non_nullable
as bool,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
