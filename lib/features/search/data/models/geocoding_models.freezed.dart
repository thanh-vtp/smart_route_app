// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocoding_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationPoint {

@JsonKey(name: 'x') double get lng;@JsonKey(name: 'y') double get lat;
/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationPointCopyWith<LocationPoint> get copyWith => _$LocationPointCopyWithImpl<LocationPoint>(this as LocationPoint, _$identity);

  /// Serializes this LocationPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationPoint&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.lat, lat) || other.lat == lat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lng,lat);

@override
String toString() {
  return 'LocationPoint(lng: $lng, lat: $lat)';
}


}

/// @nodoc
abstract mixin class $LocationPointCopyWith<$Res>  {
  factory $LocationPointCopyWith(LocationPoint value, $Res Function(LocationPoint) _then) = _$LocationPointCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'x') double lng,@JsonKey(name: 'y') double lat
});




}
/// @nodoc
class _$LocationPointCopyWithImpl<$Res>
    implements $LocationPointCopyWith<$Res> {
  _$LocationPointCopyWithImpl(this._self, this._then);

  final LocationPoint _self;
  final $Res Function(LocationPoint) _then;

/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lng = null,Object? lat = null,}) {
  return _then(_self.copyWith(
lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationPoint].
extension LocationPointPatterns on LocationPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationPoint value)  $default,){
final _that = this;
switch (_that) {
case _LocationPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationPoint value)?  $default,){
final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'x')  double lng, @JsonKey(name: 'y')  double lat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
return $default(_that.lng,_that.lat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'x')  double lng, @JsonKey(name: 'y')  double lat)  $default,) {final _that = this;
switch (_that) {
case _LocationPoint():
return $default(_that.lng,_that.lat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'x')  double lng, @JsonKey(name: 'y')  double lat)?  $default,) {final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
return $default(_that.lng,_that.lat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationPoint implements LocationPoint {
  const _LocationPoint({@JsonKey(name: 'x') this.lng = 0.0, @JsonKey(name: 'y') this.lat = 0.0});
  factory _LocationPoint.fromJson(Map<String, dynamic> json) => _$LocationPointFromJson(json);

@override@JsonKey(name: 'x') final  double lng;
@override@JsonKey(name: 'y') final  double lat;

/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationPointCopyWith<_LocationPoint> get copyWith => __$LocationPointCopyWithImpl<_LocationPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationPoint&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.lat, lat) || other.lat == lat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lng,lat);

@override
String toString() {
  return 'LocationPoint(lng: $lng, lat: $lat)';
}


}

/// @nodoc
abstract mixin class _$LocationPointCopyWith<$Res> implements $LocationPointCopyWith<$Res> {
  factory _$LocationPointCopyWith(_LocationPoint value, $Res Function(_LocationPoint) _then) = __$LocationPointCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'x') double lng,@JsonKey(name: 'y') double lat
});




}
/// @nodoc
class __$LocationPointCopyWithImpl<$Res>
    implements _$LocationPointCopyWith<$Res> {
  __$LocationPointCopyWithImpl(this._self, this._then);

  final _LocationPoint _self;
  final $Res Function(_LocationPoint) _then;

/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lng = null,Object? lat = null,}) {
  return _then(_LocationPoint(
lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$GeocodeResponse {

@JsonKey(name: 'candidates') List<GeocodeCandidate> get candidates;
/// Create a copy of GeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeocodeResponseCopyWith<GeocodeResponse> get copyWith => _$GeocodeResponseCopyWithImpl<GeocodeResponse>(this as GeocodeResponse, _$identity);

  /// Serializes this GeocodeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeocodeResponse&&const DeepCollectionEquality().equals(other.candidates, candidates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(candidates));

@override
String toString() {
  return 'GeocodeResponse(candidates: $candidates)';
}


}

/// @nodoc
abstract mixin class $GeocodeResponseCopyWith<$Res>  {
  factory $GeocodeResponseCopyWith(GeocodeResponse value, $Res Function(GeocodeResponse) _then) = _$GeocodeResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'candidates') List<GeocodeCandidate> candidates
});




}
/// @nodoc
class _$GeocodeResponseCopyWithImpl<$Res>
    implements $GeocodeResponseCopyWith<$Res> {
  _$GeocodeResponseCopyWithImpl(this._self, this._then);

  final GeocodeResponse _self;
  final $Res Function(GeocodeResponse) _then;

/// Create a copy of GeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? candidates = null,}) {
  return _then(_self.copyWith(
candidates: null == candidates ? _self.candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<GeocodeCandidate>,
  ));
}

}


