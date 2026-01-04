import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocoding_models.freezed.dart';
part 'geocoding_models.g.dart';

@freezed
class GeocodeResponse with _$GeocodeResponse {
  const factory GeocodeResponse({
    @JsonKey(name: 'candidates') required List<GeocodeCandidate> candidates,
  }) = _GeocodeResponse;

  factory GeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodeResponseFromJson(json);
}

@freezed
class GeocodeCandidate with _$GeocodeCandidate {
  const factory GeocodeCandidate({
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'location') required LocationPoint location,
    @JsonKey(name: 'score') required double score,
    @JsonKey(name: 'attributes') Map<String, dynamic>? attributes,
  }) = _GeocodeCandidate;

  factory GeocodeCandidate.fromJson(Map<String, dynamic> json) =>
      _$GeocodeCandidateFromJson(json);
}

@freezed
class ReverseGeocodeResponse with _$ReverseGeocodeResponse {
  const factory ReverseGeocodeResponse({
    @JsonKey(name: 'address') required AddressInfo address,
    @JsonKey(name: 'location') required LocationPoint location,
  }) = _ReverseGeocodeResponse;

  factory ReverseGeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodeResponseFromJson(json);
}

@freezed
class AddressInfo with _$AddressInfo {
  const factory AddressInfo({
    @JsonKey(name: 'Match_addr') String? fullAddress,
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
    @JsonKey(name: 'CountryCode') String? countryCode,
  }) = _AddressInfo;

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);
}

@freezed
class LocationPoint with _$LocationPoint {
  const factory LocationPoint({
    @JsonKey(name: 'x') required double longitude,
    @JsonKey(name: 'y') required double latitude,
  }) = _LocationPoint;

  factory LocationPoint.fromJson(Map<String, dynamic> json) =>
      _$LocationPointFromJson(json);
}
