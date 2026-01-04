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