/// Adds pattern-matching-related methods to [GeocodeResponse].
extension GeocodeResponsePatterns on GeocodeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeocodeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeocodeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeocodeResponse value)  $default,){
final _that = this;
switch (_that) {
case _GeocodeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeocodeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GeocodeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'candidates')  List<GeocodeCandidate> candidates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeocodeResponse() when $default != null:
return $default(_that.candidates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'candidates')  List<GeocodeCandidate> candidates)  $default,) {final _that = this;
switch (_that) {
case _GeocodeResponse():
return $default(_that.candidates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'candidates')  List<GeocodeCandidate> candidates)?  $default,) {final _that = this;
switch (_that) {
case _GeocodeResponse() when $default != null:
return $default(_that.candidates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeocodeResponse implements GeocodeResponse {
  const _GeocodeResponse({@JsonKey(name: 'candidates') final  List<GeocodeCandidate> candidates = const []}): _candidates = candidates;
  factory _GeocodeResponse.fromJson(Map<String, dynamic> json) => _$GeocodeResponseFromJson(json);

 final  List<GeocodeCandidate> _candidates;
@override@JsonKey(name: 'candidates') List<GeocodeCandidate> get candidates {
  if (_candidates is EqualUnmodifiableListView) return _candidates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_candidates);
}


/// Create a copy of GeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeocodeResponseCopyWith<_GeocodeResponse> get copyWith => __$GeocodeResponseCopyWithImpl<_GeocodeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeocodeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeocodeResponse&&const DeepCollectionEquality().equals(other._candidates, _candidates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_candidates));

@override
String toString() {
  return 'GeocodeResponse(candidates: $candidates)';
}


}

/// @nodoc
abstract mixin class _$GeocodeResponseCopyWith<$Res> implements $GeocodeResponseCopyWith<$Res> {
  factory _$GeocodeResponseCopyWith(_GeocodeResponse value, $Res Function(_GeocodeResponse) _then) = __$GeocodeResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'candidates') List<GeocodeCandidate> candidates
});




}
/// @nodoc
class __$GeocodeResponseCopyWithImpl<$Res>
    implements _$GeocodeResponseCopyWith<$Res> {
  __$GeocodeResponseCopyWithImpl(this._self, this._then);

  final _GeocodeResponse _self;
  final $Res Function(_GeocodeResponse) _then;

/// Create a copy of GeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? candidates = null,}) {
  return _then(_GeocodeResponse(
candidates: null == candidates ? _self._candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<GeocodeCandidate>,
  ));
}


}


/// @nodoc
mixin _$GeocodeCandidate {

@JsonKey(name: 'address') String get address;@JsonKey(name: 'location') LocationPoint get location;@JsonKey(name: 'score') double get score;@JsonKey(name: 'attributes') Map<String, dynamic> get attributes;@JsonKey(name: 'extent') Map<String, dynamic>? get extent;
/// Create a copy of GeocodeCandidate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeocodeCandidateCopyWith<GeocodeCandidate> get copyWith => _$GeocodeCandidateCopyWithImpl<GeocodeCandidate>(this as GeocodeCandidate, _$identity);

  /// Serializes this GeocodeCandidate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeocodeCandidate&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&const DeepCollectionEquality().equals(other.extent, extent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,location,score,const DeepCollectionEquality().hash(attributes),const DeepCollectionEquality().hash(extent));

@override
String toString() {
  return 'GeocodeCandidate(address: $address, location: $location, score: $score, attributes: $attributes, extent: $extent)';
}


}

