// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationPointImpl _$$LocationPointImplFromJson(Map<String, dynamic> json) =>
    _$LocationPointImpl(
      lng: (json['x'] as num?)?.toDouble() ?? 0.0,
      lat: (json['y'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$LocationPointImplToJson(_$LocationPointImpl instance) =>
    <String, dynamic>{
      'x': instance.lng,
      'y': instance.lat,
    };

_$GeocodeResponseImpl _$$GeocodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GeocodeResponseImpl(
      candidates: (json['candidates'] as List<dynamic>?)
              ?.map((e) => GeocodeCandidate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GeocodeResponseImplToJson(
        _$GeocodeResponseImpl instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
    };

_$GeocodeCandidateImpl _$$GeocodeCandidateImplFromJson(
        Map<String, dynamic> json) =>
    _$GeocodeCandidateImpl(
      address: json['address'] as String? ?? '',
      location:
          LocationPoint.fromJson(json['location'] as Map<String, dynamic>),
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      extent: json['extent'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GeocodeCandidateImplToJson(
        _$GeocodeCandidateImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'location': instance.location,
      'score': instance.score,
      'attributes': instance.attributes,
      'extent': instance.extent,
    };

_$ReverseGeocodeResponseImpl _$$ReverseGeocodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReverseGeocodeResponseImpl(
      address: AddressInfo.fromJson(json['address'] as Map<String, dynamic>),
      location:
          LocationPoint.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReverseGeocodeResponseImplToJson(
        _$ReverseGeocodeResponseImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'location': instance.location,
    };

_$AddressInfoImpl _$$AddressInfoImplFromJson(Map<String, dynamic> json) =>
    _$AddressInfoImpl(
      fullAddress: json['Match_addr'] as String?,
      streetName: json['Address'] as String?,
      neighborhood: json['Neighborhood'] as String?,
      district: json['District'] as String?,
      city: json['City'] as String?,
      region: json['Region'] as String?,
      countryName: json['CntryName'] as String?,
      postalCode: json['Postal'] as String?,
    );

Map<String, dynamic> _$$AddressInfoImplToJson(_$AddressInfoImpl instance) =>
    <String, dynamic>{
      'Match_addr': instance.fullAddress,
      'Address': instance.streetName,
      'Neighborhood': instance.neighborhood,
      'District': instance.district,
      'City': instance.city,
      'Region': instance.region,
      'CntryName': instance.countryName,
      'Postal': instance.postalCode,
    };
