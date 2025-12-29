// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocoding_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeocodeResponse _$GeocodeResponseFromJson(Map<String, dynamic> json) {
  return _GeocodeResponse.fromJson(json);
}

/// @nodoc
mixin _$GeocodeResponse {
  @JsonKey(name: 'candidates')
  List<GeocodeCandidate> get candidates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodeResponseCopyWith<GeocodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodeResponseCopyWith<$Res> {
  factory $GeocodeResponseCopyWith(
          GeocodeResponse value, $Res Function(GeocodeResponse) then) =
      _$GeocodeResponseCopyWithImpl<$Res, GeocodeResponse>;
  @useResult
  $Res call({@JsonKey(name: 'candidates') List<GeocodeCandidate> candidates});
}

/// @nodoc
class _$GeocodeResponseCopyWithImpl<$Res, $Val extends GeocodeResponse>
    implements $GeocodeResponseCopyWith<$Res> {
  _$GeocodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = null,
  }) {
    return _then(_value.copyWith(
      candidates: null == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<GeocodeCandidate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeocodeResponseImplCopyWith<$Res>
    implements $GeocodeResponseCopyWith<$Res> {
  factory _$$GeocodeResponseImplCopyWith(_$GeocodeResponseImpl value,
          $Res Function(_$GeocodeResponseImpl) then) =
      __$$GeocodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'candidates') List<GeocodeCandidate> candidates});
}

