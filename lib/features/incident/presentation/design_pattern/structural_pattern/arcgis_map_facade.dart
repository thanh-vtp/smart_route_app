// Facade pattern
// Cung cấp một interface đơn giản để tương tác với ArcGISMap hoặc ArcGISScene

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/features/incident/presentation/design_pattern/creational_pattern/arcgis_map_factory.dart';

/// [Facade Pattern] Quản lý vòng đời và che giấu sự phức tạp của ArcGIS Controllers
class ArcGISMapFacade {
  final ArcGISMapViewController _mapController;
  final ArcGISSceneViewController _sceneController;

  ArcGISMapFacade(this._mapController, this._sceneController);

  /// Cung cấp Getter (Read-only) cho tầng UI để gắn vào Widget View
  ArcGISMapViewController get mapController => _mapController;
  ArcGISSceneViewController get sceneController => _sceneController;

  ///  Khởi tạo bản đồ 2D
  void initialize2D(BasemapStyle style) {
    if (_mapController.arcGISMap != null) return;

    _mapController.arcGISMap = ArcGISMapFactory.create2DMap(
      basemapStyle: style,
    );

    _mapController.backgroundGrid =
        ArcGISMapFactory.createDynamicBackgroundGrid(style);
  }

  void switchTo3D(BasemapStyle style) {
    _init3DIfNeeded(style);
    _syncFrom2DTo3D();
  }

  void switchTo2D(BasemapStyle style) {
    initialize2D(style);
    _syncFrom3DTo2D(); // Thêm đồng bộ ngược
  }

  /// Thay đổi Basemap (Đồng bộ cho cả 2 view)
  void changeBasemapStyle(BasemapStyle style) {
    // 1. Update 2D Map
    final map = _mapController.arcGISMap;
    if (map != null) {
      map.basemap = Basemap.withStyle(style);
      _mapController.backgroundGrid =
          ArcGISMapFactory.createDynamicBackgroundGrid(style);
    }

    // 2. Update 3D Scene (Nếu đã được init)
    final scene = _sceneController.arcGISScene;
    if (scene != null) {
      scene.basemap = Basemap.withStyle(style);
    }
  }

  void _init3DIfNeeded(BasemapStyle style) {
    if (_sceneController.arcGISScene != null) return;

    _sceneController.arcGISScene = ArcGISMapFactory.create3DScene(
      basemapStyle: style,
    );
  }

  void _syncFrom2DTo3D() {
    final vp = _mapController.getCurrentViewpoint(ViewpointType.centerAndScale);
    if (vp != null) {
      _sceneController.setViewpoint(vp);
    }
  }

  void _syncFrom3DTo2D() {
    // Chỉ sync nếu 3D Scene đang tồn tại và có target geometry
    final vp = _sceneController.getCurrentViewpoint(
      ViewpointType.centerAndScale,
    );
    if (vp != null) {
      _mapController.setViewpoint(vp);
    }
  }
}