/// @nodoc
abstract mixin class $GeocodeCandidateCopyWith<$Res>  {
  factory $GeocodeCandidateCopyWith(GeocodeCandidate value, $Res Function(GeocodeCandidate) _then) = _$GeocodeCandidateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'address') String address,@JsonKey(name: 'location') LocationPoint location,@JsonKey(name: 'score') double score,@JsonKey(name: 'attributes') Map<String, dynamic> attributes,@JsonKey(name: 'extent') Map<String, dynamic>? extent
});


$LocationPointCopyWith<$Res> get location;

}
/// @nodoc
class _$GeocodeCandidateCopyWithImpl<$Res>
    implements $GeocodeCandidateCopyWith<$Res> {
  _$GeocodeCandidateCopyWithImpl(this._self, this._then);

  final GeocodeCandidate _self;
  final $Res Function(GeocodeCandidate) _then;

/// Create a copy of GeocodeCandidate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? location = null,Object? score = null,Object? attributes = null,Object? extent = freezed,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationPoint,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,extent: freezed == extent ? _self.extent : extent // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of GeocodeCandidate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res> get location {
  
  return $LocationPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [GeocodeCandidate].
extension GeocodeCandidatePatterns on GeocodeCandidate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeocodeCandidate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeocodeCandidate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeocodeCandidate value)  $default,){
final _that = this;
switch (_that) {
case _GeocodeCandidate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeocodeCandidate value)?  $default,){
final _that = this;
switch (_that) {
case _GeocodeCandidate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'address')  String address, @JsonKey(name: 'location')  LocationPoint location, @JsonKey(name: 'score')  double score, @JsonKey(name: 'attributes')  Map<String, dynamic> attributes, @JsonKey(name: 'extent')  Map<String, dynamic>? extent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeocodeCandidate() when $default != null:
return $default(_that.address,_that.location,_that.score,_that.attributes,_that.extent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'address')  String address, @JsonKey(name: 'location')  LocationPoint location, @JsonKey(name: 'score')  double score, @JsonKey(name: 'attributes')  Map<String, dynamic> attributes, @JsonKey(name: 'extent')  Map<String, dynamic>? extent)  $default,) {final _that = this;
switch (_that) {
case _GeocodeCandidate():
return $default(_that.address,_that.location,_that.score,_that.attributes,_that.extent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'address')  String address, @JsonKey(name: 'location')  LocationPoint location, @JsonKey(name: 'score')  double score, @JsonKey(name: 'attributes')  Map<String, dynamic> attributes, @JsonKey(name: 'extent')  Map<String, dynamic>? extent)?  $default,) {final _that = this;
switch (_that) {
case _GeocodeCandidate() when $default != null:
return $default(_that.address,_that.location,_that.score,_that.attributes,_that.extent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeocodeCandidate extends GeocodeCandidate {
  const _GeocodeCandidate({@JsonKey(name: 'address') this.address = '', @JsonKey(name: 'location') required this.location, @JsonKey(name: 'score') this.score = 0.0, @JsonKey(name: 'attributes') final  Map<String, dynamic> attributes = const {}, @JsonKey(name: 'extent') final  Map<String, dynamic>? extent}): _attributes = attributes,_extent = extent,super._();
  factory _GeocodeCandidate.fromJson(Map<String, dynamic> json) => _$GeocodeCandidateFromJson(json);

@override@JsonKey(name: 'address') final  String address;
@override@JsonKey(name: 'location') final  LocationPoint location;
@override@JsonKey(name: 'score') final  double score;
 final  Map<String, dynamic> _attributes;
@override@JsonKey(name: 'attributes') Map<String, dynamic> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}

 final  Map<String, dynamic>? _extent;
@override@JsonKey(name: 'extent') Map<String, dynamic>? get extent {
  final value = _extent;
  if (value == null) return null;
  if (_extent is EqualUnmodifiableMapView) return _extent;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of GeocodeCandidate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeocodeCandidateCopyWith<_GeocodeCandidate> get copyWith => __$GeocodeCandidateCopyWithImpl<_GeocodeCandidate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeocodeCandidateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeocodeCandidate&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&const DeepCollectionEquality().equals(other._extent, _extent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,location,score,const DeepCollectionEquality().hash(_attributes),const DeepCollectionEquality().hash(_extent));

@override
String toString() {
  return 'GeocodeCandidate(address: $address, location: $location, score: $score, attributes: $attributes, extent: $extent)';
}


}

/// @nodoc
abstract mixin class _$GeocodeCandidateCopyWith<$Res> implements $GeocodeCandidateCopyWith<$Res> {
  factory _$GeocodeCandidateCopyWith(_GeocodeCandidate value, $Res Function(_GeocodeCandidate) _then) = __$GeocodeCandidateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'address') String address,@JsonKey(name: 'location') LocationPoint location,@JsonKey(name: 'score') double score,@JsonKey(name: 'attributes') Map<String, dynamic> attributes,@JsonKey(name: 'extent') Map<String, dynamic>? extent
});


@override $LocationPointCopyWith<$Res> get location;

}
/// @nodoc
class __$GeocodeCandidateCopyWithImpl<$Res>
    implements _$GeocodeCandidateCopyWith<$Res> {
  __$GeocodeCandidateCopyWithImpl(this._self, this._then);

  final _GeocodeCandidate _self;
  final $Res Function(_GeocodeCandidate) _then;

/// Create a copy of GeocodeCandidate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? location = null,Object? score = null,Object? attributes = null,Object? extent = freezed,}) {
  return _then(_GeocodeCandidate(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationPoint,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,extent: freezed == extent ? _self._extent : extent // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of GeocodeCandidate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res> get location {
  
  return $LocationPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$ReverseGeocodeResponse {

@JsonKey(name: 'address') AddressInfo get address;@JsonKey(name: 'location') LocationPoint get location;
/// Create a copy of ReverseGeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReverseGeocodeResponseCopyWith<ReverseGeocodeResponse> get copyWith => _$ReverseGeocodeResponseCopyWithImpl<ReverseGeocodeResponse>(this as ReverseGeocodeResponse, _$identity);

  /// Serializes this ReverseGeocodeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReverseGeocodeResponse&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,location);

@override
String toString() {
  return 'ReverseGeocodeResponse(address: $address, location: $location)';
}


}

/// @nodoc
abstract mixin class $ReverseGeocodeResponseCopyWith<$Res>  {
  factory $ReverseGeocodeResponseCopyWith(ReverseGeocodeResponse value, $Res Function(ReverseGeocodeResponse) _then) = _$ReverseGeocodeResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'address') AddressInfo address,@JsonKey(name: 'location') LocationPoint location
});


$AddressInfoCopyWith<$Res> get address;$LocationPointCopyWith<$Res> get location;

}
/// @nodoc
class _$ReverseGeocodeResponseCopyWithImpl<$Res>
    implements $ReverseGeocodeResponseCopyWith<$Res> {
  _$ReverseGeocodeResponseCopyWithImpl(this._self, this._then);

  final ReverseGeocodeResponse _self;
  final $Res Function(ReverseGeocodeResponse) _then;

/// Create a copy of ReverseGeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? location = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressInfo,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationPoint,
  ));
}
/// Create a copy of ReverseGeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressInfoCopyWith<$Res> get address {
  
  return $AddressInfoCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of ReverseGeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res> get location {
  
  return $LocationPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReverseGeocodeResponse].
