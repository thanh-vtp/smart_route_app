// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteResponseModel _$RouteResponseModelFromJson(Map<String, dynamic> json) =>
    _RouteResponseModel(
      routes: RouteFeaturesResultModel.fromJson(
        json['routes'] as Map<String, dynamic>,
      ),
      directions:
          (json['directions'] as List<dynamic>?)
              ?.map(
                (e) =>
                    RouteDirectionSetModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RouteResponseModelToJson(_RouteResponseModel instance) =>
    <String, dynamic>{
      'routes': instance.routes,
      'directions': instance.directions,
    };

_RouteFeaturesResultModel _$RouteFeaturesResultModelFromJson(
  Map<String, dynamic> json,
) => _RouteFeaturesResultModel(
  features:
      (json['features'] as List<dynamic>?)
          ?.map((e) => RouteFeatureModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$RouteFeaturesResultModelToJson(
  _RouteFeaturesResultModel instance,
) => <String, dynamic>{'features': instance.features};

_RouteFeatureModel _$RouteFeatureModelFromJson(Map<String, dynamic> json) =>
    _RouteFeatureModel(
      attributes: RouteAttributesModel.fromJson(
        json['attributes'] as Map<String, dynamic>,
      ),
      geometry: json['geometry'] == null
          ? null
          : RouteGeometryModel.fromJson(
              json['geometry'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RouteFeatureModelToJson(_RouteFeatureModel instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'geometry': instance.geometry,
    };

_RouteAttributesModel _$RouteAttributesModelFromJson(
  Map<String, dynamic> json,
) => _RouteAttributesModel(
  name: json['Name'] as String?,
  totalTravelTime: (json['Total_TravelTime'] as num?)?.toDouble(),
  totalKilometers: (json['Total_Kilometers'] as num?)?.toDouble(),
);

Map<String, dynamic> _$RouteAttributesModelToJson(
  _RouteAttributesModel instance,
) => <String, dynamic>{
  'Name': instance.name,
  'Total_TravelTime': instance.totalTravelTime,
  'Total_Kilometers': instance.totalKilometers,
};

_RouteGeometryModel _$RouteGeometryModelFromJson(Map<String, dynamic> json) =>
    _RouteGeometryModel(
      paths:
          (json['paths'] as List<dynamic>?)
              ?.map(
                (e) => (e as List<dynamic>)
                    .map(
                      (e) => (e as List<dynamic>)
                          .map((e) => (e as num).toDouble())
                          .toList(),
                    )
                    .toList(),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RouteGeometryModelToJson(_RouteGeometryModel instance) =>
    <String, dynamic>{'paths': instance.paths};

_RouteDirectionSetModel _$RouteDirectionSetModelFromJson(
  Map<String, dynamic> json,
) => _RouteDirectionSetModel(
  summary: json['summary'] == null
      ? null
      : RouteDirectionSummaryModel.fromJson(
          json['summary'] as Map<String, dynamic>,
        ),
  features:
      (json['features'] as List<dynamic>?)
          ?.map(
            (e) =>
                RouteDirectionFeatureModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$RouteDirectionSetModelToJson(
  _RouteDirectionSetModel instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'features': instance.features,
};

_RouteDirectionSummaryModel _$RouteDirectionSummaryModelFromJson(
  Map<String, dynamic> json,
) => _RouteDirectionSummaryModel(
  envelope: json['envelope'] == null
      ? null
      : RouteEnvelopeModel.fromJson(json['envelope'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RouteDirectionSummaryModelToJson(
  _RouteDirectionSummaryModel instance,
) => <String, dynamic>{'envelope': instance.envelope};

_RouteEnvelopeModel _$RouteEnvelopeModelFromJson(Map<String, dynamic> json) =>
    _RouteEnvelopeModel(
      xmin: (json['xmin'] as num?)?.toDouble(),
      ymin: (json['ymin'] as num?)?.toDouble(),
      xmax: (json['xmax'] as num?)?.toDouble(),
      ymax: (json['ymax'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RouteEnvelopeModelToJson(_RouteEnvelopeModel instance) =>
    <String, dynamic>{
      'xmin': instance.xmin,
      'ymin': instance.ymin,
      'xmax': instance.xmax,
      'ymax': instance.ymax,
    };

_RouteDirectionFeatureModel _$RouteDirectionFeatureModelFromJson(
  Map<String, dynamic> json,
) => _RouteDirectionFeatureModel(
  attributes: RouteDirectionAttributesModel.fromJson(
    json['attributes'] as Map<String, dynamic>,
  ),
  strings:
      (json['strings'] as List<dynamic>?)
          ?.map(
            (e) =>
                RouteDirectionStringModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$RouteDirectionFeatureModelToJson(
  _RouteDirectionFeatureModel instance,
) => <String, dynamic>{
  'attributes': instance.attributes,
  'strings': instance.strings,
};

_RouteDirectionAttributesModel _$RouteDirectionAttributesModelFromJson(
  Map<String, dynamic> json,
) => _RouteDirectionAttributesModel(
  length: (json['length'] as num?)?.toDouble() ?? 0,
  time: (json['time'] as num?)?.toDouble() ?? 0,
  text: json['text'] as String?,
  maneuverType: json['maneuverType'] as String?,
);

Map<String, dynamic> _$RouteDirectionAttributesModelToJson(
  _RouteDirectionAttributesModel instance,
) => <String, dynamic>{
  'length': instance.length,
  'time': instance.time,
  'text': instance.text,
  'maneuverType': instance.maneuverType,
};

_RouteDirectionStringModel _$RouteDirectionStringModelFromJson(
  Map<String, dynamic> json,
) => _RouteDirectionStringModel(
  string: json['string'] as String?,
  stringType: json['stringType'] as String?,
);

Map<String, dynamic> _$RouteDirectionStringModelToJson(
  _RouteDirectionStringModel instance,
) => <String, dynamic>{
  'string': instance.string,
  'stringType': instance.stringType,
};
