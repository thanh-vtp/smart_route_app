// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_direction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      envelope: json['envelope'] == null
          ? null
          : RouteEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RouteDirectionSummaryImplToJson(
        _$RouteDirectionSummaryImpl instance) =>
    <String, dynamic>{
      'totalLength': instance.totalLength,
      'totalTime': instance.totalTime,
      'totalDriveTime': instance.totalDriveTime,
      'envelope': instance.envelope,
    };

_$RouteEnvelopeImpl _$$RouteEnvelopeImplFromJson(Map<String, dynamic> json) =>
    _$RouteEnvelopeImpl(
      xmin: (json['xmin'] as num?)?.toDouble(),
      ymin: (json['ymin'] as num?)?.toDouble(),
      xmax: (json['xmax'] as num?)?.toDouble(),
      ymax: (json['ymax'] as num?)?.toDouble(),
      spatialReference: json['spatialReference'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$RouteEnvelopeImplToJson(_$RouteEnvelopeImpl instance) =>
    <String, dynamic>{
      'xmin': instance.xmin,
      'ymin': instance.ymin,
      'xmax': instance.xmax,
      'ymax': instance.ymax,
      'spatialReference': instance.spatialReference,
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
      compressedGeometry: json['compressedGeometry'] as String?,
    );

Map<String, dynamic> _$$RouteDirectionFeatureImplToJson(
        _$RouteDirectionFeatureImpl instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'strings': instance.strings,
      'compressedGeometry': instance.compressedGeometry,
    };

_$RouteDirectionAttributesImpl _$$RouteDirectionAttributesImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteDirectionAttributesImpl(
      length: (json['length'] as num?)?.toDouble() ?? 0,
      time: (json['time'] as num?)?.toDouble() ?? 0,
      text: json['text'] as String?,
      maneuverType: json['maneuverType'] as String?,
      eta: (json['ETA'] as num?)?.toDouble(),
      arriveTimeUTC: (json['arriveTimeUTC'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RouteDirectionAttributesImplToJson(
        _$RouteDirectionAttributesImpl instance) =>
    <String, dynamic>{
      'length': instance.length,
      'time': instance.time,
      'text': instance.text,
      'maneuverType': instance.maneuverType,
      'ETA': instance.eta,
      'arriveTimeUTC': instance.arriveTimeUTC,
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
