// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteResult {

 String get routeName; double get totalDistanceMeters; double get totalTimeMinutes; List<RoutePoint> get polylinePoints; List<RouteDirection> get directions; RouteBoundingBox? get boundingBox;
/// Create a copy of RouteResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteResultCopyWith<RouteResult> get copyWith => _$RouteResultCopyWithImpl<RouteResult>(this as RouteResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteResult&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.totalDistanceMeters, totalDistanceMeters) || other.totalDistanceMeters == totalDistanceMeters)&&(identical(other.totalTimeMinutes, totalTimeMinutes) || other.totalTimeMinutes == totalTimeMinutes)&&const DeepCollectionEquality().equals(other.polylinePoints, polylinePoints)&&const DeepCollectionEquality().equals(other.directions, directions)&&(identical(other.boundingBox, boundingBox) || other.boundingBox == boundingBox));
}


@override
int get hashCode => Object.hash(runtimeType,routeName,totalDistanceMeters,totalTimeMinutes,const DeepCollectionEquality().hash(polylinePoints),const DeepCollectionEquality().hash(directions),boundingBox);

@override
String toString() {
  return 'RouteResult(routeName: $routeName, totalDistanceMeters: $totalDistanceMeters, totalTimeMinutes: $totalTimeMinutes, polylinePoints: $polylinePoints, directions: $directions, boundingBox: $boundingBox)';
}


}

/// @nodoc
abstract mixin class $RouteResultCopyWith<$Res>  {
  factory $RouteResultCopyWith(RouteResult value, $Res Function(RouteResult) _then) = _$RouteResultCopyWithImpl;
@useResult
$Res call({
 String routeName, double totalDistanceMeters, double totalTimeMinutes, List<RoutePoint> polylinePoints, List<RouteDirection> directions, RouteBoundingBox? boundingBox
});


$RouteBoundingBoxCopyWith<$Res>? get boundingBox;

}
/// @nodoc
class _$RouteResultCopyWithImpl<$Res>
    implements $RouteResultCopyWith<$Res> {
  _$RouteResultCopyWithImpl(this._self, this._then);

  final RouteResult _self;
  final $Res Function(RouteResult) _then;

/// Create a copy of RouteResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? routeName = null,Object? totalDistanceMeters = null,Object? totalTimeMinutes = null,Object? polylinePoints = null,Object? directions = null,Object? boundingBox = freezed,}) {
  return _then(_self.copyWith(
routeName: null == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String,totalDistanceMeters: null == totalDistanceMeters ? _self.totalDistanceMeters : totalDistanceMeters // ignore: cast_nullable_to_non_nullable
as double,totalTimeMinutes: null == totalTimeMinutes ? _self.totalTimeMinutes : totalTimeMinutes // ignore: cast_nullable_to_non_nullable
as double,polylinePoints: null == polylinePoints ? _self.polylinePoints : polylinePoints // ignore: cast_nullable_to_non_nullable
as List<RoutePoint>,directions: null == directions ? _self.directions : directions // ignore: cast_nullable_to_non_nullable
as List<RouteDirection>,boundingBox: freezed == boundingBox ? _self.boundingBox : boundingBox // ignore: cast_nullable_to_non_nullable
as RouteBoundingBox?,
  ));
}
/// Create a copy of RouteResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteBoundingBoxCopyWith<$Res>? get boundingBox {
    if (_self.boundingBox == null) {
    return null;
  }

  return $RouteBoundingBoxCopyWith<$Res>(_self.boundingBox!, (value) {
    return _then(_self.copyWith(boundingBox: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteResult].
extension RouteResultPatterns on RouteResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteResult value)  $default,){
final _that = this;
switch (_that) {
case _RouteResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteResult value)?  $default,){
final _that = this;
switch (_that) {
case _RouteResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String routeName,  double totalDistanceMeters,  double totalTimeMinutes,  List<RoutePoint> polylinePoints,  List<RouteDirection> directions,  RouteBoundingBox? boundingBox)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteResult() when $default != null:
return $default(_that.routeName,_that.totalDistanceMeters,_that.totalTimeMinutes,_that.polylinePoints,_that.directions,_that.boundingBox);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String routeName,  double totalDistanceMeters,  double totalTimeMinutes,  List<RoutePoint> polylinePoints,  List<RouteDirection> directions,  RouteBoundingBox? boundingBox)  $default,) {final _that = this;
switch (_that) {
case _RouteResult():
return $default(_that.routeName,_that.totalDistanceMeters,_that.totalTimeMinutes,_that.polylinePoints,_that.directions,_that.boundingBox);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String routeName,  double totalDistanceMeters,  double totalTimeMinutes,  List<RoutePoint> polylinePoints,  List<RouteDirection> directions,  RouteBoundingBox? boundingBox)?  $default,) {final _that = this;
switch (_that) {
case _RouteResult() when $default != null:
return $default(_that.routeName,_that.totalDistanceMeters,_that.totalTimeMinutes,_that.polylinePoints,_that.directions,_that.boundingBox);case _:
  return null;

}
}

}

