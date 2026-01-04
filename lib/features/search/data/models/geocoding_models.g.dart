// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeocodeResponseImpl _$$GeocodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GeocodeResponseImpl(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => GeocodeCandidate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GeocodeResponseImplToJson(
        _$GeocodeResponseImpl instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
    };

_$GeocodeCandidateImpl _$$GeocodeCandidateImplFromJson(
        Map<String, dynamic> json) =>
    _$GeocodeCandidateImpl(
      address: json['address'] as String,
      location:
          LocationPoint.fromJson(json['location'] as Map<String, dynamic>),
      score: (json['score'] as num).toDouble(),
      attributes: json['attributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GeocodeCandidateImplToJson(
        _$GeocodeCandidateImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'location': instance.location,
      'score': instance.score,
      'attributes': instance.attributes,
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
      longLabel: json['LongLabel'] as String?,
      shortLabel: json['ShortLabel'] as String?,
      addressType: json['Addr_type'] as String?,
      type: json['Type'] as String?,
      placeName: json['PlaceName'] as String?,
      addressNumber: json['AddNum'] as String?,
      streetName: json['Address'] as String?,
      block: json['Block'] as String?,
      sector: json['Sector'] as String?,
      neighborhood: json['Neighborhood'] as String?,
      district: json['District'] as String?,
      city: json['City'] as String?,
      metroArea: json['MetroArea'] as String?,
      subregion: json['Subregion'] as String?,
      region: json['Region'] as String?,
      territory: json['Territory'] as String?,
      postalCode: json['Postal'] as String?,
      postalExtension: json['PostalExt'] as String?,
      countryName: json['CntryName'] as String?,
      countryCode: json['CountryCode'] as String?,
    );

Map<String, dynamic> _$$AddressInfoImplToJson(_$AddressInfoImpl instance) =>
    <String, dynamic>{
      'Match_addr': instance.fullAddress,
      'LongLabel': instance.longLabel,
      'ShortLabel': instance.shortLabel,
      'Addr_type': instance.addressType,
      'Type': instance.type,
      'PlaceName': instance.placeName,
      'AddNum': instance.addressNumber,
      'Address': instance.streetName,
      'Block': instance.block,
      'Sector': instance.sector,
      'Neighborhood': instance.neighborhood,
      'District': instance.district,
      'City': instance.city,
      'MetroArea': instance.metroArea,
      'Subregion': instance.subregion,
      'Region': instance.region,
      'Territory': instance.territory,
      'Postal': instance.postalCode,
      'PostalExt': instance.postalExtension,
      'CntryName': instance.countryName,
      'CountryCode': instance.countryCode,
    };

_$LocationPointImpl _$$LocationPointImplFromJson(Map<String, dynamic> json) =>
    _$LocationPointImpl(
      longitude: (json['x'] as num).toDouble(),
      latitude: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationPointImplToJson(_$LocationPointImpl instance) =>
    <String, dynamic>{
      'x': instance.longitude,
      'y': instance.latitude,
    };
