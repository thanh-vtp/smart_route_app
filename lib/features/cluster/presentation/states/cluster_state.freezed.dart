// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClusterState {

 bool get isLoading; ClusterResult? get clusterResult; String? get errorMessage;
/// Create a copy of ClusterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterStateCopyWith<ClusterState> get copyWith => _$ClusterStateCopyWithImpl<ClusterState>(this as ClusterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.clusterResult, clusterResult) || other.clusterResult == clusterResult)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,clusterResult,errorMessage);

@override
String toString() {
  return 'ClusterState(isLoading: $isLoading, clusterResult: $clusterResult, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ClusterStateCopyWith<$Res>  {
  factory $ClusterStateCopyWith(ClusterState value, $Res Function(ClusterState) _then) = _$ClusterStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, ClusterResult? clusterResult, String? errorMessage
});


$ClusterResultCopyWith<$Res>? get clusterResult;

}
/// @nodoc
class _$ClusterStateCopyWithImpl<$Res>
    implements $ClusterStateCopyWith<$Res> {
  _$ClusterStateCopyWithImpl(this._self, this._then);

  final ClusterState _self;
  final $Res Function(ClusterState) _then;

/// Create a copy of ClusterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? clusterResult = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,clusterResult: freezed == clusterResult ? _self.clusterResult : clusterResult // ignore: cast_nullable_to_non_nullable
as ClusterResult?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ClusterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterResultCopyWith<$Res>? get clusterResult {
    if (_self.clusterResult == null) {
    return null;
  }

  return $ClusterResultCopyWith<$Res>(_self.clusterResult!, (value) {
    return _then(_self.copyWith(clusterResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClusterState].
extension ClusterStatePatterns on ClusterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterState value)  $default,){
final _that = this;
switch (_that) {
case _ClusterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterState value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  ClusterResult? clusterResult,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterState() when $default != null:
return $default(_that.isLoading,_that.clusterResult,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  ClusterResult? clusterResult,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ClusterState():
return $default(_that.isLoading,_that.clusterResult,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  ClusterResult? clusterResult,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ClusterState() when $default != null:
return $default(_that.isLoading,_that.clusterResult,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ClusterState implements ClusterState {
  const _ClusterState({this.isLoading = false, this.clusterResult, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override final  ClusterResult? clusterResult;
@override final  String? errorMessage;

/// Create a copy of ClusterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterStateCopyWith<_ClusterState> get copyWith => __$ClusterStateCopyWithImpl<_ClusterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.clusterResult, clusterResult) || other.clusterResult == clusterResult)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,clusterResult,errorMessage);

@override
String toString() {
  return 'ClusterState(isLoading: $isLoading, clusterResult: $clusterResult, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ClusterStateCopyWith<$Res> implements $ClusterStateCopyWith<$Res> {
  factory _$ClusterStateCopyWith(_ClusterState value, $Res Function(_ClusterState) _then) = __$ClusterStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, ClusterResult? clusterResult, String? errorMessage
});


@override $ClusterResultCopyWith<$Res>? get clusterResult;

}
/// @nodoc
class __$ClusterStateCopyWithImpl<$Res>
    implements _$ClusterStateCopyWith<$Res> {
  __$ClusterStateCopyWithImpl(this._self, this._then);

  final _ClusterState _self;
  final $Res Function(_ClusterState) _then;

/// Create a copy of ClusterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? clusterResult = freezed,Object? errorMessage = freezed,}) {
  return _then(_ClusterState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,clusterResult: freezed == clusterResult ? _self.clusterResult : clusterResult // ignore: cast_nullable_to_non_nullable
as ClusterResult?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ClusterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterResultCopyWith<$Res>? get clusterResult {
    if (_self.clusterResult == null) {
    return null;
  }

  return $ClusterResultCopyWith<$Res>(_self.clusterResult!, (value) {
    return _then(_self.copyWith(clusterResult: value));
  });
}
}

// dart format on
