import 'dart:ui';

import 'package:arcgis_maps/arcgis_maps.dart';

/// Factory Pattern.
class MapObjectFactory {
  MapObjectFactory._();

  /// Tạo bản đồ 2D với cấu hình mặc định
  static ArcGISMap create2DMap({
    required BasemapStyle style,
    double minScale = 100000000,
  }) {
    final map = ArcGISMap.withBasemapStyle(style);

    map.minScale = minScale;

    map.initialViewpoint = defaultViewpoint();

    return map;
  }

  static ArcGISScene create3DScene({
    required BasemapStyle style,
    bool enableTerrain = true,
  }) {
    final scene = ArcGISScene.withBasemapStyle(style);

    if (enableTerrain) {
      final surface = Surface();

      final elevation = ArcGISTiledElevationSource.withUri(
        Uri.parse(
          'https://elevation3d.arcgis.com/arcgis/rest/services/WorldElevation3D/Terrain3D/ImageServer',
        ),
      );

      surface.elevationSources.add(elevation);

      scene.baseSurface = surface;
    }

    return scene;
  }

  /// Tạo BackgroundGrid động dựa vào Basemap
  static BackgroundGrid createBackgroundGrid(BasemapStyle style) {
    final color = _backgroundColor(style);

    return BackgroundGrid(
      backgroundColor: color,
      lineColor: color,
      lineWidth: 0,
    );
  }

  /// Default viewpoint helper
  /// tránh hardcode tọa độ và scale ở nhiều chỗ
  static Viewpoint defaultViewpoint() {
    return Viewpoint.withLatLongScale(
      latitude: 10.8231,
      longitude: 106.6297,
      scale: 50000,
    );
  }

  static Color _backgroundColor(BasemapStyle style) {
    switch (style) {
      case BasemapStyle.arcGISNavigation:
      case BasemapStyle.arcGISNavigationNight:
        return const Color(0xFFA8C8E1);

      case BasemapStyle.arcGISTopographic:
        return const Color(0xFFA3CCFF);

      case BasemapStyle.arcGISImagery:
      case BasemapStyle.arcGISDarkGray:
        return const Color(0xFF000000);

      default:
        return const Color(0xFFA8C8E1);
    }
  }
}