/// @nodoc
class __$$GeocodeResponseImplCopyWithImpl<$Res>
    extends _$GeocodeResponseCopyWithImpl<$Res, _$GeocodeResponseImpl>
    implements _$$GeocodeResponseImplCopyWith<$Res> {
  __$$GeocodeResponseImplCopyWithImpl(
      _$GeocodeResponseImpl _value, $Res Function(_$GeocodeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = null,
  }) {
    return _then(_$GeocodeResponseImpl(
      candidates: null == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<GeocodeCandidate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeocodeResponseImpl implements _GeocodeResponse {
  const _$GeocodeResponseImpl(
      {@JsonKey(name: 'candidates')
      required final List<GeocodeCandidate> candidates})
      : _candidates = candidates;

  factory _$GeocodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeocodeResponseImplFromJson(json);

  final List<GeocodeCandidate> _candidates;
  @override
  @JsonKey(name: 'candidates')
  List<GeocodeCandidate> get candidates {
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_candidates);
  }

  @override
  String toString() {
    return 'GeocodeResponse(candidates: $candidates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeocodeResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_candidates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeocodeResponseImplCopyWith<_$GeocodeResponseImpl> get copyWith =>
      __$$GeocodeResponseImplCopyWithImpl<_$GeocodeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeocodeResponseImplToJson(
      this,
    );
  }
}

abstract class _GeocodeResponse implements GeocodeResponse {
  const factory _GeocodeResponse(
          {@JsonKey(name: 'candidates')
          required final List<GeocodeCandidate> candidates}) =
      _$GeocodeResponseImpl;

  factory _GeocodeResponse.fromJson(Map<String, dynamic> json) =
      _$GeocodeResponseImpl.fromJson;

  @override
  @JsonKey(name: 'candidates')
  List<GeocodeCandidate> get candidates;
  @override
  @JsonKey(ignore: true)
  _$$GeocodeResponseImplCopyWith<_$GeocodeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeocodeCandidate _$GeocodeCandidateFromJson(Map<String, dynamic> json) {
  return _GeocodeCandidate.fromJson(json);
}

/// @nodoc
mixin _$GeocodeCandidate {
  @JsonKey(name: 'address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  LocationPoint get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'score')
  double get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodeCandidateCopyWith<GeocodeCandidate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodeCandidateCopyWith<$Res> {
  factory $GeocodeCandidateCopyWith(
          GeocodeCandidate value, $Res Function(GeocodeCandidate) then) =
      _$GeocodeCandidateCopyWithImpl<$Res, GeocodeCandidate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'address') String address,
      @JsonKey(name: 'location') LocationPoint location,
      @JsonKey(name: 'score') double score,
      @JsonKey(name: 'attributes') Map<String, dynamic>? attributes});

  $LocationPointCopyWith<$Res> get location;
}

/// @nodoc
class _$GeocodeCandidateCopyWithImpl<$Res, $Val extends GeocodeCandidate>
    implements $GeocodeCandidateCopyWith<$Res> {
  _$GeocodeCandidateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? location = null,
    Object? score = null,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationPoint,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationPointCopyWith<$Res> get location {
    return $LocationPointCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeocodeCandidateImplCopyWith<$Res>
    implements $GeocodeCandidateCopyWith<$Res> {
  factory _$$GeocodeCandidateImplCopyWith(_$GeocodeCandidateImpl value,
          $Res Function(_$GeocodeCandidateImpl) then) =
      __$$GeocodeCandidateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'address') String address,
      @JsonKey(name: 'location') LocationPoint location,
      @JsonKey(name: 'score') double score,
      @JsonKey(name: 'attributes') Map<String, dynamic>? attributes});

  @override
  $LocationPointCopyWith<$Res> get location;
}

/// @nodoc
class __$$GeocodeCandidateImplCopyWithImpl<$Res>
    extends _$GeocodeCandidateCopyWithImpl<$Res, _$GeocodeCandidateImpl>
    implements _$$GeocodeCandidateImplCopyWith<$Res> {
  __$$GeocodeCandidateImplCopyWithImpl(_$GeocodeCandidateImpl _value,
      $Res Function(_$GeocodeCandidateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? location = null,
    Object? score = null,
    Object? attributes = freezed,
  }) {
    return _then(_$GeocodeCandidateImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationPoint,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      attributes: freezed == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeocodeCandidateImpl implements _GeocodeCandidate {
  const _$GeocodeCandidateImpl(
      {@JsonKey(name: 'address') required this.address,
      @JsonKey(name: 'location') required this.location,
      @JsonKey(name: 'score') required this.score,
      @JsonKey(name: 'attributes') final Map<String, dynamic>? attributes})
      : _attributes = attributes;

  factory _$GeocodeCandidateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeocodeCandidateImplFromJson(json);

  @override
  @JsonKey(name: 'address')
  final String address;
  @override
  @JsonKey(name: 'location')
  final LocationPoint location;
  @override
  @JsonKey(name: 'score')
  final double score;
  final Map<String, dynamic>? _attributes;
  @override
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GeocodeCandidate(address: $address, location: $location, score: $score, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeocodeCandidateImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, location, score,
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeocodeCandidateImplCopyWith<_$GeocodeCandidateImpl> get copyWith =>
      __$$GeocodeCandidateImplCopyWithImpl<_$GeocodeCandidateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeocodeCandidateImplToJson(
      this,
    );
  }
}

abstract class _GeocodeCandidate implements GeocodeCandidate {
  const factory _GeocodeCandidate(
      {@JsonKey(name: 'address') required final String address,
      @JsonKey(name: 'location') required final LocationPoint location,
      @JsonKey(name: 'score') required final double score,
      @JsonKey(name: 'attributes')
      final Map<String, dynamic>? attributes}) = _$GeocodeCandidateImpl;

  factory _GeocodeCandidate.fromJson(Map<String, dynamic> json) =
      _$GeocodeCandidateImpl.fromJson;

  @override
  @JsonKey(name: 'address')
  String get address;
  @override
  @JsonKey(name: 'location')
  LocationPoint get location;
  @override
  @JsonKey(name: 'score')
  double get score;
  @override
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$GeocodeCandidateImplCopyWith<_$GeocodeCandidateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationPoint _$LocationPointFromJson(Map<String, dynamic> json) {
  return _LocationPoint.fromJson(json);
}

/// @nodoc
mixin _$LocationPoint {
  @JsonKey(name: 'x')
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'y')
  double get latitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationPointCopyWith<LocationPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPointCopyWith<$Res> {
  factory $LocationPointCopyWith(
          LocationPoint value, $Res Function(LocationPoint) then) =
      _$LocationPointCopyWithImpl<$Res, LocationPoint>;
  @useResult
  $Res call(
      {@JsonKey(name: 'x') double longitude,
      @JsonKey(name: 'y') double latitude});
}

/// @nodoc
class _$LocationPointCopyWithImpl<$Res, $Val extends LocationPoint>
    implements $LocationPointCopyWith<$Res> {
  _$LocationPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = null,
    Object? latitude = null,
  }) {
    return _then(_value.copyWith(
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationPointImplCopyWith<$Res>
    implements $LocationPointCopyWith<$Res> {
  factory _$$LocationPointImplCopyWith(
          _$LocationPointImpl value, $Res Function(_$LocationPointImpl) then) =
      __$$LocationPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'x') double longitude,
      @JsonKey(name: 'y') double latitude});
}

/// @nodoc
class __$$LocationPointImplCopyWithImpl<$Res>
    extends _$LocationPointCopyWithImpl<$Res, _$LocationPointImpl>
    implements _$$LocationPointImplCopyWith<$Res> {
  __$$LocationPointImplCopyWithImpl(
      _$LocationPointImpl _value, $Res Function(_$LocationPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = null,
    Object? latitude = null,
  }) {
    return _then(_$LocationPointImpl(
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationPointImpl implements _LocationPoint {
  const _$LocationPointImpl(
      {@JsonKey(name: 'x') required this.longitude,
      @JsonKey(name: 'y') required this.latitude});

  factory _$LocationPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationPointImplFromJson(json);

  @override
  @JsonKey(name: 'x')
  final double longitude;
  @override
  @JsonKey(name: 'y')
  final double latitude;

  @override
  String toString() {
    return 'LocationPoint(longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPointImpl &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, longitude, latitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPointImplCopyWith<_$LocationPointImpl> get copyWith =>
      __$$LocationPointImplCopyWithImpl<_$LocationPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationPointImplToJson(
      this,
    );
  }
}

abstract class _LocationPoint implements LocationPoint {
  const factory _LocationPoint(
          {@JsonKey(name: 'x') required final double longitude,
          @JsonKey(name: 'y') required final double latitude}) =
      _$LocationPointImpl;

  factory _LocationPoint.fromJson(Map<String, dynamic> json) =
      _$LocationPointImpl.fromJson;

  @override
  @JsonKey(name: 'x')
  double get longitude;
  @override
  @JsonKey(name: 'y')
  double get latitude;
  @override
  @JsonKey(ignore: true)
  _$$LocationPointImplCopyWith<_$LocationPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReverseGeocodeResponse _$ReverseGeocodeResponseFromJson(
    Map<String, dynamic> json) {
  return _ReverseGeocodeResponse.fromJson(json);
}

/// @nodoc
mixin _$ReverseGeocodeResponse {
  @JsonKey(name: 'address')
  AddressInfo get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  LocationPoint get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReverseGeocodeResponseCopyWith<ReverseGeocodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeocodeResponseCopyWith<$Res> {
  factory $ReverseGeocodeResponseCopyWith(ReverseGeocodeResponse value,
          $Res Function(ReverseGeocodeResponse) then) =
      _$ReverseGeocodeResponseCopyWithImpl<$Res, ReverseGeocodeResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'address') AddressInfo address,
      @JsonKey(name: 'location') LocationPoint location});

  $AddressInfoCopyWith<$Res> get address;
  $LocationPointCopyWith<$Res> get location;
}

/// @nodoc
class _$ReverseGeocodeResponseCopyWithImpl<$Res,
        $Val extends ReverseGeocodeResponse>
    implements $ReverseGeocodeResponseCopyWith<$Res> {
  _$ReverseGeocodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationPoint,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressInfoCopyWith<$Res> get address {
    return $AddressInfoCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationPointCopyWith<$Res> get location {
    return $LocationPointCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReverseGeocodeResponseImplCopyWith<$Res>
    implements $ReverseGeocodeResponseCopyWith<$Res> {
  factory _$$ReverseGeocodeResponseImplCopyWith(
          _$ReverseGeocodeResponseImpl value,
          $Res Function(_$ReverseGeocodeResponseImpl) then) =
      __$$ReverseGeocodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'address') AddressInfo address,
      @JsonKey(name: 'location') LocationPoint location});

  @override
  $AddressInfoCopyWith<$Res> get address;
  @override
  $LocationPointCopyWith<$Res> get location;
}

/// @nodoc
class __$$ReverseGeocodeResponseImplCopyWithImpl<$Res>
    extends _$ReverseGeocodeResponseCopyWithImpl<$Res,
        _$ReverseGeocodeResponseImpl>
    implements _$$ReverseGeocodeResponseImplCopyWith<$Res> {
  __$$ReverseGeocodeResponseImplCopyWithImpl(
      _$ReverseGeocodeResponseImpl _value,
      $Res Function(_$ReverseGeocodeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? location = null,
  }) {
    return _then(_$ReverseGeocodeResponseImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationPoint,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReverseGeocodeResponseImpl implements _ReverseGeocodeResponse {
  const _$ReverseGeocodeResponseImpl(
      {@JsonKey(name: 'address') required this.address,
      @JsonKey(name: 'location') required this.location});

  factory _$ReverseGeocodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReverseGeocodeResponseImplFromJson(json);

  @override
  @JsonKey(name: 'address')
  final AddressInfo address;
  @override
  @JsonKey(name: 'location')
  final LocationPoint location;

  @override
  String toString() {
    return 'ReverseGeocodeResponse(address: $address, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseGeocodeResponseImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReverseGeocodeResponseImplCopyWith<_$ReverseGeocodeResponseImpl>
      get copyWith => __$$ReverseGeocodeResponseImplCopyWithImpl<
          _$ReverseGeocodeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReverseGeocodeResponseImplToJson(
      this,
    );
  }
}

abstract class _ReverseGeocodeResponse implements ReverseGeocodeResponse {
  const factory _ReverseGeocodeResponse(
          {@JsonKey(name: 'address') required final AddressInfo address,
          @JsonKey(name: 'location') required final LocationPoint location}) =
      _$ReverseGeocodeResponseImpl;

  factory _ReverseGeocodeResponse.fromJson(Map<String, dynamic> json) =
      _$ReverseGeocodeResponseImpl.fromJson;

  @override
  @JsonKey(name: 'address')
  AddressInfo get address;
  @override
  @JsonKey(name: 'location')
  LocationPoint get location;
  @override
  @JsonKey(ignore: true)
  _$$ReverseGeocodeResponseImplCopyWith<_$ReverseGeocodeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AddressInfo _$AddressInfoFromJson(Map<String, dynamic> json) {
  return _AddressInfo.fromJson(json);
}

/// @nodoc
mixin _$AddressInfo {
  @JsonKey(name: 'Match_addr')
  String? get fullAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'LongLabel')
  String? get longLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShortLabel')
  String? get shortLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'Addr_type')
  String? get addressType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlaceName')
  String? get placeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddNum')
  String? get addressNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String? get streetName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Block')
  String? get block => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sector')
  String? get sector => throw _privateConstructorUsedError;
  @JsonKey(name: 'Neighborhood')
  String? get neighborhood => throw _privateConstructorUsedError;
  @JsonKey(name: 'District')
  String? get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'City')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'MetroArea')
  String? get metroArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'Subregion')
  String? get subregion => throw _privateConstructorUsedError;
  @JsonKey(name: 'Region')
  String? get region => throw _privateConstructorUsedError;
  @JsonKey(name: 'Territory')
  String? get territory => throw _privateConstructorUsedError;
  @JsonKey(name: 'Postal')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'PostalExt')
  String? get postalExtension => throw _privateConstructorUsedError;
  @JsonKey(name: 'CntryName')
  String? get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CountryCode')
  String? get countryCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressInfoCopyWith<AddressInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressInfoCopyWith<$Res> {
  factory $AddressInfoCopyWith(
          AddressInfo value, $Res Function(AddressInfo) then) =
      _$AddressInfoCopyWithImpl<$Res, AddressInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Match_addr') String? fullAddress,
      @JsonKey(name: 'LongLabel') String? longLabel,
      @JsonKey(name: 'ShortLabel') String? shortLabel,
      @JsonKey(name: 'Addr_type') String? addressType,
      @JsonKey(name: 'Type') String? type,
      @JsonKey(name: 'PlaceName') String? placeName,
      @JsonKey(name: 'AddNum') String? addressNumber,
      @JsonKey(name: 'Address') String? streetName,
      @JsonKey(name: 'Block') String? block,
      @JsonKey(name: 'Sector') String? sector,
      @JsonKey(name: 'Neighborhood') String? neighborhood,
      @JsonKey(name: 'District') String? district,
      @JsonKey(name: 'City') String? city,
      @JsonKey(name: 'MetroArea') String? metroArea,
      @JsonKey(name: 'Subregion') String? subregion,
      @JsonKey(name: 'Region') String? region,
      @JsonKey(name: 'Territory') String? territory,
      @JsonKey(name: 'Postal') String? postalCode,
      @JsonKey(name: 'PostalExt') String? postalExtension,
      @JsonKey(name: 'CntryName') String? countryName,
      @JsonKey(name: 'CountryCode') String? countryCode});
}

/// @nodoc
class _$AddressInfoCopyWithImpl<$Res, $Val extends AddressInfo>
    implements $AddressInfoCopyWith<$Res> {
  _$AddressInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullAddress = freezed,
    Object? longLabel = freezed,
    Object? shortLabel = freezed,
    Object? addressType = freezed,
    Object? type = freezed,
    Object? placeName = freezed,
    Object? addressNumber = freezed,
    Object? streetName = freezed,
    Object? block = freezed,
    Object? sector = freezed,
    Object? neighborhood = freezed,
    Object? district = freezed,
    Object? city = freezed,
    Object? metroArea = freezed,
    Object? subregion = freezed,
    Object? region = freezed,
    Object? territory = freezed,
    Object? postalCode = freezed,
    Object? postalExtension = freezed,
    Object? countryName = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      longLabel: freezed == longLabel
          ? _value.longLabel
          : longLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      shortLabel: freezed == shortLabel
          ? _value.shortLabel
          : shortLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      addressType: freezed == addressType
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      placeName: freezed == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      addressNumber: freezed == addressNumber
          ? _value.addressNumber
          : addressNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      streetName: freezed == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String?,
      block: freezed == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as String?,
      sector: freezed == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String?,
      neighborhood: freezed == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      metroArea: freezed == metroArea
          ? _value.metroArea
          : metroArea // ignore: cast_nullable_to_non_nullable
              as String?,
      subregion: freezed == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      territory: freezed == territory
          ? _value.territory
          : territory // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      postalExtension: freezed == postalExtension
          ? _value.postalExtension
          : postalExtension // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressInfoImplCopyWith<$Res>
    implements $AddressInfoCopyWith<$Res> {
  factory _$$AddressInfoImplCopyWith(
          _$AddressInfoImpl value, $Res Function(_$AddressInfoImpl) then) =
      __$$AddressInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Match_addr') String? fullAddress,
      @JsonKey(name: 'LongLabel') String? longLabel,
      @JsonKey(name: 'ShortLabel') String? shortLabel,
      @JsonKey(name: 'Addr_type') String? addressType,
      @JsonKey(name: 'Type') String? type,
      @JsonKey(name: 'PlaceName') String? placeName,
      @JsonKey(name: 'AddNum') String? addressNumber,
      @JsonKey(name: 'Address') String? streetName,
      @JsonKey(name: 'Block') String? block,
      @JsonKey(name: 'Sector') String? sector,
      @JsonKey(name: 'Neighborhood') String? neighborhood,
      @JsonKey(name: 'District') String? district,
      @JsonKey(name: 'City') String? city,
      @JsonKey(name: 'MetroArea') String? metroArea,
      @JsonKey(name: 'Subregion') String? subregion,
      @JsonKey(name: 'Region') String? region,
      @JsonKey(name: 'Territory') String? territory,
      @JsonKey(name: 'Postal') String? postalCode,
      @JsonKey(name: 'PostalExt') String? postalExtension,
      @JsonKey(name: 'CntryName') String? countryName,
      @JsonKey(name: 'CountryCode') String? countryCode});
}

/// @nodoc
class __$$AddressInfoImplCopyWithImpl<$Res>
    extends _$AddressInfoCopyWithImpl<$Res, _$AddressInfoImpl>
    implements _$$AddressInfoImplCopyWith<$Res> {
  __$$AddressInfoImplCopyWithImpl(
      _$AddressInfoImpl _value, $Res Function(_$AddressInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullAddress = freezed,
    Object? longLabel = freezed,
    Object? shortLabel = freezed,
    Object? addressType = freezed,
    Object? type = freezed,
    Object? placeName = freezed,
    Object? addressNumber = freezed,
    Object? streetName = freezed,
    Object? block = freezed,
    Object? sector = freezed,
    Object? neighborhood = freezed,
    Object? district = freezed,
    Object? city = freezed,
    Object? metroArea = freezed,
    Object? subregion = freezed,
    Object? region = freezed,
    Object? territory = freezed,
    Object? postalCode = freezed,
    Object? postalExtension = freezed,
    Object? countryName = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_$AddressInfoImpl(
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      longLabel: freezed == longLabel
          ? _value.longLabel
          : longLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      shortLabel: freezed == shortLabel
          ? _value.shortLabel
          : shortLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      addressType: freezed == addressType
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      placeName: freezed == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      addressNumber: freezed == addressNumber
          ? _value.addressNumber
          : addressNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      streetName: freezed == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String?,
      block: freezed == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as String?,
      sector: freezed == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String?,
      neighborhood: freezed == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      metroArea: freezed == metroArea
          ? _value.metroArea
          : metroArea // ignore: cast_nullable_to_non_nullable
              as String?,
      subregion: freezed == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      territory: freezed == territory
          ? _value.territory
          : territory // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      postalExtension: freezed == postalExtension
          ? _value.postalExtension
          : postalExtension // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressInfoImpl implements _AddressInfo {
  const _$AddressInfoImpl(
      {@JsonKey(name: 'Match_addr') this.fullAddress,
      @JsonKey(name: 'LongLabel') this.longLabel,
      @JsonKey(name: 'ShortLabel') this.shortLabel,
      @JsonKey(name: 'Addr_type') this.addressType,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'PlaceName') this.placeName,
      @JsonKey(name: 'AddNum') this.addressNumber,
      @JsonKey(name: 'Address') this.streetName,
      @JsonKey(name: 'Block') this.block,
      @JsonKey(name: 'Sector') this.sector,
      @JsonKey(name: 'Neighborhood') this.neighborhood,
      @JsonKey(name: 'District') this.district,
      @JsonKey(name: 'City') this.city,
      @JsonKey(name: 'MetroArea') this.metroArea,
      @JsonKey(name: 'Subregion') this.subregion,
      @JsonKey(name: 'Region') this.region,
      @JsonKey(name: 'Territory') this.territory,
      @JsonKey(name: 'Postal') this.postalCode,
      @JsonKey(name: 'PostalExt') this.postalExtension,
      @JsonKey(name: 'CntryName') this.countryName,
      @JsonKey(name: 'CountryCode') this.countryCode});

  factory _$AddressInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressInfoImplFromJson(json);

  @override
  @JsonKey(name: 'Match_addr')
  final String? fullAddress;
  @override
  @JsonKey(name: 'LongLabel')
  final String? longLabel;
  @override
  @JsonKey(name: 'ShortLabel')
  final String? shortLabel;
  @override
  @JsonKey(name: 'Addr_type')
  final String? addressType;
  @override
  @JsonKey(name: 'Type')
  final String? type;
  @override
  @JsonKey(name: 'PlaceName')
  final String? placeName;
  @override
  @JsonKey(name: 'AddNum')
  final String? addressNumber;
  @override
  @JsonKey(name: 'Address')
  final String? streetName;
  @override
  @JsonKey(name: 'Block')
  final String? block;
  @override
  @JsonKey(name: 'Sector')
  final String? sector;
  @override
  @JsonKey(name: 'Neighborhood')
  final String? neighborhood;
  @override
  @JsonKey(name: 'District')
  final String? district;
  @override
  @JsonKey(name: 'City')
  final String? city;
  @override
  @JsonKey(name: 'MetroArea')
  final String? metroArea;
  @override
  @JsonKey(name: 'Subregion')
  final String? subregion;
  @override
  @JsonKey(name: 'Region')
  final String? region;
  @override
  @JsonKey(name: 'Territory')
  final String? territory;
  @override
  @JsonKey(name: 'Postal')
  final String? postalCode;
  @override
  @JsonKey(name: 'PostalExt')
  final String? postalExtension;
  @override
  @JsonKey(name: 'CntryName')
  final String? countryName;
  @override
  @JsonKey(name: 'CountryCode')
  final String? countryCode;

  @override
  String toString() {
    return 'AddressInfo(fullAddress: $fullAddress, longLabel: $longLabel, shortLabel: $shortLabel, addressType: $addressType, type: $type, placeName: $placeName, addressNumber: $addressNumber, streetName: $streetName, block: $block, sector: $sector, neighborhood: $neighborhood, district: $district, city: $city, metroArea: $metroArea, subregion: $subregion, region: $region, territory: $territory, postalCode: $postalCode, postalExtension: $postalExtension, countryName: $countryName, countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressInfoImpl &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.longLabel, longLabel) ||
                other.longLabel == longLabel) &&
            (identical(other.shortLabel, shortLabel) ||
                other.shortLabel == shortLabel) &&
            (identical(other.addressType, addressType) ||
                other.addressType == addressType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.addressNumber, addressNumber) ||
                other.addressNumber == addressNumber) &&
            (identical(other.streetName, streetName) ||
                other.streetName == streetName) &&
            (identical(other.block, block) || other.block == block) &&
            (identical(other.sector, sector) || other.sector == sector) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.metroArea, metroArea) ||
                other.metroArea == metroArea) &&
            (identical(other.subregion, subregion) ||
                other.subregion == subregion) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.territory, territory) ||
                other.territory == territory) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.postalExtension, postalExtension) ||
                other.postalExtension == postalExtension) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        fullAddress,
        longLabel,
        shortLabel,
        addressType,
        type,
        placeName,
        addressNumber,
        streetName,
        block,
        sector,
        neighborhood,
        district,
        city,
        metroArea,
        subregion,
        region,
        territory,
        postalCode,
        postalExtension,
        countryName,
        countryCode
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressInfoImplCopyWith<_$AddressInfoImpl> get copyWith =>
      __$$AddressInfoImplCopyWithImpl<_$AddressInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressInfoImplToJson(
      this,
    );
  }
}

