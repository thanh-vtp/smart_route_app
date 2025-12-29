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

_$RouteResponseImpl _$$RouteResponseImplFromJson(Map<String, dynamic> json) =>
    _$RouteResponseImpl(
      routes:
          RouteFeaturesResult.fromJson(json['routes'] as Map<String, dynamic>),
      directions: (json['directions'] as List<dynamic>?)
              ?.map(
                  (e) => RouteDirectionSet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RouteResponseImplToJson(_$RouteResponseImpl instance) =>
    <String, dynamic>{
      'routes': instance.routes,
      'directions': instance.directions,
    };

_$RouteDirectionSetImpl _$$RouteDirectionSetImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteDirectionSetImpl(
      routeId: (json['routeId'] as num?)?.toInt(),
      routeName: json['routeName'] as String?,
      summary: json['summary'] == null
          ? null
          : RouteDirectionSummary.fromJson(
              json['summary'] as Map<String, dynamic>),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) =>
                  RouteDirectionFeature.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RouteDirectionSetImplToJson(
        _$RouteDirectionSetImpl instance) =>
    <String, dynamic>{
      'routeId': instance.routeId,
      'routeName': instance.routeName,
      'summary': instance.summary,
      'features': instance.features,
    };

_$RouteDirectionSummaryImpl _$$RouteDirectionSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteDirectionSummaryImpl(
      totalLength: (json['totalLength'] as num?)?.toDouble(),
      totalTime: (json['totalTime'] as num?)?.toDouble(),
      totalDriveTime: (json['totalDriveTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RouteDirectionSummaryImplToJson(
        _$RouteDirectionSummaryImpl instance) =>
    <String, dynamic>{
      'totalLength': instance.totalLength,
      'totalTime': instance.totalTime,
      'totalDriveTime': instance.totalDriveTime,
    };

_$RouteDirectionFeatureImpl _$$RouteDirectionFeatureImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteDirectionFeatureImpl(
      attributes: RouteDirectionAttributes.fromJson(
          json['attributes'] as Map<String, dynamic>),
      strings: (json['strings'] as List<dynamic>?)
              ?.map((e) =>
                  RouteDirectionString.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RouteDirectionFeatureImplToJson(
        _$RouteDirectionFeatureImpl instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'strings': instance.strings,
    };

_$RouteDirectionAttributesImpl _$$RouteDirectionAttributesImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteDirectionAttributesImpl(
      length: (json['length'] as num?)?.toDouble() ?? 0,
      time: (json['time'] as num?)?.toDouble() ?? 0,
      text: json['text'] as String?,
      maneuverType: json['maneuverType'] as String?,
    );

Map<String, dynamic> _$$RouteDirectionAttributesImplToJson(
        _$RouteDirectionAttributesImpl instance) =>
    <String, dynamic>{
      'length': instance.length,
      'time': instance.time,
      'text': instance.text,
      'maneuverType': instance.maneuverType,
    };

_$RouteDirectionStringImpl _$$RouteDirectionStringImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteDirectionStringImpl(
      string: json['string'] as String?,
      stringType: json['stringType'] as String?,
    );

Map<String, dynamic> _$$RouteDirectionStringImplToJson(
        _$RouteDirectionStringImpl instance) =>
    <String, dynamic>{
      'string': instance.string,
      'stringType': instance.stringType,
    };

_$RouteFeaturesResultImpl _$$RouteFeaturesResultImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteFeaturesResultImpl(
      features: (json['features'] as List<dynamic>)
          .map((e) => RouteFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RouteFeaturesResultImplToJson(
        _$RouteFeaturesResultImpl instance) =>
    <String, dynamic>{
      'features': instance.features,
    };

_$RouteFeatureImpl _$$RouteFeatureImplFromJson(Map<String, dynamic> json) =>
    _$RouteFeatureImpl(
      attributes:
          RouteAttributes.fromJson(json['attributes'] as Map<String, dynamic>),
      geometry:
          RouteGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RouteFeatureImplToJson(_$RouteFeatureImpl instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'geometry': instance.geometry,
    };

_$RouteAttributesImpl _$$RouteAttributesImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteAttributesImpl(
      objectId: (json['ObjectID'] as num?)?.toInt(),
      name: json['Name'] as String?,
      firstStopId: (json['FirstStopID'] as num?)?.toInt(),
      lastStopId: (json['LastStopID'] as num?)?.toInt(),
      stopCount: (json['StopCount'] as num?)?.toInt(),
      totalTime: (json['Total_TravelTime'] as num?)?.toDouble(),
      totalKilometers: (json['Total_Kilometers'] as num?)?.toDouble(),
      totalMiles: (json['Total_Miles'] as num?)?.toDouble(),
      shapeLength: (json['Shape_Length'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RouteAttributesImplToJson(
        _$RouteAttributesImpl instance) =>
    <String, dynamic>{
      'ObjectID': instance.objectId,
      'Name': instance.name,
      'FirstStopID': instance.firstStopId,
      'LastStopID': instance.lastStopId,
      'StopCount': instance.stopCount,
      'Total_TravelTime': instance.totalTime,
      'Total_Kilometers': instance.totalKilometers,
      'Total_Miles': instance.totalMiles,
      'Shape_Length': instance.shapeLength,
    };

_$RouteGeometryImpl _$$RouteGeometryImplFromJson(Map<String, dynamic> json) =>
    _$RouteGeometryImpl(
      paths: (json['paths'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList())
          .toList(),
    );

Map<String, dynamic> _$$RouteGeometryImplToJson(_$RouteGeometryImpl instance) =>
    <String, dynamic>{
      'paths': instance.paths,
    };

_$ImageryMetadataResponseImpl _$$ImageryMetadataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageryMetadataResponseImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      extent: json['extent'] == null
          ? null
          : ImageryExtent.fromJson(json['extent'] as Map<String, dynamic>),
      pixelSizeX: (json['pixelSizeX'] as num?)?.toDouble(),
      pixelSizeY: (json['pixelSizeY'] as num?)?.toDouble(),
      bandCount: (json['bandCount'] as num?)?.toInt(),
      pixelType: json['pixelType'] as String?,
      minPixelSize: (json['minPixelSize'] as num?)?.toDouble(),
      maxPixelSize: (json['maxPixelSize'] as num?)?.toDouble(),
      copyrightText: json['copyrightText'] as String?,
      serviceDataType: json['serviceDataType'] as String?,
      minValues: (json['minValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      maxValues: (json['maxValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      meanValues: (json['meanValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      stdvValues: (json['stdvValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$ImageryMetadataResponseImplToJson(
        _$ImageryMetadataResponseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'extent': instance.extent,
      'pixelSizeX': instance.pixelSizeX,
      'pixelSizeY': instance.pixelSizeY,
      'bandCount': instance.bandCount,
      'pixelType': instance.pixelType,
      'minPixelSize': instance.minPixelSize,
      'maxPixelSize': instance.maxPixelSize,
      'copyrightText': instance.copyrightText,
      'serviceDataType': instance.serviceDataType,
      'minValues': instance.minValues,
      'maxValues': instance.maxValues,
      'meanValues': instance.meanValues,
      'stdvValues': instance.stdvValues,
    };

_$ImageryExtentImpl _$$ImageryExtentImplFromJson(Map<String, dynamic> json) =>
    _$ImageryExtentImpl(
      xmin: (json['xmin'] as num).toDouble(),
      ymin: (json['ymin'] as num).toDouble(),
      xmax: (json['xmax'] as num).toDouble(),
      ymax: (json['ymax'] as num).toDouble(),
      spatialReference: json['spatialReference'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ImageryExtentImplToJson(_$ImageryExtentImpl instance) =>
    <String, dynamic>{
      'xmin': instance.xmin,
      'ymin': instance.ymin,
      'xmax': instance.xmax,
      'ymax': instance.ymax,
      'spatialReference': instance.spatialReference,
    };
