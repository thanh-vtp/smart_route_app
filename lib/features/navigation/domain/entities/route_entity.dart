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
// 5. NAVIGATION SESSION (Trạng thái điều hướng thời gian thực)
// ====================================================================
class NavigationSession {
  /// Route đang được dẫn đường
  final RouteResult route;

  /// Điểm đến cuối cùng (dùng khi re-route)
  final RoutePoint destination;

  /// Index bước chỉ đường hiện tại trong route.directions
  final int currentDirectionIndex;

  /// Khoảng cách còn lại đến đích (mét)
  final double remainingDistanceMeters;

  /// Thời gian còn lại (phút)
  final double remainingTimeMinutes;

  /// Người dùng có đang lệch tuyến không
  final bool isOffRoute;

  /// Đang tính lại route
  final bool isRerouting;

  const NavigationSession({
    required this.route,
    required this.destination,
    this.currentDirectionIndex = 0,
    this.remainingDistanceMeters = 0,
    this.remainingTimeMinutes = 0,
    this.isOffRoute = false,
    this.isRerouting = false,
  });

  NavigationSession copyWith({
    RouteResult? route,
    RoutePoint? destination,
    int? currentDirectionIndex,
    double? remainingDistanceMeters,
    double? remainingTimeMinutes,
    bool? isOffRoute,
    bool? isRerouting,
  }) {
    return NavigationSession(
      route: route ?? this.route,
      destination: destination ?? this.destination,
      currentDirectionIndex:
          currentDirectionIndex ?? this.currentDirectionIndex,
      remainingDistanceMeters:
          remainingDistanceMeters ?? this.remainingDistanceMeters,
      remainingTimeMinutes: remainingTimeMinutes ?? this.remainingTimeMinutes,
      isOffRoute: isOffRoute ?? this.isOffRoute,
      isRerouting: isRerouting ?? this.isRerouting,
    );
  }

  /// Bước chỉ đường hiện tại
  RouteDirection? get currentDirection {
    final dirs = route.directions;
    if (currentDirectionIndex < dirs.length) {
      return dirs[currentDirectionIndex];
    }
    return null;
  }

  /// Bước chỉ đường tiếp theo
  RouteDirection? get nextDirection {
    final dirs = route.directions;
    final nextIndex = currentDirectionIndex + 1;
    if (nextIndex < dirs.length) return dirs[nextIndex];
    return null;
  }

  /// Format khoảng cách còn lại
  String get formattedRemainingDistance {
    if (remainingDistanceMeters < 1000) {
      return '${remainingDistanceMeters.toStringAsFixed(0)} m';
    }
    return '${(remainingDistanceMeters / 1000).toStringAsFixed(1)} km';
  }

  /// Format thời gian còn lại
  String get formattedRemainingTime {
    if (remainingTimeMinutes < 1) return '< 1 phút';
    if (remainingTimeMinutes < 60) {
      return '${remainingTimeMinutes.toStringAsFixed(0)} phút';
    }
    final hours = (remainingTimeMinutes / 60).floor();
    final mins = (remainingTimeMinutes % 60).round();
    return mins == 0 ? '$hours giờ' : '$hours giờ $mins phút';
  }

  /// ETA dựa trên remainingTimeMinutes
  String get estimatedArrival {
    final arrival = DateTime.now().add(
      Duration(minutes: remainingTimeMinutes.round()),
    );
    return '${arrival.hour.toString().padLeft(2, '0')}:${arrival.minute.toString().padLeft(2, '0')}';
  }
}

// ====================================================================
// 5. ROUTE STRATEGY (Chiến lược tìm đường)
// ====================================================================
enum RouteStrategy {
  fastest, // Nhanh nhất (Tối ưu theo thời gian)
  shortest, // Ngắn nhất (Tối ưu theo quãng đường)
  balanced; // Cân bằng (Default - tránh sự cố)

  String get name {
    switch (this) {
      case RouteStrategy.fastest:
        return 'Nhanh nhất';
      case RouteStrategy.shortest:
        return 'Ngắn nhất';
      case RouteStrategy.balanced:
        return 'Cân bằng';
    }
  }

  String get description {
    switch (this) {
      case RouteStrategy.fastest:
        return 'Tối ưu thời gian di chuyển';
      case RouteStrategy.shortest:
        return 'Tối ưu quãng đường';
      case RouteStrategy.balanced:
        return 'Cân bằng thời gian và quãng đường, tránh sự cố';
    }
  }

  String get impedanceAttribute {
    switch (this) {
      case RouteStrategy.fastest:
        return 'TravelTime';
      case RouteStrategy.shortest:
        return 'Kilometers';
      case RouteStrategy.balanced:
        return 'TravelTime'; // Default with incident avoidance
    }
  }
}

// ====================================================================
// 6. ALTERNATIVE ROUTES RESULT (Kết quả nhiều lộ trình)
// ====================================================================
@freezed
class AlternativeRoutesResult with _$AlternativeRoutesResult {
  const AlternativeRoutesResult._();

  const factory AlternativeRoutesResult({
    required RouteResult
    recommendedRoute, // Route được đề xuất (thường là balanced)
    required List<RouteAlternative> alternatives, // Các route thay thế
  }) = _AlternativeRoutesResult;

  // Tổng số routes có sẵn
  int get totalRoutes => 1 + alternatives.length;
}

// ====================================================================
// 7. ROUTE ALTERNATIVE (Mỗi lộ trình thay thế)
// ====================================================================
@freezed
class RouteAlternative with _$RouteAlternative {
  const RouteAlternative._();

  const factory RouteAlternative({
    required RouteStrategy strategy,
    required RouteResult route,
    String? comparisonNote, // So sánh với recommended route
  }) = _RouteAlternative;

  // So sánh với route chính
  String getComparisonWith(RouteResult mainRoute) {
    final timeDiff = route.totalTimeMinutes - mainRoute.totalTimeMinutes;
    final distDiff = route.totalDistanceMeters - mainRoute.totalDistanceMeters;

    if (timeDiff.abs() < 1 && distDiff.abs() < 100) {
      return 'Tương đương';
    }

    final List<String> parts = [];

    if (timeDiff > 0) {
      parts.add('+${timeDiff.toStringAsFixed(0)} phút');
    } else if (timeDiff < 0) {
      parts.add('${timeDiff.toStringAsFixed(0)} phút');
    }

    if (distDiff > 0) {
      parts.add('+${(distDiff / 1000).toStringAsFixed(1)} km');
    } else if (distDiff < 0) {
      parts.add('${(distDiff / 1000).toStringAsFixed(1)} km');
    }

    return parts.join(', ');
  }
}

// ====================================================================
// 8. ENUM CHỈ ĐƯỜNG (Có sẵn Icon và Màu sắc cho UI)
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
