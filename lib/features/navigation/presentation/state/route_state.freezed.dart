// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteState {

 bool get isCalculating; RouteResult? get routeResult; String? get errorMessage; bool get isCalculatingAlternatives; AlternativeRoutesResult? get alternativeRoutesResult; RouteStrategy? get selectedStrategy;
/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteStateCopyWith<RouteState> get copyWith => _$RouteStateCopyWithImpl<RouteState>(this as RouteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteState&&(identical(other.isCalculating, isCalculating) || other.isCalculating == isCalculating)&&(identical(other.routeResult, routeResult) || other.routeResult == routeResult)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isCalculatingAlternatives, isCalculatingAlternatives) || other.isCalculatingAlternatives == isCalculatingAlternatives)&&(identical(other.alternativeRoutesResult, alternativeRoutesResult) || other.alternativeRoutesResult == alternativeRoutesResult)&&(identical(other.selectedStrategy, selectedStrategy) || other.selectedStrategy == selectedStrategy));
}


@override
int get hashCode => Object.hash(runtimeType,isCalculating,routeResult,errorMessage,isCalculatingAlternatives,alternativeRoutesResult,selectedStrategy);

@override
String toString() {
  return 'RouteState(isCalculating: $isCalculating, routeResult: $routeResult, errorMessage: $errorMessage, isCalculatingAlternatives: $isCalculatingAlternatives, alternativeRoutesResult: $alternativeRoutesResult, selectedStrategy: $selectedStrategy)';
}


}

/// @nodoc
abstract mixin class $RouteStateCopyWith<$Res>  {
  factory $RouteStateCopyWith(RouteState value, $Res Function(RouteState) _then) = _$RouteStateCopyWithImpl;
@useResult
$Res call({
 bool isCalculating, RouteResult? routeResult, String? errorMessage, bool isCalculatingAlternatives, AlternativeRoutesResult? alternativeRoutesResult, RouteStrategy? selectedStrategy
});


$RouteResultCopyWith<$Res>? get routeResult;$AlternativeRoutesResultCopyWith<$Res>? get alternativeRoutesResult;

}
/// @nodoc
class _$RouteStateCopyWithImpl<$Res>
    implements $RouteStateCopyWith<$Res> {
  _$RouteStateCopyWithImpl(this._self, this._then);

  final RouteState _self;
  final $Res Function(RouteState) _then;

/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCalculating = null,Object? routeResult = freezed,Object? errorMessage = freezed,Object? isCalculatingAlternatives = null,Object? alternativeRoutesResult = freezed,Object? selectedStrategy = freezed,}) {
  return _then(_self.copyWith(
isCalculating: null == isCalculating ? _self.isCalculating : isCalculating // ignore: cast_nullable_to_non_nullable
as bool,routeResult: freezed == routeResult ? _self.routeResult : routeResult // ignore: cast_nullable_to_non_nullable
as RouteResult?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isCalculatingAlternatives: null == isCalculatingAlternatives ? _self.isCalculatingAlternatives : isCalculatingAlternatives // ignore: cast_nullable_to_non_nullable
as bool,alternativeRoutesResult: freezed == alternativeRoutesResult ? _self.alternativeRoutesResult : alternativeRoutesResult // ignore: cast_nullable_to_non_nullable
as AlternativeRoutesResult?,selectedStrategy: freezed == selectedStrategy ? _self.selectedStrategy : selectedStrategy // ignore: cast_nullable_to_non_nullable
as RouteStrategy?,
  ));
}
/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteResultCopyWith<$Res>? get routeResult {
    if (_self.routeResult == null) {
    return null;
  }

  return $RouteResultCopyWith<$Res>(_self.routeResult!, (value) {
    return _then(_self.copyWith(routeResult: value));
  });
}/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlternativeRoutesResultCopyWith<$Res>? get alternativeRoutesResult {
    if (_self.alternativeRoutesResult == null) {
    return null;
  }

  return $AlternativeRoutesResultCopyWith<$Res>(_self.alternativeRoutesResult!, (value) {
    return _then(_self.copyWith(alternativeRoutesResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteState].
extension RouteStatePatterns on RouteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteState value)  $default,){
final _that = this;
switch (_that) {
case _RouteState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteState value)?  $default,){
final _that = this;
switch (_that) {
case _RouteState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isCalculating,  RouteResult? routeResult,  String? errorMessage,  bool isCalculatingAlternatives,  AlternativeRoutesResult? alternativeRoutesResult,  RouteStrategy? selectedStrategy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteState() when $default != null:
return $default(_that.isCalculating,_that.routeResult,_that.errorMessage,_that.isCalculatingAlternatives,_that.alternativeRoutesResult,_that.selectedStrategy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isCalculating,  RouteResult? routeResult,  String? errorMessage,  bool isCalculatingAlternatives,  AlternativeRoutesResult? alternativeRoutesResult,  RouteStrategy? selectedStrategy)  $default,) {final _that = this;
switch (_that) {
case _RouteState():
return $default(_that.isCalculating,_that.routeResult,_that.errorMessage,_that.isCalculatingAlternatives,_that.alternativeRoutesResult,_that.selectedStrategy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isCalculating,  RouteResult? routeResult,  String? errorMessage,  bool isCalculatingAlternatives,  AlternativeRoutesResult? alternativeRoutesResult,  RouteStrategy? selectedStrategy)?  $default,) {final _that = this;
switch (_that) {
case _RouteState() when $default != null:
return $default(_that.isCalculating,_that.routeResult,_that.errorMessage,_that.isCalculatingAlternatives,_that.alternativeRoutesResult,_that.selectedStrategy);case _:
  return null;

}
}

}

/// @nodoc


class _RouteState implements RouteState {
  const _RouteState({this.isCalculating = false, this.routeResult, this.errorMessage, this.isCalculatingAlternatives = false, this.alternativeRoutesResult, this.selectedStrategy});
  

@override@JsonKey() final  bool isCalculating;
@override final  RouteResult? routeResult;
@override final  String? errorMessage;
@override@JsonKey() final  bool isCalculatingAlternatives;
@override final  AlternativeRoutesResult? alternativeRoutesResult;
@override final  RouteStrategy? selectedStrategy;

/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteStateCopyWith<_RouteState> get copyWith => __$RouteStateCopyWithImpl<_RouteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteState&&(identical(other.isCalculating, isCalculating) || other.isCalculating == isCalculating)&&(identical(other.routeResult, routeResult) || other.routeResult == routeResult)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isCalculatingAlternatives, isCalculatingAlternatives) || other.isCalculatingAlternatives == isCalculatingAlternatives)&&(identical(other.alternativeRoutesResult, alternativeRoutesResult) || other.alternativeRoutesResult == alternativeRoutesResult)&&(identical(other.selectedStrategy, selectedStrategy) || other.selectedStrategy == selectedStrategy));
}


