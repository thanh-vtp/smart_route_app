/// Cấu hình cho từng loại incident (được dùng để tạo Symbol, hiển thị tên, v.v.)
class IncidentTypeConfig {
  final String id;
  final String displayName;
  final String assetPath;
  final int zIndex;

  const IncidentTypeConfig({
    required this.id,
    required this.displayName,
    required this.assetPath,
    this.zIndex = 0, // độ ưu tiên hiển thị (z-index trên bản đồ)
  });
}

/// Danh sách các loại incident được hỗ trợ
class IncidentTypes {
  static const _basePath = 'assets/images/markers';

  static const crash = IncidentTypeConfig(
    id: 'crash',
    displayName: 'Tai nạn',
    assetPath: '$_basePath/marker_crash.png',
    zIndex: 0,
  );

  static const traffic = IncidentTypeConfig(
    id: 'traffic',
    displayName: 'Kẹt xe',
    assetPath: '$_basePath/marker_traffic.png',
    zIndex: 0,
  );

  static const police = IncidentTypeConfig(
    id: 'police',
    displayName: 'Cảnh sát giao thông',
    assetPath: '$_basePath/marker_police.png',
    zIndex: 0,
  );
  static const hazard = IncidentTypeConfig(
    id: 'hazard',
    displayName: 'Nguy hiểm',
    assetPath: '$_basePath/marker_hazard.png',
    zIndex: 0,
  );
  static const closure = IncidentTypeConfig(
    id: 'closure',
    displayName: 'Đường cấm',
    assetPath: '$_basePath/marker_closure.png',
    zIndex: 0,
  );
  static const camera = IncidentTypeConfig(
    id: 'camera',
    displayName: 'Camera',
    assetPath: '$_basePath/marker_camera.png',
    zIndex: 0,
  );

  static const List<IncidentTypeConfig> all = [
    crash,
    traffic,
    police,
    hazard,
    closure,
    camera,
  ];

  /// Lấy config theo id (dùng cho lưu/get từ DB)
  static IncidentTypeConfig getById(String id) {
    return all.firstWhere((config) => config.id == id);
  }
}
