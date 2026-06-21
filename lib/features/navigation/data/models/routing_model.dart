import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/common/app_logger.dart';
import '../../domain/entities/route_entity.dart';

part 'routing_model.freezed.dart';
part 'routing_model.g.dart';

@freezed
class RouteResponseModel with _$RouteResponseModel {
  const RouteResponseModel._();

  const factory RouteResponseModel({
    @JsonKey(name: 'routes') required RouteFeaturesResultModel routes,
    @JsonKey(name: 'directions')
    @Default([])
    List<RouteDirectionSetModel> directions,
  }) = _RouteResponseModel;

  factory RouteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseModelFromJson(json);

  RouteResult toEntity() {
    final routeFeature = routes.features.first;
    final attrs = routeFeature.attributes;

    // Log raw attributes
    AppLogger.debugRaw(
      'Route attributes: '
      'name=${attrs.name}, '
      'totalKilometers=${attrs.totalKilometers}, '
      'totalTravelTime=${attrs.totalTravelTime}',
      source: 'RouteResponseModel',
    );

    // 1. Bóc tách Polyline (Đường xanh trên Map)
    final routePoints = <RoutePoint>[];
    if (routeFeature.geometry != null &&
        routeFeature.geometry!.paths.isNotEmpty) {
      // ArcGIS trả về paths dạng 3D array: [ [ [lng, lat, m], [lng, lat, m] ] ]
      for (final path in routeFeature.geometry!.paths) {
        for (final point in path) {
          if (point.length >= 2) {
            routePoints.add(
              RoutePoint(lng: point[0], lat: point[1]),
            ); // Chú ý [0] là lng, [1] là lat
          }
        }
      }
    }

    // 2. Bóc tách Danh sách rẽ (Directions)
    final parsedDirections = <RouteDirection>[];
    RouteBoundingBox? boundingBox;

    if (directions.isNotEmpty) {
      final directionSet = directions.first;

      // Lấy Bounding Box để Zoom map
      if (directionSet.summary?.envelope != null) {
        final env = directionSet.summary!.envelope!;
        if (env.xmin != null &&
            env.ymin != null &&
            env.xmax != null &&
            env.ymax != null) {
          boundingBox = RouteBoundingBox(
            xMin: env.xmin!,
            yMin: env.ymin!,
            xMax: env.xmax!,
            yMax: env.ymax!,
          );
        }
      }

      // Xử lý từng bước rẽ
      for (final dirFeature in directionSet.features) {
        final dirAttrs = dirFeature.attributes;

        // Tìm tên đường
        String? streetName;
        for (final str in dirFeature.strings) {
          if (str.stringType == 'esriDSTStreetName') {
            streetName = str.string;
            break;
          }
        }

        parsedDirections.add(
          RouteDirection(
            instruction: dirAttrs.text ?? '',
            // Chú ý: Cấu hình API ta sẽ ép trả về mét (esriNAUMeters), nên giữ nguyên dirAttrs.length
            distanceMeters: dirAttrs.length,
            timeMinutes: dirAttrs.time,
            maneuverType: _parseManeuverType(dirAttrs.maneuverType ?? ''),
            streetName: streetName,
          ),
        );
      }
    }

    return RouteResult(
      routeName: attrs.name ?? 'Tuyến đường thông minh',
      totalDistanceMeters:
          (attrs.totalKilometers ?? 0.0) * 1000, // Đổi sang mét
      totalTimeMinutes: attrs.totalTravelTime ?? 0.0,
      polylinePoints: routePoints,
      directions: parsedDirections,
      boundingBox: boundingBox,
    );
  }

  // Helper chuyển đổi chữ của ArcGIS sang Enum của App
  ManeuverType _parseManeuverType(String type) {
    switch (type) {
      case 'esriDMTDepart':
        return ManeuverType.depart;
      case 'esriDMTStraight':
        return ManeuverType.straight;
      case 'esriDMTTurnLeft':
        return ManeuverType.turnLeft;
      case 'esriDMTTurnRight':
        return ManeuverType.turnRight;
      case 'esriDMTSharpLeft':
        return ManeuverType.sharpLeft;
      case 'esriDMTSharpRight':
        return ManeuverType.sharpRight;
      case 'esriDMTBearLeft':
        return ManeuverType.bearLeft;
      case 'esriDMTBearRight':
        return ManeuverType.bearRight;
      case 'esriDMTUTurn':
        return ManeuverType.uTurn;
      case 'esriDMTRoundabout':
        return ManeuverType.roundabout;
      case 'esriDMTRampRight':
      case 'esriDMTRampLeft':
        return ManeuverType.ramp;
      case 'esriDMTForkRight':
      case 'esriDMTForkLeft':
      case 'esriDMTForkCenter':
        return ManeuverType.fork;
      case 'esriDMTMerge':
        return ManeuverType.merge;
      case 'esriDMTStop':
        return ManeuverType.stop;
      default:
        return ManeuverType.unknown;
    }
  }
}

