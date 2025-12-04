import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_info.freezed.dart';

// freezed: 3.2.3
// dart run build_runner build --delete-conflicting-outputs

/// Entity đại diện cho 1 lộ trình
@freezed
class RouteInfo with _$RouteInfo {
  const factory RouteInfo({
    required List<ArcGISPoint> geometry, // danh sách các điểm trên tuyến đường
    required double totalLengthKm,
    required double travelTimeMinutes,
  }) = _RouteInfo;
}
