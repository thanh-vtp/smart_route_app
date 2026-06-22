// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationPoint _$LocationPointFromJson(Map<String, dynamic> json) =>
    _LocationPoint(
      lng: (json['x'] as num?)?.toDouble() ?? 0.0,
      lat: (json['y'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$LocationPointToJson(_LocationPoint instance) =>
    <String, dynamic>{'x': instance.lng, 'y': instance.lat};

_GeocodeResponse _$GeocodeResponseFromJson(Map<String, dynamic> json) =>
    _GeocodeResponse(
      candidates:
          (json['candidates'] as List<dynamic>?)
              ?.map((e) => GeocodeCandidate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GeocodeResponseToJson(_GeocodeResponse instance) =>
    <String, dynamic>{'candidates': instance.candidates};

_GeocodeCandidate _$GeocodeCandidateFromJson(Map<String, dynamic> json) =>
    _GeocodeCandidate(
      address: json['address'] as String? ?? '',
      location: LocationPoint.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      extent: json['extent'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GeocodeCandidateToJson(_GeocodeCandidate instance) =>
    <String, dynamic>{
      'address': instance.address,
      'location': instance.location,
      'score': instance.score,
      'attributes': instance.attributes,
      'extent': instance.extent,
    };

_ReverseGeocodeResponse _$ReverseGeocodeResponseFromJson(
  Map<String, dynamic> json,
) => _ReverseGeocodeResponse(
  address: AddressInfo.fromJson(json['address'] as Map<String, dynamic>),
  location: LocationPoint.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReverseGeocodeResponseToJson(
  _ReverseGeocodeResponse instance,
) => <String, dynamic>{
  'address': instance.address,
  'location': instance.location,
};

_AddressInfo _$AddressInfoFromJson(Map<String, dynamic> json) => _AddressInfo(
  fullAddress: json['Match_addr'] as String?,
  longLabel: json['LongLabel'] as String?,
  shortLabel: json['ShortLabel'] as String?,
  houseNumber: json['AddNum'] as String?,
  streetPrefix: json['StPreType'] as String?,
  streetName: json['StName'] as String?,
  ward: json['Nbrhd'] as String?,
  district: json['District'] as String?,
  city: json['City'] as String?,
  province: json['Region'] as String?,
  countryName: json['CntryName'] as String?,
  postalCode: json['Postal'] as String?,
  placeName: json['PlaceName'] as String?,
  placeType: json['Type'] as String?,
);

Map<String, dynamic> _$AddressInfoToJson(_AddressInfo instance) =>
    <String, dynamic>{
      'Match_addr': instance.fullAddress,
      'LongLabel': instance.longLabel,
      'ShortLabel': instance.shortLabel,
      'AddNum': instance.houseNumber,
      'StPreType': instance.streetPrefix,
      'StName': instance.streetName,
      'Nbrhd': instance.ward,
      'District': instance.district,
      'City': instance.city,
      'Region': instance.province,
      'CntryName': instance.countryName,
      'Postal': instance.postalCode,
      'PlaceName': instance.placeName,
      'Type': instance.placeType,
    };
