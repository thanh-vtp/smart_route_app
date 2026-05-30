import 'package:arcgis_maps/arcgis_maps.dart';

abstract interface class MapEngine {
  /// Initialize default 2D map
  Future<void> initialize2D({required BasemapStyle basemapStyle});

  /// Initialize default 3D scene
  Future<void> initialize3D({required BasemapStyle basemapStyle});

  /// Switch active mode
  Future<void> switchTo2D();

  Future<void> switchTo3D();

  /// Basemap management
  Future<void> changeBasemap(BasemapStyle style);

  /// Camera/Viewpoint sync
  Future<void> sync2DTo3D();

  Future<void> sync3DTo2D();

  /// Initial viewpoint
  Future<void> setInitialViewpoint(Viewpoint viewpoint);

  /// Current state
  bool get is3DMode;

  BasemapStyle get currentBasemapStyle;
}
