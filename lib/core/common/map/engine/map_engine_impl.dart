import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/common/map/controller/map_controller_bundle.dart';
import 'package:smart_route_app/core/common/map/factories/map_object_factory.dart';
import 'map_engine.dart';
import 'map_runtime_state.dart';
import 'viewpoint_sync_manager.dart';

class MapEngineImpl implements MapEngine {
  final MapControllerBundle controllers;

  late final ViewpointSyncManager _syncManager;

  MapRuntimeState _state = MapRuntimeState.initial();

  MapEngineImpl(this.controllers) {
    _syncManager = ViewpointSyncManager(
      mapController: controllers.map2D,
      sceneController: controllers.scene3D,
    );
  }

  @override
  bool get is3DMode => _state.is3DMode;

  @override
  BasemapStyle get currentBasemapStyle => _state.basemapStyle;

  @override
  Future<void> initialize2D({required BasemapStyle basemapStyle}) async {
    if (controllers.map2D.arcGISMap != null) return;

    final map = MapObjectFactory.create2DMap(style: basemapStyle);

    controllers.map2D.arcGISMap = map;

    controllers.map2D.backgroundGrid = MapObjectFactory.createBackgroundGrid(
      basemapStyle,
    );

    _state = _state.copyWith(isInitialized: true, basemapStyle: basemapStyle);
  }

  @override
  Future<void> initialize3D({required BasemapStyle basemapStyle}) async {
    if (controllers.scene3D.arcGISScene != null) return;

    final scene = MapObjectFactory.create3DScene(style: basemapStyle);

    controllers.scene3D.arcGISScene = scene;
  }

  @override
  Future<void> switchTo2D() async {
    _state = _state.copyWith(isSwitchingView: true);

    await sync3DTo2D();

    _state = _state.copyWith(is3DMode: false, isSwitchingView: false);
  }

  @override
  Future<void> switchTo3D() async {
    _state = _state.copyWith(isSwitchingView: true);

    await initialize3D(basemapStyle: _state.basemapStyle);

    await sync2DTo3D();

    _state = _state.copyWith(is3DMode: true, isSwitchingView: false);
  }

  @override
  Future<void> changeBasemap(BasemapStyle style) async {
    final map = controllers.map2D.arcGISMap;

    if (map != null) {
      map.basemap = Basemap.withStyle(style);

      controllers.map2D.backgroundGrid = MapObjectFactory.createBackgroundGrid(
        style,
      );
    }

    final scene = controllers.scene3D.arcGISScene;

    if (scene != null) {
      scene.basemap = Basemap.withStyle(style);
    }

    _state = _state.copyWith(basemapStyle: style);
  }

  @override
  Future<void> sync2DTo3D() {
    return _syncManager.sync2DTo3D();
  }

  @override
  Future<void> sync3DTo2D() {
    return _syncManager.sync3DTo2D();
  }

  @override
  Future<void> setInitialViewpoint(Viewpoint viewpoint) async {
    controllers.map2D.setViewpoint(viewpoint);
  }

  @override
  void dispose() {}
}
