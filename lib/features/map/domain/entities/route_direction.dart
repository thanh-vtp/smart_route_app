import 'package:flutter/material.dart';

/// Entity cho từng bước chỉ đường
class RouteDirection {
  final String instruction;
  final double distanceMeters;
  final double timeMinutes;
  final ManeuverType maneuverType;
  final String? streetName;
  final String? altStreetName;

  const RouteDirection({
    required this.instruction,
    required this.distanceMeters,
    required this.timeMinutes,
    required this.maneuverType,
    this.streetName,
    this.altStreetName,
  });

  /// Format khoảng cách hiển thị
  String get formattedDistance {
    if (distanceMeters < 1000) {
      return '${distanceMeters.toStringAsFixed(0)} m';
    }
    return '${(distanceMeters / 1000).toStringAsFixed(1)} km';
  }

  /// Format thời gian hiển thị
  String get formattedTime {
    if (timeMinutes < 1) {
      return '< 1 phút';
    }
    if (timeMinutes < 60) {
      return '${timeMinutes.toStringAsFixed(0)} phút';
    }
    final hours = (timeMinutes / 60).floor();
    final mins = (timeMinutes % 60).round();
    if (mins == 0) {
      return '$hours giờ';
    }
    return '$hours giờ $mins phút';
  }
}

/// Loại hành động điều hướng
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

  /// Parse từ ArcGIS maneuverType
  static ManeuverType fromArcGIS(String type) {
    return switch (type) {
      'esriDMTDepart' => ManeuverType.depart,
      'esriDMTStraight' => ManeuverType.straight,
      'esriDMTTurnLeft' => ManeuverType.turnLeft,
      'esriDMTTurnRight' => ManeuverType.turnRight,
      'esriDMTSharpLeft' => ManeuverType.sharpLeft,
      'esriDMTSharpRight' => ManeuverType.sharpRight,
      'esriDMTBearLeft' => ManeuverType.bearLeft,
      'esriDMTBearRight' => ManeuverType.bearRight,
      'esriDMTUTurn' => ManeuverType.uTurn,
      'esriDMTRoundabout' => ManeuverType.roundabout,
      'esriDMTRampRight' || 'esriDMTRampLeft' => ManeuverType.ramp,
      'esriDMTForkRight' ||
      'esriDMTForkLeft' ||
      'esriDMTForkCenter' => ManeuverType.fork,
      'esriDMTMerge' => ManeuverType.merge,
      'esriDMTStop' => ManeuverType.stop,
      _ => ManeuverType.unknown,
    };
  }

  /// Icon cho từng loại maneuver
  IconData get icon {
    return switch (this) {
      ManeuverType.depart => Icons.trip_origin,
      ManeuverType.straight => Icons.arrow_upward,
      ManeuverType.turnLeft => Icons.turn_left,
      ManeuverType.turnRight => Icons.turn_right,
      ManeuverType.sharpLeft => Icons.turn_sharp_left,
      ManeuverType.sharpRight => Icons.turn_sharp_right,
      ManeuverType.bearLeft => Icons.turn_slight_left,
      ManeuverType.bearRight => Icons.turn_slight_right,
      ManeuverType.uTurn => Icons.u_turn_left,
      ManeuverType.roundabout => Icons.roundabout_left,
      ManeuverType.ramp => Icons.ramp_right,
      ManeuverType.fork => Icons.fork_right,
      ManeuverType.merge => Icons.merge,
      ManeuverType.stop => Icons.location_on,
      ManeuverType.unknown => Icons.directions,
    };
  }

  /// Màu cho icon
  Color get color {
    return switch (this) {
      ManeuverType.depart => Colors.green,
      ManeuverType.stop => Colors.red,
      ManeuverType.turnLeft ||
      ManeuverType.sharpLeft ||
      ManeuverType.bearLeft => Colors.blue,
      ManeuverType.turnRight ||
      ManeuverType.sharpRight ||
      ManeuverType.bearRight => Colors.blue,
      ManeuverType.roundabout => Colors.orange,
      ManeuverType.uTurn => Colors.purple,
      _ => Colors.grey.shade700,
    };
  }
}

/// Entity cho tổng quan route
class RouteSummary {
  final double totalDistanceKm;
  final double totalTimeMinutes;
  final String routeName;
  final List<RouteDirection> directions;

  const RouteSummary({
    required this.totalDistanceKm,
    required this.totalTimeMinutes,
    required this.routeName,
    required this.directions,
  });

  /// Format tổng khoảng cách
  String get formattedDistance {
    if (totalDistanceKm < 1) {
      return '${(totalDistanceKm * 1000).toStringAsFixed(0)} m';
    }
    return '${totalDistanceKm.toStringAsFixed(1)} km';
  }

  /// Format tổng thời gian
  String get formattedTime {
    if (totalTimeMinutes < 60) {
      return '${totalTimeMinutes.toStringAsFixed(0)} phút';
    }
    final hours = (totalTimeMinutes / 60).floor();
    final mins = (totalTimeMinutes % 60).round();
    if (mins == 0) {
      return '$hours giờ';
    }
    return '$hours giờ $mins phút';
  }

  /// Thời gian đến dự kiến
  String get estimatedArrival {
    final now = DateTime.now();
    final arrival = now.add(Duration(minutes: totalTimeMinutes.round()));
    final hour = arrival.hour.toString().padLeft(2, '0');
    final minute = arrival.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
