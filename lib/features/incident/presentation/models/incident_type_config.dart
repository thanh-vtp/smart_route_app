import 'package:flutter/material.dart';

/// Cấu hình cho từng loại incident
class IncidentTypeConfig {
  final String id;
  final String displayName;
  final String assetPath;
  final Color color;
  final Color backgroundColor;
  final int zIndex;

  const IncidentTypeConfig({
    required this.id,
    required this.displayName,
    required this.assetPath,
    required this.color,
    required this.backgroundColor,
    this.zIndex = 0, // độ ưu tiên hiển thị (z-index trên bản đồ)
  });
}

/// Danh sách các loại incident được hỗ trợ
class IncidentTypes {
  static const _basePath = 'assets/images/markers';

  static const traffic = IncidentTypeConfig(
    id: 'traffic',
    displayName: 'Kẹt xe',
    assetPath: '$_basePath/ic_traffic.png',
    color: Colors.orange,
    backgroundColor: Color(0xFFFFF3E0),
    zIndex: 1,
  );

  static const accident = IncidentTypeConfig(
    id: 'accident',
    displayName: 'Tai nạn',
    assetPath: '$_basePath/ic_accident.png',
    color: Colors.red,
    backgroundColor: Color(0xFFFFEBEE),
    zIndex: 10,
  );

  static const construction = IncidentTypeConfig(
    id: 'construction',
    displayName: 'Công trình',
    assetPath: '$_basePath/ic_construction.png',
    color: Colors.blue,
    backgroundColor: Color(0xFFE3F2FD),
    zIndex: 2,
  );

  // static const roadClosed = IncidentTypeConfig(
  //   id: 'road_closed',
  //   displayName: 'Đường đóng',
  //   assetPath: '$_basePath/ic_road_closed.png',
  //   color: Colors.purple,
  //   backgroundColor: Color(0xFFF3E5F5),
  //   zIndex: 8,
  // );

  // static const hazard = IncidentTypeConfig(
  //   id: 'hazard',
  //   displayName: 'Nguy hiểm',
  //   assetPath: '$_basePath/ic_hazard.png',
  //   color: Colors.deepOrange,
  //   backgroundColor: Color(0xFFFBE9E7),
  //   zIndex: 9,
  // );

  // static const police = IncidentTypeConfig(
  //   id: 'police',
  //   displayName: 'Cảnh sát',
  //   assetPath: '$_basePath/ic_police.png',
  //   color: Colors.indigo,
  //   backgroundColor: Color(0xFFE8EAF6),
  //   zIndex: 6,
  // );

  static const other = IncidentTypeConfig(
    id: 'other',
    displayName: 'Khác',
    assetPath: '$_basePath/ic_other.png',
    color: Colors.grey,
    backgroundColor: Color(0xFFF5F5F5),
    zIndex: 0,
  );

  static const List<IncidentTypeConfig> all = [
    traffic,
    accident,
    construction,
    // roadClosed,
    // hazard,
    // police,
    other, // Thêm option "Khác" cho user tự nhập
  ];

  /// Lấy config theo id (dùng cho lưu/get từ DB)
  static IncidentTypeConfig getById(String id) {
    return all.firstWhere((config) => config.id == id, orElse: () => other);
  }
}