/// @nodoc


class _RouteResult extends RouteResult {
  const _RouteResult({required this.routeName, required this.totalDistanceMeters, required this.totalTimeMinutes, required final  List<RoutePoint> polylinePoints, required final  List<RouteDirection> directions, this.boundingBox}): _polylinePoints = polylinePoints,_directions = directions,super._();
  

@override final  String routeName;
@override final  double totalDistanceMeters;
@override final  double totalTimeMinutes;
 final  List<RoutePoint> _polylinePoints;
@override List<RoutePoint> get polylinePoints {
  if (_polylinePoints is EqualUnmodifiableListView) return _polylinePoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_polylinePoints);
}

 final  List<RouteDirection> _directions;
@override List<RouteDirection> get directions {
  if (_directions is EqualUnmodifiableListView) return _directions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_directions);
}

@override final  RouteBoundingBox? boundingBox;

/// Create a copy of RouteResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteResultCopyWith<_RouteResult> get copyWith => __$RouteResultCopyWithImpl<_RouteResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteResult&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.totalDistanceMeters, totalDistanceMeters) || other.totalDistanceMeters == totalDistanceMeters)&&(identical(other.totalTimeMinutes, totalTimeMinutes) || other.totalTimeMinutes == totalTimeMinutes)&&const DeepCollectionEquality().equals(other._polylinePoints, _polylinePoints)&&const DeepCollectionEquality().equals(other._directions, _directions)&&(identical(other.boundingBox, boundingBox) || other.boundingBox == boundingBox));
}


@override
int get hashCode => Object.hash(runtimeType,routeName,totalDistanceMeters,totalTimeMinutes,const DeepCollectionEquality().hash(_polylinePoints),const DeepCollectionEquality().hash(_directions),boundingBox);

@override
String toString() {
  return 'RouteResult(routeName: $routeName, totalDistanceMeters: $totalDistanceMeters, totalTimeMinutes: $totalTimeMinutes, polylinePoints: $polylinePoints, directions: $directions, boundingBox: $boundingBox)';
}


}

/// @nodoc
abstract mixin class _$RouteResultCopyWith<$Res> implements $RouteResultCopyWith<$Res> {
  factory _$RouteResultCopyWith(_RouteResult value, $Res Function(_RouteResult) _then) = __$RouteResultCopyWithImpl;
@override @useResult
$Res call({
 String routeName, double totalDistanceMeters, double totalTimeMinutes, List<RoutePoint> polylinePoints, List<RouteDirection> directions, RouteBoundingBox? boundingBox
});


@override $RouteBoundingBoxCopyWith<$Res>? get boundingBox;

}
/// @nodoc
class __$RouteResultCopyWithImpl<$Res>
    implements _$RouteResultCopyWith<$Res> {
  __$RouteResultCopyWithImpl(this._self, this._then);

  final _RouteResult _self;
  final $Res Function(_RouteResult) _then;

/// Create a copy of RouteResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? routeName = null,Object? totalDistanceMeters = null,Object? totalTimeMinutes = null,Object? polylinePoints = null,Object? directions = null,Object? boundingBox = freezed,}) {
  return _then(_RouteResult(
routeName: null == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String,totalDistanceMeters: null == totalDistanceMeters ? _self.totalDistanceMeters : totalDistanceMeters // ignore: cast_nullable_to_non_nullable
as double,totalTimeMinutes: null == totalTimeMinutes ? _self.totalTimeMinutes : totalTimeMinutes // ignore: cast_nullable_to_non_nullable
as double,polylinePoints: null == polylinePoints ? _self._polylinePoints : polylinePoints // ignore: cast_nullable_to_non_nullable
as List<RoutePoint>,directions: null == directions ? _self._directions : directions // ignore: cast_nullable_to_non_nullable
as List<RouteDirection>,boundingBox: freezed == boundingBox ? _self.boundingBox : boundingBox // ignore: cast_nullable_to_non_nullable
as RouteBoundingBox?,
  ));
}

