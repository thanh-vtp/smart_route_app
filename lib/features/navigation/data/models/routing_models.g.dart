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
      messages: json['messages'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$RouteResponseImplToJson(_$RouteResponseImpl instance) =>
    <String, dynamic>{
      'routes': instance.routes,
      'directions': instance.directions,
      'messages': instance.messages,
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
