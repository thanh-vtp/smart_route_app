import 'package:freezed_annotation/freezed_annotation.dart';

part 'routing_models.freezed.dart';
part 'routing_models.g.dart';

@freezed
class RouteResponse with _$RouteResponse {
  const factory RouteResponse({
    @JsonKey(name: 'routes') required RouteFeaturesResult routes,
    @JsonKey(name: 'directions')
    @Default([])
    List<RouteDirectionSet> directions,
  }) = _RouteResponse;

  factory RouteResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseFromJson(json);
}

@freezed
class RouteDirectionSet with _$RouteDirectionSet {
  const factory RouteDirectionSet({
    @JsonKey(name: 'routeId') int? routeId,
    @JsonKey(name: 'routeName') String? routeName,
    @JsonKey(name: 'summary') RouteDirectionSummary? summary,
    @JsonKey(name: 'features')
    @Default([])
    List<RouteDirectionFeature> features,
  }) = _RouteDirectionSet;

  factory RouteDirectionSet.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionSetFromJson(json);
}

@freezed
class RouteDirectionSummary with _$RouteDirectionSummary {
  const factory RouteDirectionSummary({
    @JsonKey(name: 'totalLength') double? totalLength,
    @JsonKey(name: 'totalTime') double? totalTime,
    @JsonKey(name: 'totalDriveTime') double? totalDriveTime,
  }) = _RouteDirectionSummary;

  factory RouteDirectionSummary.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionSummaryFromJson(json);
}

@freezed
class RouteDirectionFeature with _$RouteDirectionFeature {
  const factory RouteDirectionFeature({
    @JsonKey(name: 'attributes') required RouteDirectionAttributes attributes,
    @JsonKey(name: 'strings') @Default([]) List<RouteDirectionString> strings,
  }) = _RouteDirectionFeature;

  factory RouteDirectionFeature.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionFeatureFromJson(json);
}

@freezed
class RouteDirectionAttributes with _$RouteDirectionAttributes {
  const factory RouteDirectionAttributes({
    @JsonKey(name: 'length') @Default(0) double length,
    @JsonKey(name: 'time') @Default(0) double time,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'maneuverType') String? maneuverType,
  }) = _RouteDirectionAttributes;

  factory RouteDirectionAttributes.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionAttributesFromJson(json);
}

@freezed
class RouteDirectionString with _$RouteDirectionString {
  const factory RouteDirectionString({
    @JsonKey(name: 'string') String? string,
    @JsonKey(name: 'stringType') String? stringType,
  }) = _RouteDirectionString;

  factory RouteDirectionString.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionStringFromJson(json);
}

@freezed
class RouteFeaturesResult with _$RouteFeaturesResult {
  const factory RouteFeaturesResult({
    @JsonKey(name: 'features') required List<RouteFeature> features,
  }) = _RouteFeaturesResult;

  factory RouteFeaturesResult.fromJson(Map<String, dynamic> json) =>
      _$RouteFeaturesResultFromJson(json);
}

@freezed
class RouteFeature with _$RouteFeature {
  const factory RouteFeature({
    @JsonKey(name: 'attributes') required RouteAttributes attributes,
    @JsonKey(name: 'geometry') required RouteGeometry geometry,
  }) = _RouteFeature;

  factory RouteFeature.fromJson(Map<String, dynamic> json) =>
      _$RouteFeatureFromJson(json);
}

@freezed
class RouteAttributes with _$RouteAttributes {
  const factory RouteAttributes({
    @JsonKey(name: 'ObjectID') int? objectId,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'FirstStopID') int? firstStopId,
    @JsonKey(name: 'LastStopID') int? lastStopId,
    @JsonKey(name: 'StopCount') int? stopCount,
    @JsonKey(name: 'Total_TravelTime') double? totalTime,
    @JsonKey(name: 'Total_Kilometers') double? totalKilometers,
    @JsonKey(name: 'Total_Miles') double? totalMiles,
    @JsonKey(name: 'Shape_Length') double? shapeLength,
  }) = _RouteAttributes;

  factory RouteAttributes.fromJson(Map<String, dynamic> json) =>
      _$RouteAttributesFromJson(json);
}

@freezed
class RouteGeometry with _$RouteGeometry {
  const factory RouteGeometry({
    @JsonKey(name: 'paths') required List<List<List<double>>> paths,
  }) = _RouteGeometry;

  factory RouteGeometry.fromJson(Map<String, dynamic> json) =>
      _$RouteGeometryFromJson(json);
}