/// Create a copy of RouteResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteBoundingBoxCopyWith<$Res>? get boundingBox {
    if (_self.boundingBox == null) {
    return null;
  }

  return $RouteBoundingBoxCopyWith<$Res>(_self.boundingBox!, (value) {
    return _then(_self.copyWith(boundingBox: value));
  });
}
}

/// @nodoc
mixin _$RoutePoint {

 double get lat; double get lng;
/// Create a copy of RoutePoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutePointCopyWith<RoutePoint> get copyWith => _$RoutePointCopyWithImpl<RoutePoint>(this as RoutePoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutePoint&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}


@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'RoutePoint(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $RoutePointCopyWith<$Res>  {
  factory $RoutePointCopyWith(RoutePoint value, $Res Function(RoutePoint) _then) = _$RoutePointCopyWithImpl;
@useResult
$Res call({
 double lat, double lng
});




}
/// @nodoc
class _$RoutePointCopyWithImpl<$Res>
    implements $RoutePointCopyWith<$Res> {
  _$RoutePointCopyWithImpl(this._self, this._then);

  final RoutePoint _self;
  final $Res Function(RoutePoint) _then;

/// Create a copy of RoutePoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RoutePoint].
extension RoutePointPatterns on RoutePoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoutePoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoutePoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoutePoint value)  $default,){
final _that = this;
switch (_that) {
case _RoutePoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoutePoint value)?  $default,){
final _that = this;
switch (_that) {
case _RoutePoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoutePoint() when $default != null:
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _RoutePoint():
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _RoutePoint() when $default != null:
return $default(_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc


class _RoutePoint implements RoutePoint {
  const _RoutePoint({required this.lat, required this.lng});
  

@override final  double lat;
@override final  double lng;

/// Create a copy of RoutePoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutePointCopyWith<_RoutePoint> get copyWith => __$RoutePointCopyWithImpl<_RoutePoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoutePoint&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}


@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'RoutePoint(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$RoutePointCopyWith<$Res> implements $RoutePointCopyWith<$Res> {
  factory _$RoutePointCopyWith(_RoutePoint value, $Res Function(_RoutePoint) _then) = __$RoutePointCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lng
});




}
/// @nodoc
class __$RoutePointCopyWithImpl<$Res>
    implements _$RoutePointCopyWith<$Res> {
  __$RoutePointCopyWithImpl(this._self, this._then);

  final _RoutePoint _self;
  final $Res Function(_RoutePoint) _then;

/// Create a copy of RoutePoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_RoutePoint(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$RouteBoundingBox {

 double get xMin; double get yMin; double get xMax; double get yMax;
/// Create a copy of RouteBoundingBox
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteBoundingBoxCopyWith<RouteBoundingBox> get copyWith => _$RouteBoundingBoxCopyWithImpl<RouteBoundingBox>(this as RouteBoundingBox, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteBoundingBox&&(identical(other.xMin, xMin) || other.xMin == xMin)&&(identical(other.yMin, yMin) || other.yMin == yMin)&&(identical(other.xMax, xMax) || other.xMax == xMax)&&(identical(other.yMax, yMax) || other.yMax == yMax));
}


@override
int get hashCode => Object.hash(runtimeType,xMin,yMin,xMax,yMax);

@override
String toString() {
  return 'RouteBoundingBox(xMin: $xMin, yMin: $yMin, xMax: $xMax, yMax: $yMax)';
}


}

