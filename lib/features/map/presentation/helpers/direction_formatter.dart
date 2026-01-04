import 'package:smart_route_app/features/search/domain/entities/address_result.dart'
    as entities;
import '../../domain/entities/route_direction.dart';

/// Helper class để format và xử lý directions cho UI
class DirectionFormatter {
  final entities.AddressResult? startLocation;
  final entities.AddressResult? endLocation;

  DirectionFormatter({this.startLocation, this.endLocation});

  /// Lấy tên ngắn gọn của địa điểm
  String _getShortName(entities.AddressResult? location, String fallback) {
    if (location == null) return fallback;
    final firstLine = location.fullAddress.split('\n').first;
    if (firstLine.length > 30) {
      return '${firstLine.substring(0, 27)}...';
    }
    return firstLine;
  }

  /// Format instruction - thay Location X bằng tên địa điểm thực
  String formatInstruction(String instruction, {bool isSmartRoute = false}) {
    String result = instruction;

    // Location 1 → tên điểm bắt đầu
    final startName = _getShortName(startLocation, 'Điểm bắt đầu');
    result = result.replaceAllMapped(
      RegExp(r'location\s*1', caseSensitive: false),
      (match) => startName,
    );

    // Location cuối → tên điểm kết thúc
    final endName = _getShortName(endLocation, 'Điểm kết thúc');

    if (isSmartRoute) {
      result = result.replaceAllMapped(
        RegExp(r'location\s*3', caseSensitive: false),
        (match) => endName,
      );
      // Location 2 là waypoint - ẩn instruction này
      if (RegExp(r'location\s*2', caseSensitive: false).hasMatch(result)) {
        return '';
      }
    } else {
      result = result.replaceAllMapped(
        RegExp(r'location\s*2', caseSensitive: false),
        (match) => endName,
      );
    }

    return result;
  }

  /// Format streetName - thay Location X bằng "Vị trí bắt đầu/kết thúc"
  String? formatStreetName(String? streetName, {bool isSmartRoute = false}) {
    if (streetName == null) return null;

    String result = streetName;

    // Location 1 → Vị trí bắt đầu
    result = result.replaceAllMapped(
      RegExp(r'location\s*1', caseSensitive: false),
      (match) => 'Vị trí bắt đầu',
    );

    if (isSmartRoute) {
      // Location 3 → Vị trí kết thúc
      result = result.replaceAllMapped(
        RegExp(r'location\s*3', caseSensitive: false),
        (match) => 'Vị trí kết thúc',
      );
      // Location 2 là waypoint - ẩn streetName
      if (RegExp(r'location\s*2', caseSensitive: false).hasMatch(result)) {
        return null;
      }
    } else {
      // Location 2 → Vị trí kết thúc
      result = result.replaceAllMapped(
        RegExp(r'location\s*2', caseSensitive: false),
        (match) => 'Vị trí kết thúc',
      );
    }

    return result.isEmpty ? null : result;
  }

  /// Lọc và format danh sách directions
  List<RouteDirection> formatDirections(
    List<RouteDirection> directions, {
    bool isSmartRoute = false,
  }) {
    final filtered = <RouteDirection>[];

    for (final direction in directions) {
      final instruction = direction.instruction.toLowerCase();

      // Bỏ qua waypoint steps
      if (isSmartRoute && _isWaypointStep(instruction)) {
        continue;
      }

      final formattedInstruction = formatInstruction(
        direction.instruction,
        isSmartRoute: isSmartRoute,
      );

      final formattedStreetName = formatStreetName(
        direction.streetName,
        isSmartRoute: isSmartRoute,
      );

      final formattedAltStreetName = formatStreetName(
        direction.altStreetName,
        isSmartRoute: isSmartRoute,
      );

      filtered.add(
        RouteDirection(
          instruction: formattedInstruction,
          distanceMeters: direction.distanceMeters,
          timeMinutes: direction.timeMinutes,
          maneuverType: direction.maneuverType,
          streetName: formattedStreetName,
          altStreetName: formattedAltStreetName,
        ),
      );
    }

    return filtered;
  }

  bool _isWaypointStep(String instruction) {
    final patterns = [
      'đến location 2',
      'khởi hành từ location 2',
      'arrive at location 2',
      'depart location 2',
    ];
    return patterns.any((p) => instruction.contains(p));
  }

  int countActualSteps(
    List<RouteDirection> directions, {
    bool isSmartRoute = false,
  }) {
    if (!isSmartRoute) return directions.length;
    return directions
        .where((d) => !_isWaypointStep(d.instruction.toLowerCase()))
        .length;
  }
}