abstract class _AddressInfo implements AddressInfo {
  const factory _AddressInfo(
          {@JsonKey(name: 'Match_addr') final String? fullAddress,
          @JsonKey(name: 'LongLabel') final String? longLabel,
          @JsonKey(name: 'ShortLabel') final String? shortLabel,
          @JsonKey(name: 'Addr_type') final String? addressType,
          @JsonKey(name: 'Type') final String? type,
          @JsonKey(name: 'PlaceName') final String? placeName,
          @JsonKey(name: 'AddNum') final String? addressNumber,
          @JsonKey(name: 'Address') final String? streetName,
          @JsonKey(name: 'Block') final String? block,
          @JsonKey(name: 'Sector') final String? sector,
          @JsonKey(name: 'Neighborhood') final String? neighborhood,
          @JsonKey(name: 'District') final String? district,
          @JsonKey(name: 'City') final String? city,
          @JsonKey(name: 'MetroArea') final String? metroArea,
          @JsonKey(name: 'Subregion') final String? subregion,
          @JsonKey(name: 'Region') final String? region,
          @JsonKey(name: 'Territory') final String? territory,
          @JsonKey(name: 'Postal') final String? postalCode,
          @JsonKey(name: 'PostalExt') final String? postalExtension,
          @JsonKey(name: 'CntryName') final String? countryName,
          @JsonKey(name: 'CountryCode') final String? countryCode}) =
      _$AddressInfoImpl;

  factory _AddressInfo.fromJson(Map<String, dynamic> json) =
      _$AddressInfoImpl.fromJson;

  @override
  @JsonKey(name: 'Match_addr')
  String? get fullAddress;
  @override
  @JsonKey(name: 'LongLabel')
  String? get longLabel;
  @override
  @JsonKey(name: 'ShortLabel')
  String? get shortLabel;
  @override
  @JsonKey(name: 'Addr_type')
  String? get addressType;
  @override
  @JsonKey(name: 'Type')
  String? get type;
  @override
  @JsonKey(name: 'PlaceName')
  String? get placeName;
  @override
  @JsonKey(name: 'AddNum')
  String? get addressNumber;
  @override
  @JsonKey(name: 'Address')
  String? get streetName;
  @override
  @JsonKey(name: 'Block')
  String? get block;
  @override
  @JsonKey(name: 'Sector')
  String? get sector;
  @override
  @JsonKey(name: 'Neighborhood')
  String? get neighborhood;
  @override
  @JsonKey(name: 'District')
  String? get district;
  @override
  @JsonKey(name: 'City')
  String? get city;
  @override
  @JsonKey(name: 'MetroArea')
  String? get metroArea;
  @override
  @JsonKey(name: 'Subregion')
  String? get subregion;
  @override
  @JsonKey(name: 'Region')
  String? get region;
  @override
  @JsonKey(name: 'Territory')
  String? get territory;
  @override
  @JsonKey(name: 'Postal')
  String? get postalCode;
  @override
  @JsonKey(name: 'PostalExt')
  String? get postalExtension;
  @override
  @JsonKey(name: 'CntryName')
  String? get countryName;
  @override
  @JsonKey(name: 'CountryCode')
  String? get countryCode;
  @override
  @JsonKey(ignore: true)
  _$$AddressInfoImplCopyWith<_$AddressInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteResponse _$RouteResponseFromJson(Map<String, dynamic> json) {
  return _RouteResponse.fromJson(json);
}

/// @nodoc
mixin _$RouteResponse {
  @JsonKey(name: 'routes')
  RouteFeaturesResult get routes => throw _privateConstructorUsedError;
  @JsonKey(name: 'directions')
  List<RouteDirectionSet> get directions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteResponseCopyWith<RouteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteResponseCopyWith<$Res> {
  factory $RouteResponseCopyWith(
          RouteResponse value, $Res Function(RouteResponse) then) =
      _$RouteResponseCopyWithImpl<$Res, RouteResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'routes') RouteFeaturesResult routes,
      @JsonKey(name: 'directions') List<RouteDirectionSet> directions});

  $RouteFeaturesResultCopyWith<$Res> get routes;
}

