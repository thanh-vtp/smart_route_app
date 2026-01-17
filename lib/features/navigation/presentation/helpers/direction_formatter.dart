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
  String formatInstruction(String instruction) {
    String result = instruction;

    // Location 1 → tên điểm bắt đầu
    final startName = _getShortName(startLocation, 'Điểm bắt đầu');
    result = result.replaceAllMapped(
      RegExp(r'location\s*1', caseSensitive: false),
      (match) => startName,
    );

    // Location cuối → tên điểm kết thúc
    final endName = _getShortName(endLocation, 'Điểm kết thúc');

    result = result.replaceAllMapped(
      RegExp(r'location\s*2', caseSensitive: false),
      (match) => endName,
    );

    return result;
  }

  /// Format streetName - thay Location X bằng "Vị trí bắt đầu/kết thúc"
  String? formatStreetName(String? streetName) {
    if (streetName == null) return null;

    String result = streetName;

    // Location 1 → Vị trí bắt đầu
    result = result.replaceAllMapped(
      RegExp(r'location\s*1', caseSensitive: false),
      (match) => 'Vị trí bắt đầu',
    );

    // Location 2 → Vị trí kết thúc
    result = result.replaceAllMapped(
      RegExp(r'location\s*2', caseSensitive: false),
      (match) => 'Vị trí kết thúc',
    );

    return result.isEmpty ? null : result;
  }

  /// Lọc và format danh sách directions
  List<RouteDirection> formatDirections(List<RouteDirection> directions) {
    return directions.map((direction) {
      // 1. Format Instruction
      final formattedInstruction = formatInstruction(direction.instruction);

      // 2. Format Street Name
      final formattedStreetName = formatStreetName(direction.streetName);
      final formattedAltStreetName = formatStreetName(direction.altStreetName);

      // 3. Trả về object mới (giữ nguyên các thông số khác)
      return RouteDirection(
        instruction: formattedInstruction,
        distanceMeters: direction.distanceMeters,
        timeMinutes: direction.timeMinutes,
        maneuverType: direction.maneuverType,
        streetName: formattedStreetName,
        altStreetName: formattedAltStreetName,
      );
    }).toList();
  }

  int countActualSteps(List<RouteDirection> directions) {
    return directions.length;
  }
}
