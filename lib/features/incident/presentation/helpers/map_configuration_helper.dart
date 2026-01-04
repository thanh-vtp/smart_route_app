import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';

/// Helper class để cấu hình ArcGIS Map
class MapConfigurationHelper {
  /// Tạo ArcGIS Map với cấu hình mặc định
  ///
  /// [baseMapStyle]: Style của basemap
  /// [minScale]: Giới hạn zoom tối thiểu (càng nhỏ càng hạn chế zoom out)
  static ArcGISMap createConfiguredMap({
    required BasemapStyle baseMapStyle,
    double minScale = 100000000,
  }) {
    final map = ArcGISMap.withBasemapStyle(baseMapStyle);

    // Giới hạn zoom tối thiểu để tránh hiển thị lưới xám (giống Google Maps)
    map.minScale = minScale;

    return map;
  }

  /// Tạo ArcGIS Scene với cấu hình mặc định
  static ArcGISScene createConfiguredScene({
    required BasemapStyle baseMapStyle,
  }) {
    return ArcGISScene.withBasemapStyle(baseMapStyle);
  }

  /// Cấu hình BackgroundGrid màu nước biển
  ///
  /// Màu được chọn để khớp với màu đại dương của basemap
  static BackgroundGrid createOceanBackgroundGrid() {
    return BackgroundGrid(
      backgroundColor: const Color(0xFFA8C8E1), // Màu xanh nước biển
      lineColor: const Color(0xFFA8C8E1), // Ẩn grid lines
      lineWidth: 1, // Độ dày đường lưới (0 để ẩn hoàn toàn)
      size: 128, // Kích thước ô grid
    );
  }

  /// Lấy màu background phù hợp với basemap style
  static Color getBackgroundColorForBasemap(BasemapStyle style) {
    switch (style) {
      case BasemapStyle.arcGISNavigation:
      case BasemapStyle.arcGISNavigationNight:
        return const Color(0xFFA8C8E1); // Xanh biển
      case BasemapStyle.arcGISTopographic:
        return const Color(0xFFA3CCFF); // Xanh dương nhạt
      case BasemapStyle.arcGISImagery:
      case BasemapStyle.arcGISDarkGray:
        return const Color(0xFF000000); // Đen
      case BasemapStyle.arcGISStreets:
      case BasemapStyle.arcGISStreetsNight:
        return const Color(0xFFE8F4F8); // Xanh rất nhạt
      default:
        return const Color(0xFFA8C8E1); // Default ocean color
    }
  }

  /// Tạo BackgroundGrid động theo basemap style
  static BackgroundGrid createDynamicBackgroundGrid(BasemapStyle style) {
    final color = getBackgroundColorForBasemap(style);
    return BackgroundGrid(
      backgroundColor: color,
      lineColor: color,
      lineWidth: 0,
    );
  }
}