/// @nodoc
class _$RouteResponseCopyWithImpl<$Res, $Val extends RouteResponse>
    implements $RouteResponseCopyWith<$Res> {
  _$RouteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? directions = null,
  }) {
    return _then(_value.copyWith(
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as RouteFeaturesResult,
      directions: null == directions
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionSet>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteFeaturesResultCopyWith<$Res> get routes {
    return $RouteFeaturesResultCopyWith<$Res>(_value.routes, (value) {
      return _then(_value.copyWith(routes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteResponseImplCopyWith<$Res>
    implements $RouteResponseCopyWith<$Res> {
  factory _$$RouteResponseImplCopyWith(
          _$RouteResponseImpl value, $Res Function(_$RouteResponseImpl) then) =
      __$$RouteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'routes') RouteFeaturesResult routes,
      @JsonKey(name: 'directions') List<RouteDirectionSet> directions});

  @override
  $RouteFeaturesResultCopyWith<$Res> get routes;
}

/// @nodoc
class __$$RouteResponseImplCopyWithImpl<$Res>
    extends _$RouteResponseCopyWithImpl<$Res, _$RouteResponseImpl>
    implements _$$RouteResponseImplCopyWith<$Res> {
  __$$RouteResponseImplCopyWithImpl(
      _$RouteResponseImpl _value, $Res Function(_$RouteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? directions = null,
  }) {
    return _then(_$RouteResponseImpl(
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as RouteFeaturesResult,
      directions: null == directions
          ? _value._directions
          : directions // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionSet>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteResponseImpl implements _RouteResponse {
  const _$RouteResponseImpl(
      {@JsonKey(name: 'routes') required this.routes,
      @JsonKey(name: 'directions')
      final List<RouteDirectionSet> directions = const []})
      : _directions = directions;

  factory _$RouteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteResponseImplFromJson(json);

  @override
  @JsonKey(name: 'routes')
  final RouteFeaturesResult routes;
  final List<RouteDirectionSet> _directions;
  @override
  @JsonKey(name: 'directions')
  List<RouteDirectionSet> get directions {
    if (_directions is EqualUnmodifiableListView) return _directions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_directions);
  }

  @override
  String toString() {
    return 'RouteResponse(routes: $routes, directions: $directions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteResponseImpl &&
            (identical(other.routes, routes) || other.routes == routes) &&
            const DeepCollectionEquality()
                .equals(other._directions, _directions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, routes, const DeepCollectionEquality().hash(_directions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteResponseImplCopyWith<_$RouteResponseImpl> get copyWith =>
      __$$RouteResponseImplCopyWithImpl<_$RouteResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteResponseImplToJson(
      this,
    );
  }
}

abstract class _RouteResponse implements RouteResponse {
  const factory _RouteResponse(
      {@JsonKey(name: 'routes') required final RouteFeaturesResult routes,
      @JsonKey(name: 'directions')
      final List<RouteDirectionSet> directions}) = _$RouteResponseImpl;

  factory _RouteResponse.fromJson(Map<String, dynamic> json) =
      _$RouteResponseImpl.fromJson;

  @override
  @JsonKey(name: 'routes')
  RouteFeaturesResult get routes;
  @override
  @JsonKey(name: 'directions')
  List<RouteDirectionSet> get directions;
  @override
  @JsonKey(ignore: true)
  _$$RouteResponseImplCopyWith<_$RouteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteDirectionSet _$RouteDirectionSetFromJson(Map<String, dynamic> json) {
  return _RouteDirectionSet.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionSet {
  @JsonKey(name: 'routeId')
  int? get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'routeName')
  String? get routeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary')
  RouteDirectionSummary? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'features')
  List<RouteDirectionFeature> get features =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionSetCopyWith<RouteDirectionSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionSetCopyWith<$Res> {
  factory $RouteDirectionSetCopyWith(
          RouteDirectionSet value, $Res Function(RouteDirectionSet) then) =
      _$RouteDirectionSetCopyWithImpl<$Res, RouteDirectionSet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'routeId') int? routeId,
      @JsonKey(name: 'routeName') String? routeName,
      @JsonKey(name: 'summary') RouteDirectionSummary? summary,
      @JsonKey(name: 'features') List<RouteDirectionFeature> features});

  $RouteDirectionSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$RouteDirectionSetCopyWithImpl<$Res, $Val extends RouteDirectionSet>
    implements $RouteDirectionSetCopyWith<$Res> {
  _$RouteDirectionSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = freezed,
    Object? routeName = freezed,
    Object? summary = freezed,
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      routeId: freezed == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int?,
      routeName: freezed == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as RouteDirectionSummary?,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionFeature>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteDirectionSummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $RouteDirectionSummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteDirectionSetImplCopyWith<$Res>
    implements $RouteDirectionSetCopyWith<$Res> {
  factory _$$RouteDirectionSetImplCopyWith(_$RouteDirectionSetImpl value,
          $Res Function(_$RouteDirectionSetImpl) then) =
      __$$RouteDirectionSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'routeId') int? routeId,
      @JsonKey(name: 'routeName') String? routeName,
      @JsonKey(name: 'summary') RouteDirectionSummary? summary,
      @JsonKey(name: 'features') List<RouteDirectionFeature> features});

  @override
  $RouteDirectionSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$RouteDirectionSetImplCopyWithImpl<$Res>
    extends _$RouteDirectionSetCopyWithImpl<$Res, _$RouteDirectionSetImpl>
    implements _$$RouteDirectionSetImplCopyWith<$Res> {
  __$$RouteDirectionSetImplCopyWithImpl(_$RouteDirectionSetImpl _value,
      $Res Function(_$RouteDirectionSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = freezed,
    Object? routeName = freezed,
    Object? summary = freezed,
    Object? features = null,
  }) {
    return _then(_$RouteDirectionSetImpl(
      routeId: freezed == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int?,
      routeName: freezed == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as RouteDirectionSummary?,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionFeature>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionSetImpl implements _RouteDirectionSet {
  const _$RouteDirectionSetImpl(
      {@JsonKey(name: 'routeId') this.routeId,
      @JsonKey(name: 'routeName') this.routeName,
      @JsonKey(name: 'summary') this.summary,
      @JsonKey(name: 'features')
      final List<RouteDirectionFeature> features = const []})
      : _features = features;

  factory _$RouteDirectionSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionSetImplFromJson(json);

  @override
  @JsonKey(name: 'routeId')
  final int? routeId;
  @override
  @JsonKey(name: 'routeName')
  final String? routeName;
  @override
  @JsonKey(name: 'summary')
  final RouteDirectionSummary? summary;
  final List<RouteDirectionFeature> _features;
  @override
  @JsonKey(name: 'features')
  List<RouteDirectionFeature> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'RouteDirectionSet(routeId: $routeId, routeName: $routeName, summary: $summary, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionSetImpl &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, routeId, routeName, summary,
      const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionSetImplCopyWith<_$RouteDirectionSetImpl> get copyWith =>
      __$$RouteDirectionSetImplCopyWithImpl<_$RouteDirectionSetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionSetImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionSet implements RouteDirectionSet {
  const factory _RouteDirectionSet(
      {@JsonKey(name: 'routeId') final int? routeId,
      @JsonKey(name: 'routeName') final String? routeName,
      @JsonKey(name: 'summary') final RouteDirectionSummary? summary,
      @JsonKey(name: 'features')
      final List<RouteDirectionFeature> features}) = _$RouteDirectionSetImpl;

  factory _RouteDirectionSet.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionSetImpl.fromJson;

  @override
  @JsonKey(name: 'routeId')
  int? get routeId;
  @override
  @JsonKey(name: 'routeName')
  String? get routeName;
  @override
  @JsonKey(name: 'summary')
  RouteDirectionSummary? get summary;
  @override
  @JsonKey(name: 'features')
  List<RouteDirectionFeature> get features;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionSetImplCopyWith<_$RouteDirectionSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteDirectionSummary _$RouteDirectionSummaryFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionSummary.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionSummary {
  @JsonKey(name: 'totalLength')
  double? get totalLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTime')
  double? get totalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalDriveTime')
  double? get totalDriveTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionSummaryCopyWith<RouteDirectionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionSummaryCopyWith<$Res> {
  factory $RouteDirectionSummaryCopyWith(RouteDirectionSummary value,
          $Res Function(RouteDirectionSummary) then) =
      _$RouteDirectionSummaryCopyWithImpl<$Res, RouteDirectionSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalLength') double? totalLength,
      @JsonKey(name: 'totalTime') double? totalTime,
      @JsonKey(name: 'totalDriveTime') double? totalDriveTime});
}

/// @nodoc
class _$RouteDirectionSummaryCopyWithImpl<$Res,
        $Val extends RouteDirectionSummary>
    implements $RouteDirectionSummaryCopyWith<$Res> {
  _$RouteDirectionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalLength = freezed,
    Object? totalTime = freezed,
    Object? totalDriveTime = freezed,
  }) {
    return _then(_value.copyWith(
      totalLength: freezed == totalLength
          ? _value.totalLength
          : totalLength // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDriveTime: freezed == totalDriveTime
          ? _value.totalDriveTime
          : totalDriveTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteDirectionSummaryImplCopyWith<$Res>
    implements $RouteDirectionSummaryCopyWith<$Res> {
  factory _$$RouteDirectionSummaryImplCopyWith(
          _$RouteDirectionSummaryImpl value,
          $Res Function(_$RouteDirectionSummaryImpl) then) =
      __$$RouteDirectionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalLength') double? totalLength,
      @JsonKey(name: 'totalTime') double? totalTime,
      @JsonKey(name: 'totalDriveTime') double? totalDriveTime});
}

/// @nodoc
class __$$RouteDirectionSummaryImplCopyWithImpl<$Res>
    extends _$RouteDirectionSummaryCopyWithImpl<$Res,
        _$RouteDirectionSummaryImpl>
    implements _$$RouteDirectionSummaryImplCopyWith<$Res> {
  __$$RouteDirectionSummaryImplCopyWithImpl(_$RouteDirectionSummaryImpl _value,
      $Res Function(_$RouteDirectionSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalLength = freezed,
    Object? totalTime = freezed,
    Object? totalDriveTime = freezed,
  }) {
    return _then(_$RouteDirectionSummaryImpl(
      totalLength: freezed == totalLength
          ? _value.totalLength
          : totalLength // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDriveTime: freezed == totalDriveTime
          ? _value.totalDriveTime
          : totalDriveTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionSummaryImpl implements _RouteDirectionSummary {
  const _$RouteDirectionSummaryImpl(
      {@JsonKey(name: 'totalLength') this.totalLength,
      @JsonKey(name: 'totalTime') this.totalTime,
      @JsonKey(name: 'totalDriveTime') this.totalDriveTime});

  factory _$RouteDirectionSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'totalLength')
  final double? totalLength;
  @override
  @JsonKey(name: 'totalTime')
  final double? totalTime;
  @override
  @JsonKey(name: 'totalDriveTime')
  final double? totalDriveTime;

  @override
  String toString() {
    return 'RouteDirectionSummary(totalLength: $totalLength, totalTime: $totalTime, totalDriveTime: $totalDriveTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionSummaryImpl &&
            (identical(other.totalLength, totalLength) ||
                other.totalLength == totalLength) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.totalDriveTime, totalDriveTime) ||
                other.totalDriveTime == totalDriveTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalLength, totalTime, totalDriveTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionSummaryImplCopyWith<_$RouteDirectionSummaryImpl>
      get copyWith => __$$RouteDirectionSummaryImplCopyWithImpl<
          _$RouteDirectionSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionSummaryImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionSummary implements RouteDirectionSummary {
  const factory _RouteDirectionSummary(
          {@JsonKey(name: 'totalLength') final double? totalLength,
          @JsonKey(name: 'totalTime') final double? totalTime,
          @JsonKey(name: 'totalDriveTime') final double? totalDriveTime}) =
      _$RouteDirectionSummaryImpl;

  factory _RouteDirectionSummary.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'totalLength')
  double? get totalLength;
  @override
  @JsonKey(name: 'totalTime')
  double? get totalTime;
  @override
  @JsonKey(name: 'totalDriveTime')
  double? get totalDriveTime;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionSummaryImplCopyWith<_$RouteDirectionSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteDirectionFeature _$RouteDirectionFeatureFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionFeature.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionFeature {
  @JsonKey(name: 'attributes')
  RouteDirectionAttributes get attributes => throw _privateConstructorUsedError;
  @JsonKey(name: 'strings')
  List<RouteDirectionString> get strings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionFeatureCopyWith<RouteDirectionFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionFeatureCopyWith<$Res> {
  factory $RouteDirectionFeatureCopyWith(RouteDirectionFeature value,
          $Res Function(RouteDirectionFeature) then) =
      _$RouteDirectionFeatureCopyWithImpl<$Res, RouteDirectionFeature>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteDirectionAttributes attributes,
      @JsonKey(name: 'strings') List<RouteDirectionString> strings});

  $RouteDirectionAttributesCopyWith<$Res> get attributes;
}

/// @nodoc
class _$RouteDirectionFeatureCopyWithImpl<$Res,
        $Val extends RouteDirectionFeature>
    implements $RouteDirectionFeatureCopyWith<$Res> {
  _$RouteDirectionFeatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? strings = null,
  }) {
    return _then(_value.copyWith(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteDirectionAttributes,
      strings: null == strings
          ? _value.strings
          : strings // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionString>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteDirectionAttributesCopyWith<$Res> get attributes {
    return $RouteDirectionAttributesCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteDirectionFeatureImplCopyWith<$Res>
    implements $RouteDirectionFeatureCopyWith<$Res> {
  factory _$$RouteDirectionFeatureImplCopyWith(
          _$RouteDirectionFeatureImpl value,
          $Res Function(_$RouteDirectionFeatureImpl) then) =
      __$$RouteDirectionFeatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteDirectionAttributes attributes,
      @JsonKey(name: 'strings') List<RouteDirectionString> strings});

  @override
  $RouteDirectionAttributesCopyWith<$Res> get attributes;
}

/// @nodoc
class __$$RouteDirectionFeatureImplCopyWithImpl<$Res>
    extends _$RouteDirectionFeatureCopyWithImpl<$Res,
        _$RouteDirectionFeatureImpl>
    implements _$$RouteDirectionFeatureImplCopyWith<$Res> {
  __$$RouteDirectionFeatureImplCopyWithImpl(_$RouteDirectionFeatureImpl _value,
      $Res Function(_$RouteDirectionFeatureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? strings = null,
  }) {
    return _then(_$RouteDirectionFeatureImpl(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteDirectionAttributes,
      strings: null == strings
          ? _value._strings
          : strings // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionString>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionFeatureImpl implements _RouteDirectionFeature {
  const _$RouteDirectionFeatureImpl(
      {@JsonKey(name: 'attributes') required this.attributes,
      @JsonKey(name: 'strings')
      final List<RouteDirectionString> strings = const []})
      : _strings = strings;

  factory _$RouteDirectionFeatureImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionFeatureImplFromJson(json);

  @override
  @JsonKey(name: 'attributes')
  final RouteDirectionAttributes attributes;
  final List<RouteDirectionString> _strings;
  @override
  @JsonKey(name: 'strings')
  List<RouteDirectionString> get strings {
    if (_strings is EqualUnmodifiableListView) return _strings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strings);
  }

  @override
  String toString() {
    return 'RouteDirectionFeature(attributes: $attributes, strings: $strings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionFeatureImpl &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes) &&
            const DeepCollectionEquality().equals(other._strings, _strings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, attributes, const DeepCollectionEquality().hash(_strings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionFeatureImplCopyWith<_$RouteDirectionFeatureImpl>
      get copyWith => __$$RouteDirectionFeatureImplCopyWithImpl<
          _$RouteDirectionFeatureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionFeatureImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionFeature implements RouteDirectionFeature {
  const factory _RouteDirectionFeature(
          {@JsonKey(name: 'attributes')
          required final RouteDirectionAttributes attributes,
          @JsonKey(name: 'strings') final List<RouteDirectionString> strings}) =
      _$RouteDirectionFeatureImpl;

  factory _RouteDirectionFeature.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionFeatureImpl.fromJson;

  @override
  @JsonKey(name: 'attributes')
  RouteDirectionAttributes get attributes;
  @override
  @JsonKey(name: 'strings')
  List<RouteDirectionString> get strings;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionFeatureImplCopyWith<_$RouteDirectionFeatureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteDirectionAttributes _$RouteDirectionAttributesFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionAttributes.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionAttributes {
  @JsonKey(name: 'length')
  double get length => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  double get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'maneuverType')
  String? get maneuverType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionAttributesCopyWith<RouteDirectionAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionAttributesCopyWith<$Res> {
  factory $RouteDirectionAttributesCopyWith(RouteDirectionAttributes value,
          $Res Function(RouteDirectionAttributes) then) =
      _$RouteDirectionAttributesCopyWithImpl<$Res, RouteDirectionAttributes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'length') double length,
      @JsonKey(name: 'time') double time,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'maneuverType') String? maneuverType});
}

/// @nodoc
class _$RouteDirectionAttributesCopyWithImpl<$Res,
        $Val extends RouteDirectionAttributes>
    implements $RouteDirectionAttributesCopyWith<$Res> {
  _$RouteDirectionAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? time = null,
    Object? text = freezed,
    Object? maneuverType = freezed,
  }) {
    return _then(_value.copyWith(
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      maneuverType: freezed == maneuverType
          ? _value.maneuverType
          : maneuverType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteDirectionAttributesImplCopyWith<$Res>
    implements $RouteDirectionAttributesCopyWith<$Res> {
  factory _$$RouteDirectionAttributesImplCopyWith(
          _$RouteDirectionAttributesImpl value,
          $Res Function(_$RouteDirectionAttributesImpl) then) =
      __$$RouteDirectionAttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'length') double length,
      @JsonKey(name: 'time') double time,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'maneuverType') String? maneuverType});
}

/// @nodoc
class __$$RouteDirectionAttributesImplCopyWithImpl<$Res>
    extends _$RouteDirectionAttributesCopyWithImpl<$Res,
        _$RouteDirectionAttributesImpl>
    implements _$$RouteDirectionAttributesImplCopyWith<$Res> {
  __$$RouteDirectionAttributesImplCopyWithImpl(
      _$RouteDirectionAttributesImpl _value,
      $Res Function(_$RouteDirectionAttributesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? time = null,
    Object? text = freezed,
    Object? maneuverType = freezed,
  }) {
    return _then(_$RouteDirectionAttributesImpl(
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      maneuverType: freezed == maneuverType
          ? _value.maneuverType
          : maneuverType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionAttributesImpl implements _RouteDirectionAttributes {
  const _$RouteDirectionAttributesImpl(
      {@JsonKey(name: 'length') this.length = 0,
      @JsonKey(name: 'time') this.time = 0,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'maneuverType') this.maneuverType});

  factory _$RouteDirectionAttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionAttributesImplFromJson(json);

  @override
  @JsonKey(name: 'length')
  final double length;
  @override
  @JsonKey(name: 'time')
  final double time;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'maneuverType')
  final String? maneuverType;

  @override
  String toString() {
    return 'RouteDirectionAttributes(length: $length, time: $time, text: $text, maneuverType: $maneuverType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionAttributesImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.maneuverType, maneuverType) ||
                other.maneuverType == maneuverType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, length, time, text, maneuverType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionAttributesImplCopyWith<_$RouteDirectionAttributesImpl>
      get copyWith => __$$RouteDirectionAttributesImplCopyWithImpl<
          _$RouteDirectionAttributesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionAttributesImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionAttributes implements RouteDirectionAttributes {
  const factory _RouteDirectionAttributes(
          {@JsonKey(name: 'length') final double length,
          @JsonKey(name: 'time') final double time,
          @JsonKey(name: 'text') final String? text,
          @JsonKey(name: 'maneuverType') final String? maneuverType}) =
      _$RouteDirectionAttributesImpl;

  factory _RouteDirectionAttributes.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionAttributesImpl.fromJson;

  @override
  @JsonKey(name: 'length')
  double get length;
  @override
  @JsonKey(name: 'time')
  double get time;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'maneuverType')
  String? get maneuverType;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionAttributesImplCopyWith<_$RouteDirectionAttributesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteDirectionString _$RouteDirectionStringFromJson(Map<String, dynamic> json) {
  return _RouteDirectionString.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionString {
  @JsonKey(name: 'string')
  String? get string => throw _privateConstructorUsedError;
  @JsonKey(name: 'stringType')
  String? get stringType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionStringCopyWith<RouteDirectionString> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionStringCopyWith<$Res> {
  factory $RouteDirectionStringCopyWith(RouteDirectionString value,
          $Res Function(RouteDirectionString) then) =
      _$RouteDirectionStringCopyWithImpl<$Res, RouteDirectionString>;
  @useResult
  $Res call(
      {@JsonKey(name: 'string') String? string,
      @JsonKey(name: 'stringType') String? stringType});
}

/// @nodoc
class _$RouteDirectionStringCopyWithImpl<$Res,
        $Val extends RouteDirectionString>
    implements $RouteDirectionStringCopyWith<$Res> {
  _$RouteDirectionStringCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? string = freezed,
    Object? stringType = freezed,
  }) {
    return _then(_value.copyWith(
      string: freezed == string
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String?,
      stringType: freezed == stringType
          ? _value.stringType
          : stringType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteDirectionStringImplCopyWith<$Res>
    implements $RouteDirectionStringCopyWith<$Res> {
  factory _$$RouteDirectionStringImplCopyWith(_$RouteDirectionStringImpl value,
          $Res Function(_$RouteDirectionStringImpl) then) =
      __$$RouteDirectionStringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'string') String? string,
      @JsonKey(name: 'stringType') String? stringType});
}

/// @nodoc
class __$$RouteDirectionStringImplCopyWithImpl<$Res>
    extends _$RouteDirectionStringCopyWithImpl<$Res, _$RouteDirectionStringImpl>
    implements _$$RouteDirectionStringImplCopyWith<$Res> {
  __$$RouteDirectionStringImplCopyWithImpl(_$RouteDirectionStringImpl _value,
      $Res Function(_$RouteDirectionStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? string = freezed,
    Object? stringType = freezed,
  }) {
    return _then(_$RouteDirectionStringImpl(
      string: freezed == string
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String?,
      stringType: freezed == stringType
          ? _value.stringType
          : stringType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionStringImpl implements _RouteDirectionString {
  const _$RouteDirectionStringImpl(
      {@JsonKey(name: 'string') this.string,
      @JsonKey(name: 'stringType') this.stringType});

  factory _$RouteDirectionStringImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionStringImplFromJson(json);

  @override
  @JsonKey(name: 'string')
  final String? string;
  @override
  @JsonKey(name: 'stringType')
  final String? stringType;

  @override
  String toString() {
    return 'RouteDirectionString(string: $string, stringType: $stringType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionStringImpl &&
            (identical(other.string, string) || other.string == string) &&
            (identical(other.stringType, stringType) ||
                other.stringType == stringType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, string, stringType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionStringImplCopyWith<_$RouteDirectionStringImpl>
      get copyWith =>
          __$$RouteDirectionStringImplCopyWithImpl<_$RouteDirectionStringImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionStringImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionString implements RouteDirectionString {
  const factory _RouteDirectionString(
          {@JsonKey(name: 'string') final String? string,
          @JsonKey(name: 'stringType') final String? stringType}) =
      _$RouteDirectionStringImpl;

  factory _RouteDirectionString.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionStringImpl.fromJson;

  @override
  @JsonKey(name: 'string')
  String? get string;
  @override
  @JsonKey(name: 'stringType')
  String? get stringType;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionStringImplCopyWith<_$RouteDirectionStringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteFeaturesResult _$RouteFeaturesResultFromJson(Map<String, dynamic> json) {
  return _RouteFeaturesResult.fromJson(json);
}

/// @nodoc
mixin _$RouteFeaturesResult {
  @JsonKey(name: 'features')
  List<RouteFeature> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteFeaturesResultCopyWith<RouteFeaturesResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteFeaturesResultCopyWith<$Res> {
  factory $RouteFeaturesResultCopyWith(
          RouteFeaturesResult value, $Res Function(RouteFeaturesResult) then) =
      _$RouteFeaturesResultCopyWithImpl<$Res, RouteFeaturesResult>;
  @useResult
  $Res call({@JsonKey(name: 'features') List<RouteFeature> features});
}

/// @nodoc
class _$RouteFeaturesResultCopyWithImpl<$Res, $Val extends RouteFeaturesResult>
    implements $RouteFeaturesResultCopyWith<$Res> {
  _$RouteFeaturesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteFeature>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteFeaturesResultImplCopyWith<$Res>
    implements $RouteFeaturesResultCopyWith<$Res> {
  factory _$$RouteFeaturesResultImplCopyWith(_$RouteFeaturesResultImpl value,
          $Res Function(_$RouteFeaturesResultImpl) then) =
      __$$RouteFeaturesResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'features') List<RouteFeature> features});
}

/// @nodoc
class __$$RouteFeaturesResultImplCopyWithImpl<$Res>
    extends _$RouteFeaturesResultCopyWithImpl<$Res, _$RouteFeaturesResultImpl>
    implements _$$RouteFeaturesResultImplCopyWith<$Res> {
  __$$RouteFeaturesResultImplCopyWithImpl(_$RouteFeaturesResultImpl _value,
      $Res Function(_$RouteFeaturesResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_$RouteFeaturesResultImpl(
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteFeature>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteFeaturesResultImpl implements _RouteFeaturesResult {
  const _$RouteFeaturesResultImpl(
      {@JsonKey(name: 'features') required final List<RouteFeature> features})
      : _features = features;

  factory _$RouteFeaturesResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteFeaturesResultImplFromJson(json);

  final List<RouteFeature> _features;
  @override
  @JsonKey(name: 'features')
  List<RouteFeature> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'RouteFeaturesResult(features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteFeaturesResultImpl &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteFeaturesResultImplCopyWith<_$RouteFeaturesResultImpl> get copyWith =>
      __$$RouteFeaturesResultImplCopyWithImpl<_$RouteFeaturesResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteFeaturesResultImplToJson(
      this,
    );
  }
}

abstract class _RouteFeaturesResult implements RouteFeaturesResult {
  const factory _RouteFeaturesResult(
      {@JsonKey(name: 'features')
      required final List<RouteFeature> features}) = _$RouteFeaturesResultImpl;

  factory _RouteFeaturesResult.fromJson(Map<String, dynamic> json) =
      _$RouteFeaturesResultImpl.fromJson;

  @override
  @JsonKey(name: 'features')
  List<RouteFeature> get features;
  @override
  @JsonKey(ignore: true)
  _$$RouteFeaturesResultImplCopyWith<_$RouteFeaturesResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteFeature _$RouteFeatureFromJson(Map<String, dynamic> json) {
  return _RouteFeature.fromJson(json);
}

/// @nodoc
mixin _$RouteFeature {
  @JsonKey(name: 'attributes')
  RouteAttributes get attributes => throw _privateConstructorUsedError;
  @JsonKey(name: 'geometry')
  RouteGeometry get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteFeatureCopyWith<RouteFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteFeatureCopyWith<$Res> {
  factory $RouteFeatureCopyWith(
          RouteFeature value, $Res Function(RouteFeature) then) =
      _$RouteFeatureCopyWithImpl<$Res, RouteFeature>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteAttributes attributes,
      @JsonKey(name: 'geometry') RouteGeometry geometry});

  $RouteAttributesCopyWith<$Res> get attributes;
  $RouteGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class _$RouteFeatureCopyWithImpl<$Res, $Val extends RouteFeature>
    implements $RouteFeatureCopyWith<$Res> {
  _$RouteFeatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? geometry = null,
  }) {
    return _then(_value.copyWith(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteAttributes,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as RouteGeometry,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteAttributesCopyWith<$Res> get attributes {
    return $RouteAttributesCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteGeometryCopyWith<$Res> get geometry {
    return $RouteGeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteFeatureImplCopyWith<$Res>
    implements $RouteFeatureCopyWith<$Res> {
  factory _$$RouteFeatureImplCopyWith(
          _$RouteFeatureImpl value, $Res Function(_$RouteFeatureImpl) then) =
      __$$RouteFeatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteAttributes attributes,
      @JsonKey(name: 'geometry') RouteGeometry geometry});

  @override
  $RouteAttributesCopyWith<$Res> get attributes;
  @override
  $RouteGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class __$$RouteFeatureImplCopyWithImpl<$Res>
    extends _$RouteFeatureCopyWithImpl<$Res, _$RouteFeatureImpl>
    implements _$$RouteFeatureImplCopyWith<$Res> {
  __$$RouteFeatureImplCopyWithImpl(
      _$RouteFeatureImpl _value, $Res Function(_$RouteFeatureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? geometry = null,
  }) {
    return _then(_$RouteFeatureImpl(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteAttributes,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as RouteGeometry,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteFeatureImpl implements _RouteFeature {
  const _$RouteFeatureImpl(
      {@JsonKey(name: 'attributes') required this.attributes,
      @JsonKey(name: 'geometry') required this.geometry});

  factory _$RouteFeatureImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteFeatureImplFromJson(json);

  @override
  @JsonKey(name: 'attributes')
  final RouteAttributes attributes;
  @override
  @JsonKey(name: 'geometry')
  final RouteGeometry geometry;

  @override
  String toString() {
    return 'RouteFeature(attributes: $attributes, geometry: $geometry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteFeatureImpl &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, attributes, geometry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteFeatureImplCopyWith<_$RouteFeatureImpl> get copyWith =>
      __$$RouteFeatureImplCopyWithImpl<_$RouteFeatureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteFeatureImplToJson(
      this,
    );
  }
}

abstract class _RouteFeature implements RouteFeature {
  const factory _RouteFeature(
      {@JsonKey(name: 'attributes') required final RouteAttributes attributes,
      @JsonKey(name: 'geometry')
      required final RouteGeometry geometry}) = _$RouteFeatureImpl;

  factory _RouteFeature.fromJson(Map<String, dynamic> json) =
      _$RouteFeatureImpl.fromJson;

  @override
  @JsonKey(name: 'attributes')
  RouteAttributes get attributes;
  @override
  @JsonKey(name: 'geometry')
  RouteGeometry get geometry;
  @override
  @JsonKey(ignore: true)
  _$$RouteFeatureImplCopyWith<_$RouteFeatureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteAttributes _$RouteAttributesFromJson(Map<String, dynamic> json) {
  return _RouteAttributes.fromJson(json);
}

/// @nodoc
mixin _$RouteAttributes {
  @JsonKey(name: 'ObjectID')
  int? get objectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirstStopID')
  int? get firstStopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastStopID')
  int? get lastStopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StopCount')
  int? get stopCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total_TravelTime')
  double? get totalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total_Kilometers')
  double? get totalKilometers => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total_Miles')
  double? get totalMiles => throw _privateConstructorUsedError;
  @JsonKey(name: 'Shape_Length')
  double? get shapeLength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteAttributesCopyWith<RouteAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteAttributesCopyWith<$Res> {
  factory $RouteAttributesCopyWith(
          RouteAttributes value, $Res Function(RouteAttributes) then) =
      _$RouteAttributesCopyWithImpl<$Res, RouteAttributes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ObjectID') int? objectId,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'FirstStopID') int? firstStopId,
      @JsonKey(name: 'LastStopID') int? lastStopId,
      @JsonKey(name: 'StopCount') int? stopCount,
      @JsonKey(name: 'Total_TravelTime') double? totalTime,
      @JsonKey(name: 'Total_Kilometers') double? totalKilometers,
      @JsonKey(name: 'Total_Miles') double? totalMiles,
      @JsonKey(name: 'Shape_Length') double? shapeLength});
}

/// @nodoc
class _$RouteAttributesCopyWithImpl<$Res, $Val extends RouteAttributes>
    implements $RouteAttributesCopyWith<$Res> {
  _$RouteAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = freezed,
    Object? name = freezed,
    Object? firstStopId = freezed,
    Object? lastStopId = freezed,
    Object? stopCount = freezed,
    Object? totalTime = freezed,
    Object? totalKilometers = freezed,
    Object? totalMiles = freezed,
    Object? shapeLength = freezed,
  }) {
    return _then(_value.copyWith(
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstStopId: freezed == firstStopId
          ? _value.firstStopId
          : firstStopId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastStopId: freezed == lastStopId
          ? _value.lastStopId
          : lastStopId // ignore: cast_nullable_to_non_nullable
              as int?,
      stopCount: freezed == stopCount
          ? _value.stopCount
          : stopCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      totalKilometers: freezed == totalKilometers
          ? _value.totalKilometers
          : totalKilometers // ignore: cast_nullable_to_non_nullable
              as double?,
      totalMiles: freezed == totalMiles
          ? _value.totalMiles
          : totalMiles // ignore: cast_nullable_to_non_nullable
              as double?,
      shapeLength: freezed == shapeLength
          ? _value.shapeLength
          : shapeLength // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteAttributesImplCopyWith<$Res>
    implements $RouteAttributesCopyWith<$Res> {
  factory _$$RouteAttributesImplCopyWith(_$RouteAttributesImpl value,
          $Res Function(_$RouteAttributesImpl) then) =
      __$$RouteAttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ObjectID') int? objectId,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'FirstStopID') int? firstStopId,
      @JsonKey(name: 'LastStopID') int? lastStopId,
      @JsonKey(name: 'StopCount') int? stopCount,
      @JsonKey(name: 'Total_TravelTime') double? totalTime,
      @JsonKey(name: 'Total_Kilometers') double? totalKilometers,
      @JsonKey(name: 'Total_Miles') double? totalMiles,
      @JsonKey(name: 'Shape_Length') double? shapeLength});
}

/// @nodoc
class __$$RouteAttributesImplCopyWithImpl<$Res>
    extends _$RouteAttributesCopyWithImpl<$Res, _$RouteAttributesImpl>
    implements _$$RouteAttributesImplCopyWith<$Res> {
  __$$RouteAttributesImplCopyWithImpl(
      _$RouteAttributesImpl _value, $Res Function(_$RouteAttributesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = freezed,
    Object? name = freezed,
    Object? firstStopId = freezed,
    Object? lastStopId = freezed,
    Object? stopCount = freezed,
    Object? totalTime = freezed,
    Object? totalKilometers = freezed,
    Object? totalMiles = freezed,
    Object? shapeLength = freezed,
  }) {
    return _then(_$RouteAttributesImpl(
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstStopId: freezed == firstStopId
          ? _value.firstStopId
          : firstStopId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastStopId: freezed == lastStopId
          ? _value.lastStopId
          : lastStopId // ignore: cast_nullable_to_non_nullable
              as int?,
      stopCount: freezed == stopCount
          ? _value.stopCount
          : stopCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      totalKilometers: freezed == totalKilometers
          ? _value.totalKilometers
          : totalKilometers // ignore: cast_nullable_to_non_nullable
              as double?,
      totalMiles: freezed == totalMiles
          ? _value.totalMiles
          : totalMiles // ignore: cast_nullable_to_non_nullable
              as double?,
      shapeLength: freezed == shapeLength
          ? _value.shapeLength
          : shapeLength // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteAttributesImpl implements _RouteAttributes {
  const _$RouteAttributesImpl(
      {@JsonKey(name: 'ObjectID') this.objectId,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'FirstStopID') this.firstStopId,
      @JsonKey(name: 'LastStopID') this.lastStopId,
      @JsonKey(name: 'StopCount') this.stopCount,
      @JsonKey(name: 'Total_TravelTime') this.totalTime,
      @JsonKey(name: 'Total_Kilometers') this.totalKilometers,
      @JsonKey(name: 'Total_Miles') this.totalMiles,
      @JsonKey(name: 'Shape_Length') this.shapeLength});

  factory _$RouteAttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteAttributesImplFromJson(json);

  @override
  @JsonKey(name: 'ObjectID')
  final int? objectId;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'FirstStopID')
  final int? firstStopId;
  @override
  @JsonKey(name: 'LastStopID')
  final int? lastStopId;
  @override
  @JsonKey(name: 'StopCount')
  final int? stopCount;
  @override
  @JsonKey(name: 'Total_TravelTime')
  final double? totalTime;
  @override
  @JsonKey(name: 'Total_Kilometers')
  final double? totalKilometers;
  @override
  @JsonKey(name: 'Total_Miles')
  final double? totalMiles;
  @override
  @JsonKey(name: 'Shape_Length')
  final double? shapeLength;

  @override
  String toString() {
    return 'RouteAttributes(objectId: $objectId, name: $name, firstStopId: $firstStopId, lastStopId: $lastStopId, stopCount: $stopCount, totalTime: $totalTime, totalKilometers: $totalKilometers, totalMiles: $totalMiles, shapeLength: $shapeLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteAttributesImpl &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.firstStopId, firstStopId) ||
                other.firstStopId == firstStopId) &&
            (identical(other.lastStopId, lastStopId) ||
                other.lastStopId == lastStopId) &&
            (identical(other.stopCount, stopCount) ||
                other.stopCount == stopCount) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.totalKilometers, totalKilometers) ||
                other.totalKilometers == totalKilometers) &&
            (identical(other.totalMiles, totalMiles) ||
                other.totalMiles == totalMiles) &&
            (identical(other.shapeLength, shapeLength) ||
                other.shapeLength == shapeLength));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      objectId,
      name,
      firstStopId,
      lastStopId,
      stopCount,
      totalTime,
      totalKilometers,
      totalMiles,
      shapeLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteAttributesImplCopyWith<_$RouteAttributesImpl> get copyWith =>
      __$$RouteAttributesImplCopyWithImpl<_$RouteAttributesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteAttributesImplToJson(
      this,
    );
  }
}

abstract class _RouteAttributes implements RouteAttributes {
  const factory _RouteAttributes(
          {@JsonKey(name: 'ObjectID') final int? objectId,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'FirstStopID') final int? firstStopId,
          @JsonKey(name: 'LastStopID') final int? lastStopId,
          @JsonKey(name: 'StopCount') final int? stopCount,
          @JsonKey(name: 'Total_TravelTime') final double? totalTime,
          @JsonKey(name: 'Total_Kilometers') final double? totalKilometers,
          @JsonKey(name: 'Total_Miles') final double? totalMiles,
          @JsonKey(name: 'Shape_Length') final double? shapeLength}) =
      _$RouteAttributesImpl;

  factory _RouteAttributes.fromJson(Map<String, dynamic> json) =
      _$RouteAttributesImpl.fromJson;

  @override
  @JsonKey(name: 'ObjectID')
  int? get objectId;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'FirstStopID')
  int? get firstStopId;
  @override
  @JsonKey(name: 'LastStopID')
  int? get lastStopId;
  @override
  @JsonKey(name: 'StopCount')
  int? get stopCount;
  @override
  @JsonKey(name: 'Total_TravelTime')
  double? get totalTime;
  @override
  @JsonKey(name: 'Total_Kilometers')
  double? get totalKilometers;
  @override
  @JsonKey(name: 'Total_Miles')
  double? get totalMiles;
  @override
  @JsonKey(name: 'Shape_Length')
  double? get shapeLength;
  @override
  @JsonKey(ignore: true)
  _$$RouteAttributesImplCopyWith<_$RouteAttributesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteGeometry _$RouteGeometryFromJson(Map<String, dynamic> json) {
  return _RouteGeometry.fromJson(json);
}

/// @nodoc
mixin _$RouteGeometry {
  @JsonKey(name: 'paths')
  List<List<List<double>>> get paths => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteGeometryCopyWith<RouteGeometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteGeometryCopyWith<$Res> {
  factory $RouteGeometryCopyWith(
          RouteGeometry value, $Res Function(RouteGeometry) then) =
      _$RouteGeometryCopyWithImpl<$Res, RouteGeometry>;
  @useResult
  $Res call({@JsonKey(name: 'paths') List<List<List<double>>> paths});
}

/// @nodoc
class _$RouteGeometryCopyWithImpl<$Res, $Val extends RouteGeometry>
    implements $RouteGeometryCopyWith<$Res> {
  _$RouteGeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paths = null,
  }) {
    return _then(_value.copyWith(
      paths: null == paths
          ? _value.paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteGeometryImplCopyWith<$Res>
    implements $RouteGeometryCopyWith<$Res> {
  factory _$$RouteGeometryImplCopyWith(
          _$RouteGeometryImpl value, $Res Function(_$RouteGeometryImpl) then) =
      __$$RouteGeometryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'paths') List<List<List<double>>> paths});
}

/// @nodoc
class __$$RouteGeometryImplCopyWithImpl<$Res>
    extends _$RouteGeometryCopyWithImpl<$Res, _$RouteGeometryImpl>
    implements _$$RouteGeometryImplCopyWith<$Res> {
  __$$RouteGeometryImplCopyWithImpl(
      _$RouteGeometryImpl _value, $Res Function(_$RouteGeometryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paths = null,
  }) {
    return _then(_$RouteGeometryImpl(
      paths: null == paths
          ? _value._paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteGeometryImpl implements _RouteGeometry {
  const _$RouteGeometryImpl(
      {@JsonKey(name: 'paths') required final List<List<List<double>>> paths})
      : _paths = paths;

  factory _$RouteGeometryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteGeometryImplFromJson(json);

  final List<List<List<double>>> _paths;
  @override
  @JsonKey(name: 'paths')
  List<List<List<double>>> get paths {
    if (_paths is EqualUnmodifiableListView) return _paths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paths);
  }

  @override
  String toString() {
    return 'RouteGeometry(paths: $paths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteGeometryImpl &&
            const DeepCollectionEquality().equals(other._paths, _paths));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_paths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteGeometryImplCopyWith<_$RouteGeometryImpl> get copyWith =>
      __$$RouteGeometryImplCopyWithImpl<_$RouteGeometryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteGeometryImplToJson(
      this,
    );
  }
}

abstract class _RouteGeometry implements RouteGeometry {
  const factory _RouteGeometry(
      {@JsonKey(name: 'paths')
      required final List<List<List<double>>> paths}) = _$RouteGeometryImpl;

  factory _RouteGeometry.fromJson(Map<String, dynamic> json) =
      _$RouteGeometryImpl.fromJson;

  @override
  @JsonKey(name: 'paths')
  List<List<List<double>>> get paths;
  @override
  @JsonKey(ignore: true)
  _$$RouteGeometryImplCopyWith<_$RouteGeometryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageryMetadataResponse _$ImageryMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return _ImageryMetadataResponse.fromJson(json);
}

/// @nodoc
mixin _$ImageryMetadataResponse {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'extent')
  ImageryExtent? get extent => throw _privateConstructorUsedError;
  @JsonKey(name: 'pixelSizeX')
  double? get pixelSizeX => throw _privateConstructorUsedError;
  @JsonKey(name: 'pixelSizeY')
  double? get pixelSizeY => throw _privateConstructorUsedError;
  @JsonKey(name: 'bandCount')
  int? get bandCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'pixelType')
  String? get pixelType => throw _privateConstructorUsedError;
  @JsonKey(name: 'minPixelSize')
  double? get minPixelSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxPixelSize')
  double? get maxPixelSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'copyrightText')
  String? get copyrightText => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceDataType')
  String? get serviceDataType => throw _privateConstructorUsedError;
  @JsonKey(name: 'minValues')
  List<double>? get minValues => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxValues')
  List<double>? get maxValues => throw _privateConstructorUsedError;
  @JsonKey(name: 'meanValues')
  List<double>? get meanValues => throw _privateConstructorUsedError;
  @JsonKey(name: 'stdvValues')
  List<double>? get stdvValues => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageryMetadataResponseCopyWith<ImageryMetadataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageryMetadataResponseCopyWith<$Res> {
  factory $ImageryMetadataResponseCopyWith(ImageryMetadataResponse value,
          $Res Function(ImageryMetadataResponse) then) =
      _$ImageryMetadataResponseCopyWithImpl<$Res, ImageryMetadataResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'extent') ImageryExtent? extent,
      @JsonKey(name: 'pixelSizeX') double? pixelSizeX,
      @JsonKey(name: 'pixelSizeY') double? pixelSizeY,
      @JsonKey(name: 'bandCount') int? bandCount,
      @JsonKey(name: 'pixelType') String? pixelType,
      @JsonKey(name: 'minPixelSize') double? minPixelSize,
      @JsonKey(name: 'maxPixelSize') double? maxPixelSize,
      @JsonKey(name: 'copyrightText') String? copyrightText,
      @JsonKey(name: 'serviceDataType') String? serviceDataType,
      @JsonKey(name: 'minValues') List<double>? minValues,
      @JsonKey(name: 'maxValues') List<double>? maxValues,
      @JsonKey(name: 'meanValues') List<double>? meanValues,
      @JsonKey(name: 'stdvValues') List<double>? stdvValues});

  $ImageryExtentCopyWith<$Res>? get extent;
}

/// @nodoc
class _$ImageryMetadataResponseCopyWithImpl<$Res,
        $Val extends ImageryMetadataResponse>
    implements $ImageryMetadataResponseCopyWith<$Res> {
  _$ImageryMetadataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? extent = freezed,
    Object? pixelSizeX = freezed,
    Object? pixelSizeY = freezed,
    Object? bandCount = freezed,
    Object? pixelType = freezed,
    Object? minPixelSize = freezed,
    Object? maxPixelSize = freezed,
    Object? copyrightText = freezed,
    Object? serviceDataType = freezed,
    Object? minValues = freezed,
    Object? maxValues = freezed,
    Object? meanValues = freezed,
    Object? stdvValues = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extent: freezed == extent
          ? _value.extent
          : extent // ignore: cast_nullable_to_non_nullable
              as ImageryExtent?,
      pixelSizeX: freezed == pixelSizeX
          ? _value.pixelSizeX
          : pixelSizeX // ignore: cast_nullable_to_non_nullable
              as double?,
      pixelSizeY: freezed == pixelSizeY
          ? _value.pixelSizeY
          : pixelSizeY // ignore: cast_nullable_to_non_nullable
              as double?,
      bandCount: freezed == bandCount
          ? _value.bandCount
          : bandCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pixelType: freezed == pixelType
          ? _value.pixelType
          : pixelType // ignore: cast_nullable_to_non_nullable
              as String?,
      minPixelSize: freezed == minPixelSize
          ? _value.minPixelSize
          : minPixelSize // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPixelSize: freezed == maxPixelSize
          ? _value.maxPixelSize
          : maxPixelSize // ignore: cast_nullable_to_non_nullable
              as double?,
      copyrightText: freezed == copyrightText
          ? _value.copyrightText
          : copyrightText // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceDataType: freezed == serviceDataType
          ? _value.serviceDataType
          : serviceDataType // ignore: cast_nullable_to_non_nullable
              as String?,
      minValues: freezed == minValues
          ? _value.minValues
          : minValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      maxValues: freezed == maxValues
          ? _value.maxValues
          : maxValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      meanValues: freezed == meanValues
          ? _value.meanValues
          : meanValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      stdvValues: freezed == stdvValues
          ? _value.stdvValues
          : stdvValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageryExtentCopyWith<$Res>? get extent {
    if (_value.extent == null) {
      return null;
    }

    return $ImageryExtentCopyWith<$Res>(_value.extent!, (value) {
      return _then(_value.copyWith(extent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImageryMetadataResponseImplCopyWith<$Res>
    implements $ImageryMetadataResponseCopyWith<$Res> {
  factory _$$ImageryMetadataResponseImplCopyWith(
          _$ImageryMetadataResponseImpl value,
          $Res Function(_$ImageryMetadataResponseImpl) then) =
      __$$ImageryMetadataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'extent') ImageryExtent? extent,
      @JsonKey(name: 'pixelSizeX') double? pixelSizeX,
      @JsonKey(name: 'pixelSizeY') double? pixelSizeY,
      @JsonKey(name: 'bandCount') int? bandCount,
      @JsonKey(name: 'pixelType') String? pixelType,
      @JsonKey(name: 'minPixelSize') double? minPixelSize,
      @JsonKey(name: 'maxPixelSize') double? maxPixelSize,
      @JsonKey(name: 'copyrightText') String? copyrightText,
      @JsonKey(name: 'serviceDataType') String? serviceDataType,
      @JsonKey(name: 'minValues') List<double>? minValues,
      @JsonKey(name: 'maxValues') List<double>? maxValues,
      @JsonKey(name: 'meanValues') List<double>? meanValues,
      @JsonKey(name: 'stdvValues') List<double>? stdvValues});

  @override
  $ImageryExtentCopyWith<$Res>? get extent;
}

/// @nodoc
class __$$ImageryMetadataResponseImplCopyWithImpl<$Res>
    extends _$ImageryMetadataResponseCopyWithImpl<$Res,
        _$ImageryMetadataResponseImpl>
    implements _$$ImageryMetadataResponseImplCopyWith<$Res> {
  __$$ImageryMetadataResponseImplCopyWithImpl(
      _$ImageryMetadataResponseImpl _value,
      $Res Function(_$ImageryMetadataResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? extent = freezed,
    Object? pixelSizeX = freezed,
    Object? pixelSizeY = freezed,
    Object? bandCount = freezed,
    Object? pixelType = freezed,
    Object? minPixelSize = freezed,
    Object? maxPixelSize = freezed,
    Object? copyrightText = freezed,
    Object? serviceDataType = freezed,
    Object? minValues = freezed,
    Object? maxValues = freezed,
    Object? meanValues = freezed,
    Object? stdvValues = freezed,
  }) {
    return _then(_$ImageryMetadataResponseImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extent: freezed == extent
          ? _value.extent
          : extent // ignore: cast_nullable_to_non_nullable
              as ImageryExtent?,
      pixelSizeX: freezed == pixelSizeX
          ? _value.pixelSizeX
          : pixelSizeX // ignore: cast_nullable_to_non_nullable
              as double?,
      pixelSizeY: freezed == pixelSizeY
          ? _value.pixelSizeY
          : pixelSizeY // ignore: cast_nullable_to_non_nullable
              as double?,
      bandCount: freezed == bandCount
          ? _value.bandCount
          : bandCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pixelType: freezed == pixelType
          ? _value.pixelType
          : pixelType // ignore: cast_nullable_to_non_nullable
              as String?,
      minPixelSize: freezed == minPixelSize
          ? _value.minPixelSize
          : minPixelSize // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPixelSize: freezed == maxPixelSize
          ? _value.maxPixelSize
          : maxPixelSize // ignore: cast_nullable_to_non_nullable
              as double?,
      copyrightText: freezed == copyrightText
          ? _value.copyrightText
          : copyrightText // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceDataType: freezed == serviceDataType
          ? _value.serviceDataType
          : serviceDataType // ignore: cast_nullable_to_non_nullable
              as String?,
      minValues: freezed == minValues
          ? _value._minValues
          : minValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      maxValues: freezed == maxValues
          ? _value._maxValues
          : maxValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      meanValues: freezed == meanValues
          ? _value._meanValues
          : meanValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      stdvValues: freezed == stdvValues
          ? _value._stdvValues
          : stdvValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageryMetadataResponseImpl implements _ImageryMetadataResponse {
  const _$ImageryMetadataResponseImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'extent') this.extent,
      @JsonKey(name: 'pixelSizeX') this.pixelSizeX,
      @JsonKey(name: 'pixelSizeY') this.pixelSizeY,
      @JsonKey(name: 'bandCount') this.bandCount,
      @JsonKey(name: 'pixelType') this.pixelType,
      @JsonKey(name: 'minPixelSize') this.minPixelSize,
      @JsonKey(name: 'maxPixelSize') this.maxPixelSize,
      @JsonKey(name: 'copyrightText') this.copyrightText,
      @JsonKey(name: 'serviceDataType') this.serviceDataType,
      @JsonKey(name: 'minValues') final List<double>? minValues,
      @JsonKey(name: 'maxValues') final List<double>? maxValues,
      @JsonKey(name: 'meanValues') final List<double>? meanValues,
      @JsonKey(name: 'stdvValues') final List<double>? stdvValues})
      : _minValues = minValues,
        _maxValues = maxValues,
        _meanValues = meanValues,
        _stdvValues = stdvValues;

  factory _$ImageryMetadataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageryMetadataResponseImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'extent')
  final ImageryExtent? extent;
  @override
  @JsonKey(name: 'pixelSizeX')
  final double? pixelSizeX;
  @override
  @JsonKey(name: 'pixelSizeY')
  final double? pixelSizeY;
  @override
  @JsonKey(name: 'bandCount')
  final int? bandCount;
  @override
  @JsonKey(name: 'pixelType')
  final String? pixelType;
  @override
  @JsonKey(name: 'minPixelSize')
  final double? minPixelSize;
  @override
  @JsonKey(name: 'maxPixelSize')
  final double? maxPixelSize;
  @override
  @JsonKey(name: 'copyrightText')
  final String? copyrightText;
  @override
  @JsonKey(name: 'serviceDataType')
  final String? serviceDataType;
  final List<double>? _minValues;
  @override
  @JsonKey(name: 'minValues')
  List<double>? get minValues {
    final value = _minValues;
    if (value == null) return null;
    if (_minValues is EqualUnmodifiableListView) return _minValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _maxValues;
  @override
  @JsonKey(name: 'maxValues')
  List<double>? get maxValues {
    final value = _maxValues;
    if (value == null) return null;
    if (_maxValues is EqualUnmodifiableListView) return _maxValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _meanValues;
  @override
  @JsonKey(name: 'meanValues')
  List<double>? get meanValues {
    final value = _meanValues;
    if (value == null) return null;
    if (_meanValues is EqualUnmodifiableListView) return _meanValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _stdvValues;
  @override
  @JsonKey(name: 'stdvValues')
  List<double>? get stdvValues {
    final value = _stdvValues;
    if (value == null) return null;
    if (_stdvValues is EqualUnmodifiableListView) return _stdvValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ImageryMetadataResponse(name: $name, description: $description, extent: $extent, pixelSizeX: $pixelSizeX, pixelSizeY: $pixelSizeY, bandCount: $bandCount, pixelType: $pixelType, minPixelSize: $minPixelSize, maxPixelSize: $maxPixelSize, copyrightText: $copyrightText, serviceDataType: $serviceDataType, minValues: $minValues, maxValues: $maxValues, meanValues: $meanValues, stdvValues: $stdvValues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageryMetadataResponseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.extent, extent) || other.extent == extent) &&
            (identical(other.pixelSizeX, pixelSizeX) ||
                other.pixelSizeX == pixelSizeX) &&
            (identical(other.pixelSizeY, pixelSizeY) ||
                other.pixelSizeY == pixelSizeY) &&
            (identical(other.bandCount, bandCount) ||
                other.bandCount == bandCount) &&
            (identical(other.pixelType, pixelType) ||
                other.pixelType == pixelType) &&
            (identical(other.minPixelSize, minPixelSize) ||
                other.minPixelSize == minPixelSize) &&
            (identical(other.maxPixelSize, maxPixelSize) ||
                other.maxPixelSize == maxPixelSize) &&
            (identical(other.copyrightText, copyrightText) ||
                other.copyrightText == copyrightText) &&
            (identical(other.serviceDataType, serviceDataType) ||
                other.serviceDataType == serviceDataType) &&
            const DeepCollectionEquality()
                .equals(other._minValues, _minValues) &&
            const DeepCollectionEquality()
                .equals(other._maxValues, _maxValues) &&
            const DeepCollectionEquality()
                .equals(other._meanValues, _meanValues) &&
            const DeepCollectionEquality()
                .equals(other._stdvValues, _stdvValues));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      extent,
      pixelSizeX,
      pixelSizeY,
      bandCount,
      pixelType,
      minPixelSize,
      maxPixelSize,
      copyrightText,
      serviceDataType,
      const DeepCollectionEquality().hash(_minValues),
      const DeepCollectionEquality().hash(_maxValues),
      const DeepCollectionEquality().hash(_meanValues),
      const DeepCollectionEquality().hash(_stdvValues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageryMetadataResponseImplCopyWith<_$ImageryMetadataResponseImpl>
      get copyWith => __$$ImageryMetadataResponseImplCopyWithImpl<
          _$ImageryMetadataResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageryMetadataResponseImplToJson(
      this,
    );
  }
}

abstract class _ImageryMetadataResponse implements ImageryMetadataResponse {
  const factory _ImageryMetadataResponse(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'extent') final ImageryExtent? extent,
          @JsonKey(name: 'pixelSizeX') final double? pixelSizeX,
          @JsonKey(name: 'pixelSizeY') final double? pixelSizeY,
          @JsonKey(name: 'bandCount') final int? bandCount,
          @JsonKey(name: 'pixelType') final String? pixelType,
          @JsonKey(name: 'minPixelSize') final double? minPixelSize,
          @JsonKey(name: 'maxPixelSize') final double? maxPixelSize,
          @JsonKey(name: 'copyrightText') final String? copyrightText,
          @JsonKey(name: 'serviceDataType') final String? serviceDataType,
          @JsonKey(name: 'minValues') final List<double>? minValues,
          @JsonKey(name: 'maxValues') final List<double>? maxValues,
          @JsonKey(name: 'meanValues') final List<double>? meanValues,
          @JsonKey(name: 'stdvValues') final List<double>? stdvValues}) =
      _$ImageryMetadataResponseImpl;

  factory _ImageryMetadataResponse.fromJson(Map<String, dynamic> json) =
      _$ImageryMetadataResponseImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'extent')
  ImageryExtent? get extent;
  @override
  @JsonKey(name: 'pixelSizeX')
  double? get pixelSizeX;
  @override
  @JsonKey(name: 'pixelSizeY')
  double? get pixelSizeY;
  @override
  @JsonKey(name: 'bandCount')
  int? get bandCount;
  @override
  @JsonKey(name: 'pixelType')
  String? get pixelType;
  @override
  @JsonKey(name: 'minPixelSize')
  double? get minPixelSize;
  @override
  @JsonKey(name: 'maxPixelSize')
  double? get maxPixelSize;
  @override
  @JsonKey(name: 'copyrightText')
  String? get copyrightText;
  @override
  @JsonKey(name: 'serviceDataType')
  String? get serviceDataType;
  @override
  @JsonKey(name: 'minValues')
  List<double>? get minValues;
  @override
  @JsonKey(name: 'maxValues')
  List<double>? get maxValues;
  @override
  @JsonKey(name: 'meanValues')
  List<double>? get meanValues;
  @override
  @JsonKey(name: 'stdvValues')
  List<double>? get stdvValues;
  @override
  @JsonKey(ignore: true)
  _$$ImageryMetadataResponseImplCopyWith<_$ImageryMetadataResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ImageryExtent _$ImageryExtentFromJson(Map<String, dynamic> json) {
  return _ImageryExtent.fromJson(json);
}

/// @nodoc
mixin _$ImageryExtent {
  @JsonKey(name: 'xmin')
  double get xmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'ymin')
  double get ymin => throw _privateConstructorUsedError;
  @JsonKey(name: 'xmax')
  double get xmax => throw _privateConstructorUsedError;
  @JsonKey(name: 'ymax')
  double get ymax => throw _privateConstructorUsedError;
  @JsonKey(name: 'spatialReference')
  Map<String, dynamic>? get spatialReference =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageryExtentCopyWith<ImageryExtent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageryExtentCopyWith<$Res> {
  factory $ImageryExtentCopyWith(
          ImageryExtent value, $Res Function(ImageryExtent) then) =
      _$ImageryExtentCopyWithImpl<$Res, ImageryExtent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'xmin') double xmin,
      @JsonKey(name: 'ymin') double ymin,
      @JsonKey(name: 'xmax') double xmax,
      @JsonKey(name: 'ymax') double ymax,
      @JsonKey(name: 'spatialReference')
      Map<String, dynamic>? spatialReference});
}

/// @nodoc
class _$ImageryExtentCopyWithImpl<$Res, $Val extends ImageryExtent>
    implements $ImageryExtentCopyWith<$Res> {
  _$ImageryExtentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xmin = null,
    Object? ymin = null,
    Object? xmax = null,
    Object? ymax = null,
    Object? spatialReference = freezed,
  }) {
    return _then(_value.copyWith(
      xmin: null == xmin
          ? _value.xmin
          : xmin // ignore: cast_nullable_to_non_nullable
              as double,
      ymin: null == ymin
          ? _value.ymin
          : ymin // ignore: cast_nullable_to_non_nullable
              as double,
      xmax: null == xmax
          ? _value.xmax
          : xmax // ignore: cast_nullable_to_non_nullable
              as double,
      ymax: null == ymax
          ? _value.ymax
          : ymax // ignore: cast_nullable_to_non_nullable
              as double,
      spatialReference: freezed == spatialReference
          ? _value.spatialReference
          : spatialReference // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageryExtentImplCopyWith<$Res>
    implements $ImageryExtentCopyWith<$Res> {
  factory _$$ImageryExtentImplCopyWith(
          _$ImageryExtentImpl value, $Res Function(_$ImageryExtentImpl) then) =
      __$$ImageryExtentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'xmin') double xmin,
      @JsonKey(name: 'ymin') double ymin,
      @JsonKey(name: 'xmax') double xmax,
      @JsonKey(name: 'ymax') double ymax,
      @JsonKey(name: 'spatialReference')
      Map<String, dynamic>? spatialReference});
}

/// @nodoc
class __$$ImageryExtentImplCopyWithImpl<$Res>
    extends _$ImageryExtentCopyWithImpl<$Res, _$ImageryExtentImpl>
    implements _$$ImageryExtentImplCopyWith<$Res> {
  __$$ImageryExtentImplCopyWithImpl(
      _$ImageryExtentImpl _value, $Res Function(_$ImageryExtentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xmin = null,
    Object? ymin = null,
    Object? xmax = null,
    Object? ymax = null,
    Object? spatialReference = freezed,
  }) {
    return _then(_$ImageryExtentImpl(
      xmin: null == xmin
          ? _value.xmin
          : xmin // ignore: cast_nullable_to_non_nullable
              as double,
      ymin: null == ymin
          ? _value.ymin
          : ymin // ignore: cast_nullable_to_non_nullable
              as double,
      xmax: null == xmax
          ? _value.xmax
          : xmax // ignore: cast_nullable_to_non_nullable
              as double,
      ymax: null == ymax
          ? _value.ymax
          : ymax // ignore: cast_nullable_to_non_nullable
              as double,
      spatialReference: freezed == spatialReference
          ? _value._spatialReference
          : spatialReference // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageryExtentImpl implements _ImageryExtent {
  const _$ImageryExtentImpl(
      {@JsonKey(name: 'xmin') required this.xmin,
      @JsonKey(name: 'ymin') required this.ymin,
      @JsonKey(name: 'xmax') required this.xmax,
      @JsonKey(name: 'ymax') required this.ymax,
      @JsonKey(name: 'spatialReference')
      final Map<String, dynamic>? spatialReference})
      : _spatialReference = spatialReference;

  factory _$ImageryExtentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageryExtentImplFromJson(json);

  @override
  @JsonKey(name: 'xmin')
  final double xmin;
  @override
  @JsonKey(name: 'ymin')
  final double ymin;
  @override
  @JsonKey(name: 'xmax')
  final double xmax;
  @override
  @JsonKey(name: 'ymax')
  final double ymax;
  final Map<String, dynamic>? _spatialReference;
  @override
  @JsonKey(name: 'spatialReference')
  Map<String, dynamic>? get spatialReference {
    final value = _spatialReference;
    if (value == null) return null;
    if (_spatialReference is EqualUnmodifiableMapView) return _spatialReference;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ImageryExtent(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax, spatialReference: $spatialReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageryExtentImpl &&
            (identical(other.xmin, xmin) || other.xmin == xmin) &&
            (identical(other.ymin, ymin) || other.ymin == ymin) &&
            (identical(other.xmax, xmax) || other.xmax == xmax) &&
            (identical(other.ymax, ymax) || other.ymax == ymax) &&
            const DeepCollectionEquality()
                .equals(other._spatialReference, _spatialReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, xmin, ymin, xmax, ymax,
      const DeepCollectionEquality().hash(_spatialReference));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageryExtentImplCopyWith<_$ImageryExtentImpl> get copyWith =>
      __$$ImageryExtentImplCopyWithImpl<_$ImageryExtentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageryExtentImplToJson(
      this,
    );
  }
}

abstract class _ImageryExtent implements ImageryExtent {
  const factory _ImageryExtent(
      {@JsonKey(name: 'xmin') required final double xmin,
      @JsonKey(name: 'ymin') required final double ymin,
      @JsonKey(name: 'xmax') required final double xmax,
      @JsonKey(name: 'ymax') required final double ymax,
      @JsonKey(name: 'spatialReference')
      final Map<String, dynamic>? spatialReference}) = _$ImageryExtentImpl;

  factory _ImageryExtent.fromJson(Map<String, dynamic> json) =
      _$ImageryExtentImpl.fromJson;

  @override
  @JsonKey(name: 'xmin')
  double get xmin;
  @override
  @JsonKey(name: 'ymin')
  double get ymin;
  @override
  @JsonKey(name: 'xmax')
  double get xmax;
  @override
  @JsonKey(name: 'ymax')
  double get ymax;
  @override
  @JsonKey(name: 'spatialReference')
  Map<String, dynamic>? get spatialReference;
  @override
  @JsonKey(ignore: true)
  _$$ImageryExtentImplCopyWith<_$ImageryExtentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