extension ReverseGeocodeResponsePatterns on ReverseGeocodeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReverseGeocodeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReverseGeocodeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReverseGeocodeResponse value)  $default,){
final _that = this;
switch (_that) {
case _ReverseGeocodeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReverseGeocodeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ReverseGeocodeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'address')  AddressInfo address, @JsonKey(name: 'location')  LocationPoint location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReverseGeocodeResponse() when $default != null:
return $default(_that.address,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'address')  AddressInfo address, @JsonKey(name: 'location')  LocationPoint location)  $default,) {final _that = this;
switch (_that) {
case _ReverseGeocodeResponse():
return $default(_that.address,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'address')  AddressInfo address, @JsonKey(name: 'location')  LocationPoint location)?  $default,) {final _that = this;
switch (_that) {
case _ReverseGeocodeResponse() when $default != null:
return $default(_that.address,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReverseGeocodeResponse extends ReverseGeocodeResponse {
  const _ReverseGeocodeResponse({@JsonKey(name: 'address') required this.address, @JsonKey(name: 'location') required this.location}): super._();
  factory _ReverseGeocodeResponse.fromJson(Map<String, dynamic> json) => _$ReverseGeocodeResponseFromJson(json);

@override@JsonKey(name: 'address') final  AddressInfo address;
@override@JsonKey(name: 'location') final  LocationPoint location;

/// Create a copy of ReverseGeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReverseGeocodeResponseCopyWith<_ReverseGeocodeResponse> get copyWith => __$ReverseGeocodeResponseCopyWithImpl<_ReverseGeocodeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReverseGeocodeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReverseGeocodeResponse&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,location);

@override
String toString() {
  return 'ReverseGeocodeResponse(address: $address, location: $location)';
}


}

/// @nodoc
abstract mixin class _$ReverseGeocodeResponseCopyWith<$Res> implements $ReverseGeocodeResponseCopyWith<$Res> {
  factory _$ReverseGeocodeResponseCopyWith(_ReverseGeocodeResponse value, $Res Function(_ReverseGeocodeResponse) _then) = __$ReverseGeocodeResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'address') AddressInfo address,@JsonKey(name: 'location') LocationPoint location
});


@override $AddressInfoCopyWith<$Res> get address;@override $LocationPointCopyWith<$Res> get location;

}
/// @nodoc
class __$ReverseGeocodeResponseCopyWithImpl<$Res>
    implements _$ReverseGeocodeResponseCopyWith<$Res> {
  __$ReverseGeocodeResponseCopyWithImpl(this._self, this._then);

  final _ReverseGeocodeResponse _self;
  final $Res Function(_ReverseGeocodeResponse) _then;

/// Create a copy of ReverseGeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? location = null,}) {
  return _then(_ReverseGeocodeResponse(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressInfo,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationPoint,
  ));
}

