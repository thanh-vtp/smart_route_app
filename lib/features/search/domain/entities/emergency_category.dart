import 'package:flutter/material.dart';

/// Các loại địa điểm khẩn cấp cho app báo cáo sự cố
/// Sử dụng với ArcGIS Geocoding API findNearbyPlaces
class EmergencyCategory {
  final String value;
  final String displayName;
  final String icon;
  final Color color;

  const EmergencyCategory._({
    required this.value,
    required this.displayName,
    required this.icon,
    required this.color,
  });

  @override
  String toString() => value;

  // ============== SOS Xe cộ ==============
  /// Trạm xăng
  static const gasStation = EmergencyCategory._(
    value: 'Gas Station',
    displayName: 'Cây xăng',
    icon: '⛽',
    color: Colors.orange,
  );

  /// Sửa chữa ô tô/xe máy
  static const autoRepair = EmergencyCategory._(
    value: 'Automotive Repair',
    displayName: 'Sửa xe',
    icon: '🔧',
    color: Color(0xFF424242), // Colors.grey[800]
  );

  /// Trạm sạc xe điện
  static const evCharging = EmergencyCategory._(
    value: 'EV Charging Station',
    displayName: 'Trạm sạc điện',
    icon: '🔌',
    color: Color(0xFF388E3C), // Colors.green[700]
  );

  /// Bãi đỗ xe
  static const parking = EmergencyCategory._(
    value: 'Parking',
    displayName: 'Bãi đỗ xe',
    icon: '🅿️',
    color: Colors.blue,
  );

  // ============== SOS Y tế ==============
  /// Bệnh viện
  static const hospital = EmergencyCategory._(
    value: 'Hospital',
    displayName: 'Bệnh viện',
    icon: '🏥',
    color: Colors.red,
  );

  /// Nhà thuốc
  static const pharmacy = EmergencyCategory._(
    value: 'Pharmacy',
    displayName: 'Nhà thuốc',
    icon: '💊',
    color: Colors.green,
  );

  /// Phòng khám
  static const clinic = EmergencyCategory._(
    value: 'Health Center',
    displayName: 'Phòng khám',
    icon: '🩺',
    color: Color(0xFFE57373), // Colors.red[300]
  );

  // ============== SOS An ninh ==============
  /// Đồn công an
  static const policeStation = EmergencyCategory._(
    value: 'Police Station',
    displayName: 'Công an',
    icon: '👮',
    color: Color(0xFF0D47A1), // Colors.blue[900]
  );

  /// Trạm cứu hỏa
  static const fireStation = EmergencyCategory._(
    value: 'Fire Station',
    displayName: 'Cứu hỏa',
    icon: '🚒',
    color: Color(0xFFE65100), // Colors.orange[900]
  );

  // ============== Tiện ích khác ==============
  /// ATM
  static const atm = EmergencyCategory._(
    value: 'ATM',
    displayName: 'ATM',
    icon: '🏧',
    color: Colors.purple,
  );

  /// Cửa hàng tiện lợi
  static const convenienceStore = EmergencyCategory._(
    value: 'Convenience Store',
    displayName: 'Cửa hàng tiện lợi',
    icon: '🏪',
    color: Colors.teal,
  );

  // ============== Preset combinations cho SOS ==============

  /// SOS Xe: Cây xăng + Sửa xe
  static const String vehicleSOS = 'Gas Station,Automotive Repair';

  /// SOS Khẩn cấp: Bệnh viện + Công an
  static const String emergencySOS = 'Hospital,Police Station';

  /// SOS Y tế: Bệnh viện + Nhà thuốc + Phòng khám
  static const String medicalSOS = 'Hospital,Pharmacy,Health Center';

  /// SOS An ninh: Công an + Cứu hỏa
  static const String securitySOS = 'Police Station,Fire Station';

  /// SOS Xe điện: Trạm sạc + Sửa xe
  static const String evSOS = 'EV Charging Station,Automotive Repair';

  // ============== Danh sách ==============

  /// Tất cả categories đơn lẻ
  static const List<EmergencyCategory> all = [
    gasStation,
    autoRepair,
    evCharging,
    parking,
    hospital,
    pharmacy,
    clinic,
    policeStation,
    fireStation,
    atm,
    convenienceStore,
  ];

  /// Categories hiển thị trong SOS button (phổ biến nhất)
  static const List<EmergencyCategory> sosQuickAccess = [
    gasStation,
    autoRepair,
    hospital,
    policeStation,
    pharmacy,
  ];

  /// Kết hợp nhiều categories thành chuỗi cho API
  static String combine(List<EmergencyCategory> categories) {
    return categories.map((c) => c.value).join(',');
  }

  static String get allCategoryValues => combine(all);

  static EmergencyCategory fromType(String type) {
    // Chuẩn hóa chuỗi (lowercase) để so sánh tương đối
    final lowerType = type.toLowerCase();

    try {
      return all.firstWhere((cat) {
        final catValue = cat.value.toLowerCase();
        // So sánh tương đối: VD API trả về "Automotive" vẫn map được "Automotive Repair"
        return lowerType.contains(catValue) || catValue.contains(lowerType);
      });
    } catch (e) {
      // Fallback: Nếu không tìm thấy category nào khớp
      return const EmergencyCategory._(
        value: 'POI',
        displayName: 'Địa điểm',
        icon: '📍',
        color: Colors.blueGrey,
      );
    }
  }
}
