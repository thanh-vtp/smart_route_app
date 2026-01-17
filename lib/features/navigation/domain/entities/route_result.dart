import 'package:equatable/equatable.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_point.dart';
import 'route_direction.dart';

// Entity cho kết quả route
class RouteResult extends Equatable {
  final List<RoutePoint> routePoints; // Đường đi (Polyline)
  final double totalDistance; // in meters
  final double totalTime; // in minutes
  final String routeName;
  final List<RouteDirection> directions;
  final List<RoutePoint>
  confirmedBarriers; // ác điểm sự cố đã được API trả về 'returnBarriers'

  const RouteResult({
    required this.routePoints,
    required this.totalDistance,
    required this.totalTime,
    required this.routeName,
    this.directions = const [],
    this.confirmedBarriers = const [],
  });

  /// Format tổng khoảng cách
  String get formattedDistance {
    final km = totalDistance / 1000;
    if (km < 1) {
      return '${totalDistance.toStringAsFixed(0)} m';
    }
    return '${km.toStringAsFixed(1)} km';
  }

  /// Format tổng thời gian
  String get formattedTime {
    if (totalTime < 60) {
      return '${totalTime.toStringAsFixed(0)} phút';
    }
    final hours = (totalTime / 60).floor();
    final mins = (totalTime % 60).round();
    if (mins == 0) {
      return '$hours giờ';
    }
    return '$hours giờ $mins phút';
  }

  /// Thời gian đến dự kiến
  String get estimatedArrival {
    final now = DateTime.now();
    final arrival = now.add(Duration(minutes: totalTime.round()));
    final hour = arrival.hour.toString().padLeft(2, '0');
    final minute = arrival.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  List<Object?> get props => [
    routePoints,
    totalDistance,
    totalTime,
    routeName,
    directions,
  ];
}