/// Create a copy of ReverseGeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressInfoCopyWith<$Res> get address {
  
  return $AddressInfoCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of ReverseGeocodeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res> get location {
  
  return $LocationPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$AddressInfo {

@JsonKey(name: 'Match_addr') String? get fullAddress;@JsonKey(name: 'LongLabel') String? get longLabel;@JsonKey(name: 'ShortLabel') String? get shortLabel;@JsonKey(name: 'AddNum') String? get houseNumber;@JsonKey(name: 'StPreType') String? get streetPrefix;@JsonKey(name: 'StName') String? get streetName;@JsonKey(name: 'Nbrhd') String? get ward;@JsonKey(name: 'District') String? get district;@JsonKey(name: 'City') String? get city;@JsonKey(name: 'Region') String? get province;@JsonKey(name: 'CntryName') String? get countryName;@JsonKey(name: 'Postal') String? get postalCode;@JsonKey(name: 'PlaceName') String? get placeName;@JsonKey(name: 'Type') String? get placeType;
/// Create a copy of AddressInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressInfoCopyWith<AddressInfo> get copyWith => _$AddressInfoCopyWithImpl<AddressInfo>(this as AddressInfo, _$identity);

  /// Serializes this AddressInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressInfo&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.longLabel, longLabel) || other.longLabel == longLabel)&&(identical(other.shortLabel, shortLabel) || other.shortLabel == shortLabel)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.streetPrefix, streetPrefix) || other.streetPrefix == streetPrefix)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&(identical(other.province, province) || other.province == province)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.placeType, placeType) || other.placeType == placeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullAddress,longLabel,shortLabel,houseNumber,streetPrefix,streetName,ward,district,city,province,countryName,postalCode,placeName,placeType);

@override
String toString() {
  return 'AddressInfo(fullAddress: $fullAddress, longLabel: $longLabel, shortLabel: $shortLabel, houseNumber: $houseNumber, streetPrefix: $streetPrefix, streetName: $streetName, ward: $ward, district: $district, city: $city, province: $province, countryName: $countryName, postalCode: $postalCode, placeName: $placeName, placeType: $placeType)';
}


}

/// @nodoc
abstract mixin class $AddressInfoCopyWith<$Res>  {
  factory $AddressInfoCopyWith(AddressInfo value, $Res Function(AddressInfo) _then) = _$AddressInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Match_addr') String? fullAddress,@JsonKey(name: 'LongLabel') String? longLabel,@JsonKey(name: 'ShortLabel') String? shortLabel,@JsonKey(name: 'AddNum') String? houseNumber,@JsonKey(name: 'StPreType') String? streetPrefix,@JsonKey(name: 'StName') String? streetName,@JsonKey(name: 'Nbrhd') String? ward,@JsonKey(name: 'District') String? district,@JsonKey(name: 'City') String? city,@JsonKey(name: 'Region') String? province,@JsonKey(name: 'CntryName') String? countryName,@JsonKey(name: 'Postal') String? postalCode,@JsonKey(name: 'PlaceName') String? placeName,@JsonKey(name: 'Type') String? placeType
});




}
/// @nodoc
class _$AddressInfoCopyWithImpl<$Res>
    implements $AddressInfoCopyWith<$Res> {
  _$AddressInfoCopyWithImpl(this._self, this._then);

  final AddressInfo _self;
  final $Res Function(AddressInfo) _then;

/// Create a copy of AddressInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullAddress = freezed,Object? longLabel = freezed,Object? shortLabel = freezed,Object? houseNumber = freezed,Object? streetPrefix = freezed,Object? streetName = freezed,Object? ward = freezed,Object? district = freezed,Object? city = freezed,Object? province = freezed,Object? countryName = freezed,Object? postalCode = freezed,Object? placeName = freezed,Object? placeType = freezed,}) {
  return _then(_self.copyWith(
fullAddress: freezed == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String?,longLabel: freezed == longLabel ? _self.longLabel : longLabel // ignore: cast_nullable_to_non_nullable
as String?,shortLabel: freezed == shortLabel ? _self.shortLabel : shortLabel // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,streetPrefix: freezed == streetPrefix ? _self.streetPrefix : streetPrefix // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,countryName: freezed == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,placeType: freezed == placeType ? _self.placeType : placeType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressInfo].
extension AddressInfoPatterns on AddressInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressInfo value)  $default,){
final _that = this;
switch (_that) {
case _AddressInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AddressInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Match_addr')  String? fullAddress, @JsonKey(name: 'LongLabel')  String? longLabel, @JsonKey(name: 'ShortLabel')  String? shortLabel, @JsonKey(name: 'AddNum')  String? houseNumber, @JsonKey(name: 'StPreType')  String? streetPrefix, @JsonKey(name: 'StName')  String? streetName, @JsonKey(name: 'Nbrhd')  String? ward, @JsonKey(name: 'District')  String? district, @JsonKey(name: 'City')  String? city, @JsonKey(name: 'Region')  String? province, @JsonKey(name: 'CntryName')  String? countryName, @JsonKey(name: 'Postal')  String? postalCode, @JsonKey(name: 'PlaceName')  String? placeName, @JsonKey(name: 'Type')  String? placeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressInfo() when $default != null:
return $default(_that.fullAddress,_that.longLabel,_that.shortLabel,_that.houseNumber,_that.streetPrefix,_that.streetName,_that.ward,_that.district,_that.city,_that.province,_that.countryName,_that.postalCode,_that.placeName,_that.placeType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Match_addr')  String? fullAddress, @JsonKey(name: 'LongLabel')  String? longLabel, @JsonKey(name: 'ShortLabel')  String? shortLabel, @JsonKey(name: 'AddNum')  String? houseNumber, @JsonKey(name: 'StPreType')  String? streetPrefix, @JsonKey(name: 'StName')  String? streetName, @JsonKey(name: 'Nbrhd')  String? ward, @JsonKey(name: 'District')  String? district, @JsonKey(name: 'City')  String? city, @JsonKey(name: 'Region')  String? province, @JsonKey(name: 'CntryName')  String? countryName, @JsonKey(name: 'Postal')  String? postalCode, @JsonKey(name: 'PlaceName')  String? placeName, @JsonKey(name: 'Type')  String? placeType)  $default,) {final _that = this;
switch (_that) {
case _AddressInfo():
return $default(_that.fullAddress,_that.longLabel,_that.shortLabel,_that.houseNumber,_that.streetPrefix,_that.streetName,_that.ward,_that.district,_that.city,_that.province,_that.countryName,_that.postalCode,_that.placeName,_that.placeType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Match_addr')  String? fullAddress, @JsonKey(name: 'LongLabel')  String? longLabel, @JsonKey(name: 'ShortLabel')  String? shortLabel, @JsonKey(name: 'AddNum')  String? houseNumber, @JsonKey(name: 'StPreType')  String? streetPrefix, @JsonKey(name: 'StName')  String? streetName, @JsonKey(name: 'Nbrhd')  String? ward, @JsonKey(name: 'District')  String? district, @JsonKey(name: 'City')  String? city, @JsonKey(name: 'Region')  String? province, @JsonKey(name: 'CntryName')  String? countryName, @JsonKey(name: 'Postal')  String? postalCode, @JsonKey(name: 'PlaceName')  String? placeName, @JsonKey(name: 'Type')  String? placeType)?  $default,) {final _that = this;
switch (_that) {
case _AddressInfo() when $default != null:
return $default(_that.fullAddress,_that.longLabel,_that.shortLabel,_that.houseNumber,_that.streetPrefix,_that.streetName,_that.ward,_that.district,_that.city,_that.province,_that.countryName,_that.postalCode,_that.placeName,_that.placeType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressInfo implements AddressInfo {
  const _AddressInfo({@JsonKey(name: 'Match_addr') this.fullAddress, @JsonKey(name: 'LongLabel') this.longLabel, @JsonKey(name: 'ShortLabel') this.shortLabel, @JsonKey(name: 'AddNum') this.houseNumber, @JsonKey(name: 'StPreType') this.streetPrefix, @JsonKey(name: 'StName') this.streetName, @JsonKey(name: 'Nbrhd') this.ward, @JsonKey(name: 'District') this.district, @JsonKey(name: 'City') this.city, @JsonKey(name: 'Region') this.province, @JsonKey(name: 'CntryName') this.countryName, @JsonKey(name: 'Postal') this.postalCode, @JsonKey(name: 'PlaceName') this.placeName, @JsonKey(name: 'Type') this.placeType});
  factory _AddressInfo.fromJson(Map<String, dynamic> json) => _$AddressInfoFromJson(json);

@override@JsonKey(name: 'Match_addr') final  String? fullAddress;
@override@JsonKey(name: 'LongLabel') final  String? longLabel;
@override@JsonKey(name: 'ShortLabel') final  String? shortLabel;
@override@JsonKey(name: 'AddNum') final  String? houseNumber;
@override@JsonKey(name: 'StPreType') final  String? streetPrefix;
@override@JsonKey(name: 'StName') final  String? streetName;
@override@JsonKey(name: 'Nbrhd') final  String? ward;
@override@JsonKey(name: 'District') final  String? district;
@override@JsonKey(name: 'City') final  String? city;
@override@JsonKey(name: 'Region') final  String? province;
@override@JsonKey(name: 'CntryName') final  String? countryName;
@override@JsonKey(name: 'Postal') final  String? postalCode;
@override@JsonKey(name: 'PlaceName') final  String? placeName;
@override@JsonKey(name: 'Type') final  String? placeType;

/// Create a copy of AddressInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressInfoCopyWith<_AddressInfo> get copyWith => __$AddressInfoCopyWithImpl<_AddressInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressInfo&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.longLabel, longLabel) || other.longLabel == longLabel)&&(identical(other.shortLabel, shortLabel) || other.shortLabel == shortLabel)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.streetPrefix, streetPrefix) || other.streetPrefix == streetPrefix)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&(identical(other.province, province) || other.province == province)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.placeType, placeType) || other.placeType == placeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullAddress,longLabel,shortLabel,houseNumber,streetPrefix,streetName,ward,district,city,province,countryName,postalCode,placeName,placeType);

@override
String toString() {
  return 'AddressInfo(fullAddress: $fullAddress, longLabel: $longLabel, shortLabel: $shortLabel, houseNumber: $houseNumber, streetPrefix: $streetPrefix, streetName: $streetName, ward: $ward, district: $district, city: $city, province: $province, countryName: $countryName, postalCode: $postalCode, placeName: $placeName, placeType: $placeType)';
}


}

/// @nodoc
abstract mixin class _$AddressInfoCopyWith<$Res> implements $AddressInfoCopyWith<$Res> {
  factory _$AddressInfoCopyWith(_AddressInfo value, $Res Function(_AddressInfo) _then) = __$AddressInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Match_addr') String? fullAddress,@JsonKey(name: 'LongLabel') String? longLabel,@JsonKey(name: 'ShortLabel') String? shortLabel,@JsonKey(name: 'AddNum') String? houseNumber,@JsonKey(name: 'StPreType') String? streetPrefix,@JsonKey(name: 'StName') String? streetName,@JsonKey(name: 'Nbrhd') String? ward,@JsonKey(name: 'District') String? district,@JsonKey(name: 'City') String? city,@JsonKey(name: 'Region') String? province,@JsonKey(name: 'CntryName') String? countryName,@JsonKey(name: 'Postal') String? postalCode,@JsonKey(name: 'PlaceName') String? placeName,@JsonKey(name: 'Type') String? placeType
});




}
/// @nodoc
class __$AddressInfoCopyWithImpl<$Res>
    implements _$AddressInfoCopyWith<$Res> {
  __$AddressInfoCopyWithImpl(this._self, this._then);

  final _AddressInfo _self;
  final $Res Function(_AddressInfo) _then;

/// Create a copy of AddressInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullAddress = freezed,Object? longLabel = freezed,Object? shortLabel = freezed,Object? houseNumber = freezed,Object? streetPrefix = freezed,Object? streetName = freezed,Object? ward = freezed,Object? district = freezed,Object? city = freezed,Object? province = freezed,Object? countryName = freezed,Object? postalCode = freezed,Object? placeName = freezed,Object? placeType = freezed,}) {
  return _then(_AddressInfo(
fullAddress: freezed == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String?,longLabel: freezed == longLabel ? _self.longLabel : longLabel // ignore: cast_nullable_to_non_nullable
as String?,shortLabel: freezed == shortLabel ? _self.shortLabel : shortLabel // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,streetPrefix: freezed == streetPrefix ? _self.streetPrefix : streetPrefix // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,countryName: freezed == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,placeType: freezed == placeType ? _self.placeType : placeType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
