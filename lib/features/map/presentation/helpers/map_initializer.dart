import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';

/// Helper class để khởi tạo và cấu hình map/scene
class MapInitializer {
  static const double _minScale = 100000000.0;

  /// Khởi tạo 2D map với basemap style
  static ArcGISMap initializeMap(BasemapStyle baseMapStyle) {
    final map = ArcGISMap.withBasemapStyle(baseMapStyle);
    // Giới hạn zoom tối thiểu để tránh hiển thị lưới xám
    map.minScale = _minScale;
    return map;
  }

  /// Khởi tạo 3D scene với basemap style
  static ArcGISScene initializeScene(BasemapStyle baseMapStyle) {
    return ArcGISScene.withBasemapStyle(baseMapStyle);
  }

  /// Setup graphics overlays cho view
  static void setupGraphicsOverlays({
    required ArcGISMapViewController? mapController,
    required ArcGISSceneViewController? sceneController,
    required MapMode mode,
    required GraphicsOverlay incidentOverlay,
    required GraphicsOverlay locationMarkerOverlay,
  }) {
    if (mode == MapMode.map2D && mapController != null) {
      mapController.graphicsOverlays.add(incidentOverlay);
      mapController.graphicsOverlays.add(locationMarkerOverlay);
    } else if (mode == MapMode.scene3D && sceneController != null) {
      sceneController.graphicsOverlays.add(incidentOverlay);
      sceneController.graphicsOverlays.add(locationMarkerOverlay);
    }
  }

  /// Di chuyển graphics overlays giữa các views
  static void moveGraphicsOverlays({
    required ArcGISMapViewController mapController,
    required ArcGISSceneViewController sceneController,
    required MapMode targetMode,
    required GraphicsOverlay incidentOverlay,
    required GraphicsOverlay locationMarkerOverlay,
  }) {
    // Remove từ cả hai views
    mapController.graphicsOverlays.remove(incidentOverlay);
    sceneController.graphicsOverlays.remove(incidentOverlay);
    mapController.graphicsOverlays.remove(locationMarkerOverlay);
    sceneController.graphicsOverlays.remove(locationMarkerOverlay);

    // Thêm vào view đang active
    if (targetMode == MapMode.map2D) {
      mapController.graphicsOverlays.add(incidentOverlay);
      mapController.graphicsOverlays.add(locationMarkerOverlay);
    } else {
      sceneController.graphicsOverlays.add(incidentOverlay);
      sceneController.graphicsOverlays.add(locationMarkerOverlay);
    }
  }

  /// Cập nhật basemap style cho map hoặc scene
  static void updateBasemapStyle({
    required BasemapStyle newStyle,
    required MapMode mode,
    required ArcGISMapViewController mapController,
    required ArcGISSceneViewController sceneController,
    required GraphicsOverlay incidentOverlay,
    required GraphicsOverlay locationMarkerOverlay,
  }) {
    if (mode == MapMode.map2D) {
      final newMap = initializeMap(newStyle);
      mapController.arcGISMap = newMap;
      mapController.graphicsOverlays.clear();
      mapController.graphicsOverlays.add(incidentOverlay);
      mapController.graphicsOverlays.add(locationMarkerOverlay);
    } else {
      sceneController.arcGISScene = initializeScene(newStyle);
      sceneController.graphicsOverlays.clear();
      sceneController.graphicsOverlays.add(incidentOverlay);
      sceneController.graphicsOverlays.add(locationMarkerOverlay);
    }
  }
}
