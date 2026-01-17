// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_barriers_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteBarriersResultImpl _$$RouteBarriersResultImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteBarriersResultImpl(
      features: (json['features'] as List<dynamic>)
          .map((e) => RouteBarrierFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RouteBarriersResultImplToJson(
        _$RouteBarriersResultImpl instance) =>
    <String, dynamic>{
      'features': instance.features,
    };

_$RouteBarrierFeatureImpl _$$RouteBarrierFeatureImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteBarrierFeatureImpl(
      geometry:
          RoutePointGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
      attributes: json['attributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$RouteBarrierFeatureImplToJson(
        _$RouteBarrierFeatureImpl instance) =>
    <String, dynamic>{
      'geometry': instance.geometry,
      'attributes': instance.attributes,
    };

_$RoutePointGeometryImpl _$$RoutePointGeometryImplFromJson(
        Map<String, dynamic> json) =>
    _$RoutePointGeometryImpl(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RoutePointGeometryImplToJson(
        _$RoutePointGeometryImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