/// @nodoc
abstract mixin class $RouteBoundingBoxCopyWith<$Res>  {
  factory $RouteBoundingBoxCopyWith(RouteBoundingBox value, $Res Function(RouteBoundingBox) _then) = _$RouteBoundingBoxCopyWithImpl;
@useResult
$Res call({
 double xMin, double yMin, double xMax, double yMax
});




}
/// @nodoc
class _$RouteBoundingBoxCopyWithImpl<$Res>
    implements $RouteBoundingBoxCopyWith<$Res> {
  _$RouteBoundingBoxCopyWithImpl(this._self, this._then);

  final RouteBoundingBox _self;
  final $Res Function(RouteBoundingBox) _then;

/// Create a copy of RouteBoundingBox
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? xMin = null,Object? yMin = null,Object? xMax = null,Object? yMax = null,}) {
  return _then(_self.copyWith(
xMin: null == xMin ? _self.xMin : xMin // ignore: cast_nullable_to_non_nullable
as double,yMin: null == yMin ? _self.yMin : yMin // ignore: cast_nullable_to_non_nullable
as double,xMax: null == xMax ? _self.xMax : xMax // ignore: cast_nullable_to_non_nullable
as double,yMax: null == yMax ? _self.yMax : yMax // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteBoundingBox].
extension RouteBoundingBoxPatterns on RouteBoundingBox {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteBoundingBox value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteBoundingBox() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteBoundingBox value)  $default,){
final _that = this;
switch (_that) {
case _RouteBoundingBox():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteBoundingBox value)?  $default,){
final _that = this;
switch (_that) {
case _RouteBoundingBox() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double xMin,  double yMin,  double xMax,  double yMax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteBoundingBox() when $default != null:
return $default(_that.xMin,_that.yMin,_that.xMax,_that.yMax);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double xMin,  double yMin,  double xMax,  double yMax)  $default,) {final _that = this;
switch (_that) {
case _RouteBoundingBox():
return $default(_that.xMin,_that.yMin,_that.xMax,_that.yMax);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double xMin,  double yMin,  double xMax,  double yMax)?  $default,) {final _that = this;
switch (_that) {
case _RouteBoundingBox() when $default != null:
return $default(_that.xMin,_that.yMin,_that.xMax,_that.yMax);case _:
  return null;

}
}

}

/// @nodoc


class _RouteBoundingBox implements RouteBoundingBox {
  const _RouteBoundingBox({required this.xMin, required this.yMin, required this.xMax, required this.yMax});
  

@override final  double xMin;
@override final  double yMin;
@override final  double xMax;
@override final  double yMax;

/// Create a copy of RouteBoundingBox
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteBoundingBoxCopyWith<_RouteBoundingBox> get copyWith => __$RouteBoundingBoxCopyWithImpl<_RouteBoundingBox>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteBoundingBox&&(identical(other.xMin, xMin) || other.xMin == xMin)&&(identical(other.yMin, yMin) || other.yMin == yMin)&&(identical(other.xMax, xMax) || other.xMax == xMax)&&(identical(other.yMax, yMax) || other.yMax == yMax));
}


@override
int get hashCode => Object.hash(runtimeType,xMin,yMin,xMax,yMax);

@override
String toString() {
  return 'RouteBoundingBox(xMin: $xMin, yMin: $yMin, xMax: $xMax, yMax: $yMax)';
}


}