// --- CÁC CLASS MODEL PHỤ TRỢ (Để map JSON lồng nhau) ---

@freezed
class RouteFeaturesResultModel with _$RouteFeaturesResultModel {
  const factory RouteFeaturesResultModel({
    @JsonKey(name: 'features') @Default([]) List<RouteFeatureModel> features,
  }) = _RouteFeaturesResultModel;
  factory RouteFeaturesResultModel.fromJson(Map<String, dynamic> json) =>
      _$RouteFeaturesResultModelFromJson(json);
}

@freezed
class RouteFeatureModel with _$RouteFeatureModel {
  const factory RouteFeatureModel({
    @JsonKey(name: 'attributes') required RouteAttributesModel attributes,
    @JsonKey(name: 'geometry') RouteGeometryModel? geometry,
  }) = _RouteFeatureModel;
  factory RouteFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$RouteFeatureModelFromJson(json);
}

@freezed
class RouteAttributesModel with _$RouteAttributesModel {
  const factory RouteAttributesModel({
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Total_TravelTime') double? totalTravelTime,
    @JsonKey(name: 'Total_Kilometers') double? totalKilometers,
  }) = _RouteAttributesModel;
  factory RouteAttributesModel.fromJson(Map<String, dynamic> json) =>
      _$RouteAttributesModelFromJson(json);
}

@freezed
class RouteGeometryModel with _$RouteGeometryModel {
  const factory RouteGeometryModel({
    // Type List<List<List<double>>> dùng để map cái mảng paths phức tạp của ArcGIS
    @JsonKey(name: 'paths') @Default([]) List<List<List<double>>> paths,
  }) = _RouteGeometryModel;
  factory RouteGeometryModel.fromJson(Map<String, dynamic> json) =>
      _$RouteGeometryModelFromJson(json);
}

@freezed
class RouteDirectionSetModel with _$RouteDirectionSetModel {
  const factory RouteDirectionSetModel({
    @JsonKey(name: 'summary') RouteDirectionSummaryModel? summary,
    @JsonKey(name: 'features')
    @Default([])
    List<RouteDirectionFeatureModel> features,
  }) = _RouteDirectionSetModel;
  factory RouteDirectionSetModel.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionSetModelFromJson(json);
}

@freezed
class RouteDirectionSummaryModel with _$RouteDirectionSummaryModel {
  const factory RouteDirectionSummaryModel({
    @JsonKey(name: 'envelope') RouteEnvelopeModel? envelope,
  }) = _RouteDirectionSummaryModel;
  factory RouteDirectionSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionSummaryModelFromJson(json);
}

@freezed
class RouteEnvelopeModel with _$RouteEnvelopeModel {
  const factory RouteEnvelopeModel({
    double? xmin,
    double? ymin,
    double? xmax,
    double? ymax,
  }) = _RouteEnvelopeModel;
  factory RouteEnvelopeModel.fromJson(Map<String, dynamic> json) =>
      _$RouteEnvelopeModelFromJson(json);
}

@freezed
class RouteDirectionFeatureModel with _$RouteDirectionFeatureModel {
  const factory RouteDirectionFeatureModel({
    @JsonKey(name: 'attributes')
    required RouteDirectionAttributesModel attributes,
    @JsonKey(name: 'strings')
    @Default([])
    List<RouteDirectionStringModel> strings,
  }) = _RouteDirectionFeatureModel;
  factory RouteDirectionFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionFeatureModelFromJson(json);
}

@freezed
class RouteDirectionAttributesModel with _$RouteDirectionAttributesModel {
  const factory RouteDirectionAttributesModel({
    @JsonKey(name: 'length') @Default(0) double length,
    @JsonKey(name: 'time') @Default(0) double time,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'maneuverType') String? maneuverType,
  }) = _RouteDirectionAttributesModel;
  factory RouteDirectionAttributesModel.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionAttributesModelFromJson(json);
}

@freezed
class RouteDirectionStringModel with _$RouteDirectionStringModel {
  const factory RouteDirectionStringModel({
    @JsonKey(name: 'string') String? string,
    @JsonKey(name: 'stringType') String? stringType,
  }) = _RouteDirectionStringModel;
  factory RouteDirectionStringModel.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionStringModelFromJson(json);
}
