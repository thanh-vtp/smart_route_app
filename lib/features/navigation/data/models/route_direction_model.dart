import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_direction_model.freezed.dart';
part 'route_direction_model.g.dart';

// Thông tin Dẫn đường
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
    @JsonKey(name: 'envelope') RouteEnvelope? envelope, // Zoom map
  }) = _RouteDirectionSummary;

  factory RouteDirectionSummary.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionSummaryFromJson(json);
}

@freezed
class RouteEnvelope with _$RouteEnvelope {
  const factory RouteEnvelope({
    double? xmin,
    double? ymin,
    double? xmax,
    double? ymax,
    Map<String, dynamic>? spatialReference,
  }) = _RouteEnvelope;

  factory RouteEnvelope.fromJson(Map<String, dynamic> json) =>
      _$RouteEnvelopeFromJson(json);
}

@freezed
class RouteDirectionFeature with _$RouteDirectionFeature {
  const factory RouteDirectionFeature({
    @JsonKey(name: 'attributes') required RouteDirectionAttributes attributes,
    @JsonKey(name: 'strings') @Default([]) List<RouteDirectionString> strings,
    //compressedGeometry (highlight từng đoạn đường)
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
    @JsonKey(name: 'ETA') double? eta, //Thời gian đến
    @JsonKey(name: 'arriveTimeUTC') double? arriveTimeUTC, //Thời gian UTC
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
