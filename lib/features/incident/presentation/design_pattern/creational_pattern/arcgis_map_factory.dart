// Factory method
// Tạo ra các instance của ArcGISMap hoặc ArcGISScene với cấu hình mặc định

import 'dart:ui';

import 'package:arcgis_maps/arcgis_maps.dart';

class ArcGISMapFactory {
  // Tránh việc khởi tạo instance của class này
  ArcGISMapFactory._();

  /// Tạo bản đồ 2D với cấu hình mặc định
  static ArcGISMap create2DMap({
    required BasemapStyle basemapStyle,
    double minScale = 100000000,
  }) {
    final map = ArcGISMap.withBasemapStyle(basemapStyle);
    // Giới hạn zoom out tối đa để tránh hiển thị lưới xám (chuẩn UX Google Maps)
    map.minScale = minScale;
    return map;
  }

  /// Tạo bản đồ 3D (Scene)
  /// Theo document của ArcGIS, 3D cần có Elevation (Độ cao địa hình) để hiển thị chân thực
  static ArcGISScene create3DScene({
    required BasemapStyle basemapStyle,
    bool enableTerrainElevation = true,
  }) {
    final scene = ArcGISScene.withBasemapStyle(basemapStyle);

    if (enableTerrainElevation) {
      // Khởi tạo bề mặt địa hình 3D (Surface) từ dịch vụ WorldElevation3D của Esri
      final surface = Surface();
      final elevationSource = ArcGISTiledElevationSource.withUri(
        Uri.parse(
          'https://elevation3d.arcgis.com/arcgis/rest/services/WorldElevation3D/Terrain3D/ImageServer',
        ),
      );
      surface.elevationSources.add(elevationSource);
      scene.baseSurface = surface;
    }

    return scene;
  }

  /// Tạo BackgroundGrid động dựa vào Basemap (Lấy từ logic cũ của bạn)
  static BackgroundGrid createDynamicBackgroundGrid(BasemapStyle style) {
    final color = _getBackgroundColorForBasemap(style);
    return BackgroundGrid(
      backgroundColor: color,
      lineColor: color, // Ẩn grid lines
      lineWidth: 0,
    );
  }

  static Color _getBackgroundColorForBasemap(BasemapStyle style) {
    switch (style) {
      case BasemapStyle.arcGISNavigation:
      case BasemapStyle.arcGISNavigationNight:
        return const Color(0xFFA8C8E1); // Xanh biển
      case BasemapStyle.arcGISTopographic:
        return const Color(0xFFA3CCFF);
      case BasemapStyle.arcGISImagery:
      case BasemapStyle.arcGISDarkGray:
        return const Color(0xFF000000); // Đen
      case BasemapStyle.arcGISStreets:
      case BasemapStyle.arcGISStreetsNight:
        return const Color(0xFFE8F4F8); // Xanh nhạt
      default:
        return const Color(0xFFA8C8E1);
    }
  }
}