@override
int get hashCode => Object.hash(runtimeType,isCalculating,routeResult,errorMessage,isCalculatingAlternatives,alternativeRoutesResult,selectedStrategy);

@override
String toString() {
  return 'RouteState(isCalculating: $isCalculating, routeResult: $routeResult, errorMessage: $errorMessage, isCalculatingAlternatives: $isCalculatingAlternatives, alternativeRoutesResult: $alternativeRoutesResult, selectedStrategy: $selectedStrategy)';
}


}

/// @nodoc
abstract mixin class _$RouteStateCopyWith<$Res> implements $RouteStateCopyWith<$Res> {
  factory _$RouteStateCopyWith(_RouteState value, $Res Function(_RouteState) _then) = __$RouteStateCopyWithImpl;
@override @useResult
$Res call({
 bool isCalculating, RouteResult? routeResult, String? errorMessage, bool isCalculatingAlternatives, AlternativeRoutesResult? alternativeRoutesResult, RouteStrategy? selectedStrategy
});


@override $RouteResultCopyWith<$Res>? get routeResult;@override $AlternativeRoutesResultCopyWith<$Res>? get alternativeRoutesResult;

}
/// @nodoc
class __$RouteStateCopyWithImpl<$Res>
    implements _$RouteStateCopyWith<$Res> {
  __$RouteStateCopyWithImpl(this._self, this._then);

  final _RouteState _self;
  final $Res Function(_RouteState) _then;

/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCalculating = null,Object? routeResult = freezed,Object? errorMessage = freezed,Object? isCalculatingAlternatives = null,Object? alternativeRoutesResult = freezed,Object? selectedStrategy = freezed,}) {
  return _then(_RouteState(
isCalculating: null == isCalculating ? _self.isCalculating : isCalculating // ignore: cast_nullable_to_non_nullable
as bool,routeResult: freezed == routeResult ? _self.routeResult : routeResult // ignore: cast_nullable_to_non_nullable
as RouteResult?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isCalculatingAlternatives: null == isCalculatingAlternatives ? _self.isCalculatingAlternatives : isCalculatingAlternatives // ignore: cast_nullable_to_non_nullable
as bool,alternativeRoutesResult: freezed == alternativeRoutesResult ? _self.alternativeRoutesResult : alternativeRoutesResult // ignore: cast_nullable_to_non_nullable
as AlternativeRoutesResult?,selectedStrategy: freezed == selectedStrategy ? _self.selectedStrategy : selectedStrategy // ignore: cast_nullable_to_non_nullable
as RouteStrategy?,
  ));
}

/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteResultCopyWith<$Res>? get routeResult {
    if (_self.routeResult == null) {
    return null;
  }

  return $RouteResultCopyWith<$Res>(_self.routeResult!, (value) {
    return _then(_self.copyWith(routeResult: value));
  });
}/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlternativeRoutesResultCopyWith<$Res>? get alternativeRoutesResult {
    if (_self.alternativeRoutesResult == null) {
    return null;
  }

  return $AlternativeRoutesResultCopyWith<$Res>(_self.alternativeRoutesResult!, (value) {
    return _then(_self.copyWith(alternativeRoutesResult: value));
  });
}
}

// dart format on
