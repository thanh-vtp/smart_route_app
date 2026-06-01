import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'route_entity.freezed.dart';

// ====================================================================
// 1. KẾT QUẢ TUYẾN ĐƯỜNG CHÍNH (Đưa thẳng lên UI)
// ====================================================================
@freezed
class RouteResult with _$RouteResult {
  const RouteResult._(); // Private constructor để viết custom getters

  const factory RouteResult({
    required String routeName,
    required double totalDistanceMeters,
    required double totalTimeMinutes,
    required List<RoutePoint>
    polylinePoints, // Để vẽ đường Line màu xanh trên map
    required List<RouteDirection> directions, // Danh sách từng bước chỉ đường
    RouteBoundingBox? boundingBox, // Giúp Map tự động Zoom vừa vặn tuyến đường
  }) = _RouteResult;

  // --- Helper cho UI ---
  // Format tổng khoảng cách
  String get formattedDistance {
    final km = totalDistanceMeters / 1000;
    if (km < 1) return '${totalDistanceMeters.toStringAsFixed(0)} m';
    return '${km.toStringAsFixed(1)} km';
  }

  // Format tổng thời gian
  String get formattedTime {
    if (totalTimeMinutes < 1) return '< 1 phút';
    if (totalTimeMinutes < 60) {
      return '${totalTimeMinutes.toStringAsFixed(0)} phút';
    }
    final hours = (totalTimeMinutes / 60).floor();
    final mins = (totalTimeMinutes % 60).round();
    return mins == 0 ? '$hours giờ' : '$hours giờ $mins phút';
  }

  // Dự kiến thời gian đến (ETA)
  String get estimatedArrival {
    final arrival = DateTime.now().add(
      Duration(minutes: totalTimeMinutes.round()),
    );
    return '${arrival.hour.toString().padLeft(2, '0')}:${arrival.minute.toString().padLeft(2, '0')}';
  }
}

// ====================================================================
// 2. TỌA ĐỘ TỪNG ĐIỂM (Dùng để vẽ Polyline)
// ====================================================================
@freezed
class RoutePoint with _$RoutePoint {
  const factory RoutePoint({required double lat, required double lng}) =
      _RoutePoint;
}

// ====================================================================
// 3. KHUNG ZOOM BẢN ĐỒ
// ====================================================================
@freezed
class RouteBoundingBox with _$RouteBoundingBox {
  const factory RouteBoundingBox({
    required double xMin,
    required double yMin,
    required double xMax,
    required double yMax,
  }) = _RouteBoundingBox;
}

// ====================================================================
// 4. CHI TIẾT TỪNG BƯỚC RẼ (Navigation Instructions)
// ====================================================================
@freezed
class RouteDirection with _$RouteDirection {
  const RouteDirection._();

  const factory RouteDirection({
    required String instruction,
    required double distanceMeters,
    required double timeMinutes,
    required ManeuverType maneuverType,
    String? streetName,
  }) = _RouteDirection;

  // Format khoảng cách cho từng bước chỉ đường
  String get formattedDistance {
    if (distanceMeters < 1000) return '${distanceMeters.toStringAsFixed(0)} m';
    return '${(distanceMeters / 1000).toStringAsFixed(1)} km';
  }
}

// ====================================================================
// 5. ENUM CHỈ ĐƯỜNG (Có sẵn Icon và Màu sắc cho UI)
// ====================================================================
enum ManeuverType {
  depart,
  straight,
  turnLeft,
  turnRight,
  sharpLeft,
  sharpRight,
  bearLeft,
  bearRight,
  uTurn,
  roundabout,
  ramp,
  fork,
  merge,
  stop,
  unknown;

  IconData get icon {
    switch (this) {
      case ManeuverType.depart:
        return Icons.trip_origin;
      case ManeuverType.straight:
        return Icons.arrow_upward_rounded;
      case ManeuverType.turnLeft:
      case ManeuverType.sharpLeft:
        return Icons.turn_left_rounded;
      case ManeuverType.turnRight:
      case ManeuverType.sharpRight:
        return Icons.turn_right_rounded;
      case ManeuverType.bearLeft:
        return Icons.turn_slight_left_rounded;
      case ManeuverType.bearRight:
        return Icons.turn_slight_right_rounded;
      case ManeuverType.uTurn:
        return Icons.u_turn_left_rounded;
      case ManeuverType.roundabout:
        return Icons.roundabout_left_rounded;
      case ManeuverType.stop:
        return Icons.location_on;
      default:
        return Icons.directions;
    }
  }

  Color get color {
    switch (this) {
      case ManeuverType.depart:
        return Colors.green;
      case ManeuverType.stop:
        return Colors.red;
      case ManeuverType.straight:
        return Colors.blue;
      default:
        return Colors.orange;
    }
  }
}