/// @nodoc
abstract mixin class _$RouteBoundingBoxCopyWith<$Res> implements $RouteBoundingBoxCopyWith<$Res> {
  factory _$RouteBoundingBoxCopyWith(_RouteBoundingBox value, $Res Function(_RouteBoundingBox) _then) = __$RouteBoundingBoxCopyWithImpl;
@override @useResult
$Res call({
 double xMin, double yMin, double xMax, double yMax
});




}
/// @nodoc
class __$RouteBoundingBoxCopyWithImpl<$Res>
    implements _$RouteBoundingBoxCopyWith<$Res> {
  __$RouteBoundingBoxCopyWithImpl(this._self, this._then);

  final _RouteBoundingBox _self;
  final $Res Function(_RouteBoundingBox) _then;

/// Create a copy of RouteBoundingBox
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? xMin = null,Object? yMin = null,Object? xMax = null,Object? yMax = null,}) {
  return _then(_RouteBoundingBox(
xMin: null == xMin ? _self.xMin : xMin // ignore: cast_nullable_to_non_nullable
as double,yMin: null == yMin ? _self.yMin : yMin // ignore: cast_nullable_to_non_nullable
as double,xMax: null == xMax ? _self.xMax : xMax // ignore: cast_nullable_to_non_nullable
as double,yMax: null == yMax ? _self.yMax : yMax // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$RouteDirection {

 String get instruction; double get distanceMeters; double get timeMinutes; ManeuverType get maneuverType; String? get streetName;
/// Create a copy of RouteDirection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteDirectionCopyWith<RouteDirection> get copyWith => _$RouteDirectionCopyWithImpl<RouteDirection>(this as RouteDirection, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteDirection&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.timeMinutes, timeMinutes) || other.timeMinutes == timeMinutes)&&(identical(other.maneuverType, maneuverType) || other.maneuverType == maneuverType)&&(identical(other.streetName, streetName) || other.streetName == streetName));
}


@override
int get hashCode => Object.hash(runtimeType,instruction,distanceMeters,timeMinutes,maneuverType,streetName);

@override
String toString() {
  return 'RouteDirection(instruction: $instruction, distanceMeters: $distanceMeters, timeMinutes: $timeMinutes, maneuverType: $maneuverType, streetName: $streetName)';
}


}

/// @nodoc
abstract mixin class $RouteDirectionCopyWith<$Res>  {
  factory $RouteDirectionCopyWith(RouteDirection value, $Res Function(RouteDirection) _then) = _$RouteDirectionCopyWithImpl;
@useResult
$Res call({
 String instruction, double distanceMeters, double timeMinutes, ManeuverType maneuverType, String? streetName
});




}
/// @nodoc
class _$RouteDirectionCopyWithImpl<$Res>
    implements $RouteDirectionCopyWith<$Res> {
  _$RouteDirectionCopyWithImpl(this._self, this._then);

  final RouteDirection _self;
  final $Res Function(RouteDirection) _then;

/// Create a copy of RouteDirection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? instruction = null,Object? distanceMeters = null,Object? timeMinutes = null,Object? maneuverType = null,Object? streetName = freezed,}) {
  return _then(_self.copyWith(
instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double,timeMinutes: null == timeMinutes ? _self.timeMinutes : timeMinutes // ignore: cast_nullable_to_non_nullable
as double,maneuverType: null == maneuverType ? _self.maneuverType : maneuverType // ignore: cast_nullable_to_non_nullable
as ManeuverType,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteDirection].
extension RouteDirectionPatterns on RouteDirection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteDirection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteDirection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteDirection value)  $default,){
final _that = this;
switch (_that) {
case _RouteDirection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteDirection value)?  $default,){
final _that = this;
switch (_that) {
case _RouteDirection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String instruction,  double distanceMeters,  double timeMinutes,  ManeuverType maneuverType,  String? streetName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteDirection() when $default != null:
return $default(_that.instruction,_that.distanceMeters,_that.timeMinutes,_that.maneuverType,_that.streetName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String instruction,  double distanceMeters,  double timeMinutes,  ManeuverType maneuverType,  String? streetName)  $default,) {final _that = this;
switch (_that) {
case _RouteDirection():
return $default(_that.instruction,_that.distanceMeters,_that.timeMinutes,_that.maneuverType,_that.streetName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String instruction,  double distanceMeters,  double timeMinutes,  ManeuverType maneuverType,  String? streetName)?  $default,) {final _that = this;
switch (_that) {
case _RouteDirection() when $default != null:
return $default(_that.instruction,_that.distanceMeters,_that.timeMinutes,_that.maneuverType,_that.streetName);case _:
  return null;

}
}

}

/// @nodoc


class _RouteDirection extends RouteDirection {
  const _RouteDirection({required this.instruction, required this.distanceMeters, required this.timeMinutes, required this.maneuverType, this.streetName}): super._();
  

@override final  String instruction;
@override final  double distanceMeters;
@override final  double timeMinutes;
@override final  ManeuverType maneuverType;
@override final  String? streetName;

/// Create a copy of RouteDirection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteDirectionCopyWith<_RouteDirection> get copyWith => __$RouteDirectionCopyWithImpl<_RouteDirection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteDirection&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.timeMinutes, timeMinutes) || other.timeMinutes == timeMinutes)&&(identical(other.maneuverType, maneuverType) || other.maneuverType == maneuverType)&&(identical(other.streetName, streetName) || other.streetName == streetName));
}


@override
int get hashCode => Object.hash(runtimeType,instruction,distanceMeters,timeMinutes,maneuverType,streetName);

@override
String toString() {
  return 'RouteDirection(instruction: $instruction, distanceMeters: $distanceMeters, timeMinutes: $timeMinutes, maneuverType: $maneuverType, streetName: $streetName)';
}


}

/// @nodoc
abstract mixin class _$RouteDirectionCopyWith<$Res> implements $RouteDirectionCopyWith<$Res> {
  factory _$RouteDirectionCopyWith(_RouteDirection value, $Res Function(_RouteDirection) _then) = __$RouteDirectionCopyWithImpl;
@override @useResult
$Res call({
 String instruction, double distanceMeters, double timeMinutes, ManeuverType maneuverType, String? streetName
});




}
/// @nodoc
class __$RouteDirectionCopyWithImpl<$Res>
    implements _$RouteDirectionCopyWith<$Res> {
  __$RouteDirectionCopyWithImpl(this._self, this._then);

  final _RouteDirection _self;
  final $Res Function(_RouteDirection) _then;

/// Create a copy of RouteDirection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? instruction = null,Object? distanceMeters = null,Object? timeMinutes = null,Object? maneuverType = null,Object? streetName = freezed,}) {
  return _then(_RouteDirection(
instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double,timeMinutes: null == timeMinutes ? _self.timeMinutes : timeMinutes // ignore: cast_nullable_to_non_nullable
as double,maneuverType: null == maneuverType ? _self.maneuverType : maneuverType // ignore: cast_nullable_to_non_nullable
as ManeuverType,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$AlternativeRoutesResult {

 RouteResult get recommendedRoute; List<RouteAlternative> get alternatives;
/// Create a copy of AlternativeRoutesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlternativeRoutesResultCopyWith<AlternativeRoutesResult> get copyWith => _$AlternativeRoutesResultCopyWithImpl<AlternativeRoutesResult>(this as AlternativeRoutesResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlternativeRoutesResult&&(identical(other.recommendedRoute, recommendedRoute) || other.recommendedRoute == recommendedRoute)&&const DeepCollectionEquality().equals(other.alternatives, alternatives));
}


@override
int get hashCode => Object.hash(runtimeType,recommendedRoute,const DeepCollectionEquality().hash(alternatives));

@override
String toString() {
  return 'AlternativeRoutesResult(recommendedRoute: $recommendedRoute, alternatives: $alternatives)';
}


}

/// @nodoc
abstract mixin class $AlternativeRoutesResultCopyWith<$Res>  {
  factory $AlternativeRoutesResultCopyWith(AlternativeRoutesResult value, $Res Function(AlternativeRoutesResult) _then) = _$AlternativeRoutesResultCopyWithImpl;
@useResult
$Res call({
 RouteResult recommendedRoute, List<RouteAlternative> alternatives
});


$RouteResultCopyWith<$Res> get recommendedRoute;

}
/// @nodoc
class _$AlternativeRoutesResultCopyWithImpl<$Res>
    implements $AlternativeRoutesResultCopyWith<$Res> {
  _$AlternativeRoutesResultCopyWithImpl(this._self, this._then);

  final AlternativeRoutesResult _self;
  final $Res Function(AlternativeRoutesResult) _then;

/// Create a copy of AlternativeRoutesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recommendedRoute = null,Object? alternatives = null,}) {
  return _then(_self.copyWith(
recommendedRoute: null == recommendedRoute ? _self.recommendedRoute : recommendedRoute // ignore: cast_nullable_to_non_nullable
as RouteResult,alternatives: null == alternatives ? _self.alternatives : alternatives // ignore: cast_nullable_to_non_nullable
as List<RouteAlternative>,
  ));
}
/// Create a copy of AlternativeRoutesResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteResultCopyWith<$Res> get recommendedRoute {
  
  return $RouteResultCopyWith<$Res>(_self.recommendedRoute, (value) {
    return _then(_self.copyWith(recommendedRoute: value));
  });
}
}


/// Adds pattern-matching-related methods to [AlternativeRoutesResult].
extension AlternativeRoutesResultPatterns on AlternativeRoutesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlternativeRoutesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlternativeRoutesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlternativeRoutesResult value)  $default,){
final _that = this;
switch (_that) {
case _AlternativeRoutesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlternativeRoutesResult value)?  $default,){
final _that = this;
switch (_that) {
case _AlternativeRoutesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RouteResult recommendedRoute,  List<RouteAlternative> alternatives)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlternativeRoutesResult() when $default != null:
return $default(_that.recommendedRoute,_that.alternatives);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RouteResult recommendedRoute,  List<RouteAlternative> alternatives)  $default,) {final _that = this;
switch (_that) {
case _AlternativeRoutesResult():
return $default(_that.recommendedRoute,_that.alternatives);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RouteResult recommendedRoute,  List<RouteAlternative> alternatives)?  $default,) {final _that = this;
switch (_that) {
case _AlternativeRoutesResult() when $default != null:
return $default(_that.recommendedRoute,_that.alternatives);case _:
  return null;

}
}

}

