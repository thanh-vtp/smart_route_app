// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routing_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
