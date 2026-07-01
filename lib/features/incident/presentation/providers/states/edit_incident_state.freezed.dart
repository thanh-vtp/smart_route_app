// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_incident_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditIncidentState {

 bool get isUpdating; bool get isSuccess; bool get isDeleting; bool get isDeleteSuccess; String? get errorMessage;
/// Create a copy of EditIncidentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditIncidentStateCopyWith<EditIncidentState> get copyWith => _$EditIncidentStateCopyWithImpl<EditIncidentState>(this as EditIncidentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditIncidentState&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.isDeleteSuccess, isDeleteSuccess) || other.isDeleteSuccess == isDeleteSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isUpdating,isSuccess,isDeleting,isDeleteSuccess,errorMessage);

@override
String toString() {
  return 'EditIncidentState(isUpdating: $isUpdating, isSuccess: $isSuccess, isDeleting: $isDeleting, isDeleteSuccess: $isDeleteSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EditIncidentStateCopyWith<$Res>  {
  factory $EditIncidentStateCopyWith(EditIncidentState value, $Res Function(EditIncidentState) _then) = _$EditIncidentStateCopyWithImpl;
@useResult
$Res call({
 bool isUpdating, bool isSuccess, bool isDeleting, bool isDeleteSuccess, String? errorMessage
});




}
/// @nodoc
class _$EditIncidentStateCopyWithImpl<$Res>
    implements $EditIncidentStateCopyWith<$Res> {
  _$EditIncidentStateCopyWithImpl(this._self, this._then);

  final EditIncidentState _self;
  final $Res Function(EditIncidentState) _then;

/// Create a copy of EditIncidentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isUpdating = null,Object? isSuccess = null,Object? isDeleting = null,Object? isDeleteSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,isDeleteSuccess: null == isDeleteSuccess ? _self.isDeleteSuccess : isDeleteSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EditIncidentState].
extension EditIncidentStatePatterns on EditIncidentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditIncidentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditIncidentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditIncidentState value)  $default,){
final _that = this;
switch (_that) {
case _EditIncidentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditIncidentState value)?  $default,){
final _that = this;
switch (_that) {
case _EditIncidentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isUpdating,  bool isSuccess,  bool isDeleting,  bool isDeleteSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditIncidentState() when $default != null:
return $default(_that.isUpdating,_that.isSuccess,_that.isDeleting,_that.isDeleteSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isUpdating,  bool isSuccess,  bool isDeleting,  bool isDeleteSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EditIncidentState():
return $default(_that.isUpdating,_that.isSuccess,_that.isDeleting,_that.isDeleteSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isUpdating,  bool isSuccess,  bool isDeleting,  bool isDeleteSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EditIncidentState() when $default != null:
return $default(_that.isUpdating,_that.isSuccess,_that.isDeleting,_that.isDeleteSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EditIncidentState implements EditIncidentState {
  const _EditIncidentState({this.isUpdating = false, this.isSuccess = false, this.isDeleting = false, this.isDeleteSuccess = false, this.errorMessage});
  

@override@JsonKey() final  bool isUpdating;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  bool isDeleting;
@override@JsonKey() final  bool isDeleteSuccess;
@override final  String? errorMessage;

/// Create a copy of EditIncidentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditIncidentStateCopyWith<_EditIncidentState> get copyWith => __$EditIncidentStateCopyWithImpl<_EditIncidentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditIncidentState&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.isDeleteSuccess, isDeleteSuccess) || other.isDeleteSuccess == isDeleteSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isUpdating,isSuccess,isDeleting,isDeleteSuccess,errorMessage);

@override
String toString() {
  return 'EditIncidentState(isUpdating: $isUpdating, isSuccess: $isSuccess, isDeleting: $isDeleting, isDeleteSuccess: $isDeleteSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EditIncidentStateCopyWith<$Res> implements $EditIncidentStateCopyWith<$Res> {
  factory _$EditIncidentStateCopyWith(_EditIncidentState value, $Res Function(_EditIncidentState) _then) = __$EditIncidentStateCopyWithImpl;
@override @useResult
$Res call({
 bool isUpdating, bool isSuccess, bool isDeleting, bool isDeleteSuccess, String? errorMessage
});




}
/// @nodoc
class __$EditIncidentStateCopyWithImpl<$Res>
    implements _$EditIncidentStateCopyWith<$Res> {
  __$EditIncidentStateCopyWithImpl(this._self, this._then);

  final _EditIncidentState _self;
  final $Res Function(_EditIncidentState) _then;

/// Create a copy of EditIncidentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isUpdating = null,Object? isSuccess = null,Object? isDeleting = null,Object? isDeleteSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_EditIncidentState(
isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,isDeleteSuccess: null == isDeleteSuccess ? _self.isDeleteSuccess : isDeleteSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