/// @nodoc


class _AlternativeRoutesResult extends AlternativeRoutesResult {
  const _AlternativeRoutesResult({required this.recommendedRoute, required final  List<RouteAlternative> alternatives}): _alternatives = alternatives,super._();
  

@override final  RouteResult recommendedRoute;
 final  List<RouteAlternative> _alternatives;
@override List<RouteAlternative> get alternatives {
  if (_alternatives is EqualUnmodifiableListView) return _alternatives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alternatives);
}


/// Create a copy of AlternativeRoutesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlternativeRoutesResultCopyWith<_AlternativeRoutesResult> get copyWith => __$AlternativeRoutesResultCopyWithImpl<_AlternativeRoutesResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlternativeRoutesResult&&(identical(other.recommendedRoute, recommendedRoute) || other.recommendedRoute == recommendedRoute)&&const DeepCollectionEquality().equals(other._alternatives, _alternatives));
}


@override
int get hashCode => Object.hash(runtimeType,recommendedRoute,const DeepCollectionEquality().hash(_alternatives));

@override
String toString() {
  return 'AlternativeRoutesResult(recommendedRoute: $recommendedRoute, alternatives: $alternatives)';
}


}

/// @nodoc
abstract mixin class _$AlternativeRoutesResultCopyWith<$Res> implements $AlternativeRoutesResultCopyWith<$Res> {
  factory _$AlternativeRoutesResultCopyWith(_AlternativeRoutesResult value, $Res Function(_AlternativeRoutesResult) _then) = __$AlternativeRoutesResultCopyWithImpl;
@override @useResult
$Res call({
 RouteResult recommendedRoute, List<RouteAlternative> alternatives
});


@override $RouteResultCopyWith<$Res> get recommendedRoute;

}
/// @nodoc
class __$AlternativeRoutesResultCopyWithImpl<$Res>
    implements _$AlternativeRoutesResultCopyWith<$Res> {
  __$AlternativeRoutesResultCopyWithImpl(this._self, this._then);

  final _AlternativeRoutesResult _self;
  final $Res Function(_AlternativeRoutesResult) _then;

/// Create a copy of AlternativeRoutesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recommendedRoute = null,Object? alternatives = null,}) {
  return _then(_AlternativeRoutesResult(
recommendedRoute: null == recommendedRoute ? _self.recommendedRoute : recommendedRoute // ignore: cast_nullable_to_non_nullable
as RouteResult,alternatives: null == alternatives ? _self._alternatives : alternatives // ignore: cast_nullable_to_non_nullable
as List<RouteAlternative>,
  ));
}

