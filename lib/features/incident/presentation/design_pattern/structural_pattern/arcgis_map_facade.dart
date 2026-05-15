// Facade pattern
// Cung cấp một interface đơn giản để tương tác với ArcGISMap hoặc ArcGISScene

import 'package:arcgis_maps/arcgis_maps.dart' hide Incident;
import 'package:smart_route_app/features/incident/presentation/design_pattern/creational_pattern/arcgis_map_factory.dart';
import 'package:smart_route_app/features/incident/presentation/logics/device_location_manager.dart';
import 'package:smart_route_app/features/incident/presentation/logics/incident_layer_manager.dart';
import 'package:smart_route_app/features/incident/presentation/logics/incident_symbol_factory.dart';
import 'package:smart_route_app/features/incident/presentation/logics/overlay_registry.dart';
import '../../../domain/entities/incident.dart';

/// [Facade Pattern] Quản lý vòng đời và che giấu sự phức tạp của ArcGIS Controllers
class ArcGISMapFacade {
  final ArcGISMapViewController _mapController;
  final ArcGISSceneViewController _sceneController;

  /// variable để quản lý GPS
  final DeviceLocationManager locationManager;

  /// variable để quản lý lớp hiển thị sự cố (Kẹt xe, Tai nạn)
  final GraphicsOverlayRegistry overlayRegistry = GraphicsOverlayRegistry();

  /// variable để quản lý lớp hiển thị sự cố (Kẹt xe, Tai nạn)
  late final IncidentLayerManager incidentManager;
  final IncidentSymbolFactory _symbolFactory;

  ArcGISMapFacade(this._mapController, this._sceneController)
    : locationManager = DeviceLocationManager(),
      _symbolFactory = IncidentSymbolFactory() {
    // Tạo sẵn overlay để hiển thị sự cố
    final incidentOverlay = overlayRegistry.getOrCreate('incidents');

    // Khởi tạo Layer Manager
    incidentManager = IncidentLayerManager(_symbolFactory);

    // Gắn overlay dùng chung
    incidentManager.overlay.graphics.addAll(incidentOverlay.graphics);
  }

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

    // Chuyển overlay sang 2D view
    _moveOverlaysToActiveView(is3D: false);
  }

  void switchTo3D(BasemapStyle style) {
    _init3DIfNeeded(style);
    _syncFrom2DTo3D();

    // Chuyển overlay sang 3D view
    _moveOverlaysToActiveView(is3D: true);
  }

  void switchTo2D(BasemapStyle style) {
    initialize2D(style);
    _syncFrom3DTo2D(); // Thêm đồng bộ ngược

    // Chuyển overlay sang 2D view
    _moveOverlaysToActiveView(is3D: false);
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

  /// Bắt đầu theo dõi vị trí thiết bị
  Future<void> startLocation({
    required Function(ArcGISLocation location) onLocationChanged,
    required Function(String error) onError,
  }) async {
    await locationManager.startLocationDisplay(
      display: _mapController.locationDisplay,
      onLocationChanged: onLocationChanged,
      onError: onError,
    );
  }

  /// Dừng theo dõi vị trí thiết bị
  Future<void> stopLocation() async {
    await locationManager.stopLocationDisplay(_mapController.locationDisplay);
  }

  /// Recenter về vị trí hiện tại
  void recenterLocation() {
    locationManager.recenter(_mapController.locationDisplay);
  }

  /// Stream để theo dõi trạng thái Follow (tự động xoay theo vị trí)
  Stream<bool> followLocationState() {
    return locationManager.followState(_mapController.locationDisplay);
  }

  ///
  Future<void> initialize() async {
    await _symbolFactory.preCacheAllSymbols();
  }

  void dispose() {
    incidentManager.dispose(); //  Dọn dẹp lớp hiển thị sự cố
    overlayRegistry.clear(); //  Dọn dẹp tất cả overlays trong registry
    locationManager.dispose(); // 3. Đừng quên dọn dẹp
  }

  Future<void> updateIncidentGraphics(List<Incident> incidents) async {
    await incidentManager.renderIncidents(incidents);
  }

  void _moveOverlaysToActiveView({required bool is3D}) {
    // 1. Tháo overlay ra khỏi CẢ 2 view để tránh lỗi "Already owned"
    _mapController.graphicsOverlays.remove(incidentManager.overlay);
    _sceneController.graphicsOverlays.remove(incidentManager.overlay);

    // 2. Gắn vào view đang active
    if (is3D) {
      _sceneController.graphicsOverlays.add(incidentManager.overlay);
    } else {
      _mapController.graphicsOverlays.add(incidentManager.overlay);
    }
  }
}
