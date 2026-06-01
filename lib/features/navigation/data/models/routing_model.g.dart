// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteResponseModelImpl _$$RouteResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteResponseModelImpl(
      routes: RouteFeaturesResultModel.fromJson(
          json['routes'] as Map<String, dynamic>),
      directions: (json['directions'] as List<dynamic>?)
              ?.map((e) =>
                  RouteDirectionSetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RouteResponseModelImplToJson(
        _$RouteResponseModelImpl instance) =>
    <String, dynamic>{
      'routes': instance.routes,
      'directions': instance.directions,
    };

_$RouteFeaturesResultModelImpl _$$RouteFeaturesResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteFeaturesResultModelImpl(
      features: (json['features'] as List<dynamic>?)
              ?.map(
                  (e) => RouteFeatureModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RouteFeaturesResultModelImplToJson(
        _$RouteFeaturesResultModelImpl instance) =>
    <String, dynamic>{
      'features': instance.features,
    };

_$RouteFeatureModelImpl _$$RouteFeatureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteFeatureModelImpl(
      attributes: RouteAttributesModel.fromJson(
          json['attributes'] as Map<String, dynamic>),
      geometry: json['geometry'] == null
          ? null
          : RouteGeometryModel.fromJson(
              json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RouteFeatureModelImplToJson(
        _$RouteFeatureModelImpl instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'geometry': instance.geometry,
    };

_$RouteAttributesModelImpl _$$RouteAttributesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteAttributesModelImpl(
      name: json['Name'] as String?,
      totalTravelTime: (json['Total_TravelTime'] as num?)?.toDouble(),
      totalKilometers: (json['Total_Kilometers'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RouteAttributesModelImplToJson(
        _$RouteAttributesModelImpl instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Total_TravelTime': instance.totalTravelTime,
      'Total_Kilometers': instance.totalKilometers,
    };

_$RouteGeometryModelImpl _$$RouteGeometryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteGeometryModelImpl(
      paths: (json['paths'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => (e as List<dynamic>)
                      .map((e) => (e as num).toDouble())
                      .toList())
                  .toList())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RouteGeometryModelImplToJson(
        _$RouteGeometryModelImpl instance) =>
    <String, dynamic>{
      'paths': instance.paths,
    };

_$RouteDirectionSetModelImpl _$$RouteDirectionSetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteDirectionSetModelImpl(
      summary: json['summary'] == null
          ? null
          : RouteDirectionSummaryModel.fromJson(
              json['summary'] as Map<String, dynamic>),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => RouteDirectionFeatureModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RouteDirectionSetModelImplToJson(
        _$RouteDirectionSetModelImpl instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'features': instance.features,
    };

_$RouteDirectionSummaryModelImpl _$$RouteDirectionSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteDirectionSummaryModelImpl(
      envelope: json['envelope'] == null
          ? null
          : RouteEnvelopeModel.fromJson(
              json['envelope'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RouteDirectionSummaryModelImplToJson(
        _$RouteDirectionSummaryModelImpl instance) =>
    <String, dynamic>{
      'envelope': instance.envelope,
    };

_$RouteEnvelopeModelImpl _$$RouteEnvelopeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteEnvelopeModelImpl(
      xmin: (json['xmin'] as num?)?.toDouble(),
      ymin: (json['ymin'] as num?)?.toDouble(),
      xmax: (json['xmax'] as num?)?.toDouble(),
      ymax: (json['ymax'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RouteEnvelopeModelImplToJson(
        _$RouteEnvelopeModelImpl instance) =>
    <String, dynamic>{
      'xmin': instance.xmin,
      'ymin': instance.ymin,
      'xmax': instance.xmax,
      'ymax': instance.ymax,
    };

_$RouteDirectionFeatureModelImpl _$$RouteDirectionFeatureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteDirectionFeatureModelImpl(
      attributes: RouteDirectionAttributesModel.fromJson(
          json['attributes'] as Map<String, dynamic>),
      strings: (json['strings'] as List<dynamic>?)
              ?.map((e) =>
                  RouteDirectionStringModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RouteDirectionFeatureModelImplToJson(
        _$RouteDirectionFeatureModelImpl instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'strings': instance.strings,
    };

_$RouteDirectionAttributesModelImpl
    _$$RouteDirectionAttributesModelImplFromJson(Map<String, dynamic> json) =>
        _$RouteDirectionAttributesModelImpl(
          length: (json['length'] as num?)?.toDouble() ?? 0,
          time: (json['time'] as num?)?.toDouble() ?? 0,
          text: json['text'] as String?,
          maneuverType: json['maneuverType'] as String?,
        );

Map<String, dynamic> _$$RouteDirectionAttributesModelImplToJson(
        _$RouteDirectionAttributesModelImpl instance) =>
    <String, dynamic>{
      'length': instance.length,
      'time': instance.time,
      'text': instance.text,
      'maneuverType': instance.maneuverType,
    };

_$RouteDirectionStringModelImpl _$$RouteDirectionStringModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteDirectionStringModelImpl(
      string: json['string'] as String?,
      stringType: json['stringType'] as String?,
    );

Map<String, dynamic> _$$RouteDirectionStringModelImplToJson(
        _$RouteDirectionStringModelImpl instance) =>
    <String, dynamic>{
      'string': instance.string,
      'stringType': instance.stringType,
    };