/// Create a copy of AlternativeRoutesResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteResultCopyWith<$Res> get recommendedRoute {
  
  return $RouteResultCopyWith<$Res>(_self.recommendedRoute, (value) {
    return _then(_self.copyWith(recommendedRoute: value));
  });
}
}

/// @nodoc
mixin _$RouteAlternative {

 RouteStrategy get strategy; RouteResult get route; String? get comparisonNote;
/// Create a copy of RouteAlternative
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteAlternativeCopyWith<RouteAlternative> get copyWith => _$RouteAlternativeCopyWithImpl<RouteAlternative>(this as RouteAlternative, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteAlternative&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.route, route) || other.route == route)&&(identical(other.comparisonNote, comparisonNote) || other.comparisonNote == comparisonNote));
}


@override
int get hashCode => Object.hash(runtimeType,strategy,route,comparisonNote);

@override
String toString() {
  return 'RouteAlternative(strategy: $strategy, route: $route, comparisonNote: $comparisonNote)';
}


}

/// @nodoc
abstract mixin class $RouteAlternativeCopyWith<$Res>  {
  factory $RouteAlternativeCopyWith(RouteAlternative value, $Res Function(RouteAlternative) _then) = _$RouteAlternativeCopyWithImpl;
@useResult
$Res call({
 RouteStrategy strategy, RouteResult route, String? comparisonNote
});


$RouteResultCopyWith<$Res> get route;

}
/// @nodoc
class _$RouteAlternativeCopyWithImpl<$Res>
    implements $RouteAlternativeCopyWith<$Res> {
  _$RouteAlternativeCopyWithImpl(this._self, this._then);

  final RouteAlternative _self;
  final $Res Function(RouteAlternative) _then;

/// Create a copy of RouteAlternative
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? strategy = null,Object? route = null,Object? comparisonNote = freezed,}) {
  return _then(_self.copyWith(
strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as RouteStrategy,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as RouteResult,comparisonNote: freezed == comparisonNote ? _self.comparisonNote : comparisonNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RouteAlternative
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteResultCopyWith<$Res> get route {
  
  return $RouteResultCopyWith<$Res>(_self.route, (value) {
    return _then(_self.copyWith(route: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteAlternative].
extension RouteAlternativePatterns on RouteAlternative {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteAlternative value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteAlternative() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteAlternative value)  $default,){
final _that = this;
switch (_that) {
case _RouteAlternative():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteAlternative value)?  $default,){
final _that = this;
switch (_that) {
case _RouteAlternative() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RouteStrategy strategy,  RouteResult route,  String? comparisonNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteAlternative() when $default != null:
return $default(_that.strategy,_that.route,_that.comparisonNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RouteStrategy strategy,  RouteResult route,  String? comparisonNote)  $default,) {final _that = this;
switch (_that) {
case _RouteAlternative():
return $default(_that.strategy,_that.route,_that.comparisonNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RouteStrategy strategy,  RouteResult route,  String? comparisonNote)?  $default,) {final _that = this;
switch (_that) {
case _RouteAlternative() when $default != null:
return $default(_that.strategy,_that.route,_that.comparisonNote);case _:
  return null;

}
}

}

/// @nodoc


class _RouteAlternative extends RouteAlternative {
  const _RouteAlternative({required this.strategy, required this.route, this.comparisonNote}): super._();
  

@override final  RouteStrategy strategy;
@override final  RouteResult route;
@override final  String? comparisonNote;

/// Create a copy of RouteAlternative
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteAlternativeCopyWith<_RouteAlternative> get copyWith => __$RouteAlternativeCopyWithImpl<_RouteAlternative>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteAlternative&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.route, route) || other.route == route)&&(identical(other.comparisonNote, comparisonNote) || other.comparisonNote == comparisonNote));
}


@override
int get hashCode => Object.hash(runtimeType,strategy,route,comparisonNote);

@override
String toString() {
  return 'RouteAlternative(strategy: $strategy, route: $route, comparisonNote: $comparisonNote)';
}


}

/// @nodoc
abstract mixin class _$RouteAlternativeCopyWith<$Res> implements $RouteAlternativeCopyWith<$Res> {
  factory _$RouteAlternativeCopyWith(_RouteAlternative value, $Res Function(_RouteAlternative) _then) = __$RouteAlternativeCopyWithImpl;
@override @useResult
$Res call({
 RouteStrategy strategy, RouteResult route, String? comparisonNote
});


@override $RouteResultCopyWith<$Res> get route;

}
/// @nodoc
class __$RouteAlternativeCopyWithImpl<$Res>
    implements _$RouteAlternativeCopyWith<$Res> {
  __$RouteAlternativeCopyWithImpl(this._self, this._then);

  final _RouteAlternative _self;
  final $Res Function(_RouteAlternative) _then;

/// Create a copy of RouteAlternative
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? strategy = null,Object? route = null,Object? comparisonNote = freezed,}) {
  return _then(_RouteAlternative(
strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as RouteStrategy,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as RouteResult,comparisonNote: freezed == comparisonNote ? _self.comparisonNote : comparisonNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RouteAlternative
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteResultCopyWith<$Res> get route {
  
  return $RouteResultCopyWith<$Res>(_self.route, (value) {
    return _then(_self.copyWith(route: value));
  });
}
}

// dart format on
