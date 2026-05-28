import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/map_controller_bundle.dart';
import '../engine/map_engine.dart';
import '../engine/map_engine_impl.dart';

final mapControllerBundleProvider = Provider<MapControllerBundle>((ref) {
  return MapControllerBundle(
    map2D: ArcGISMapView.createController(),
    scene3D: ArcGISSceneView.createController(),
  );
});

final mapEngineProvider = Provider<MapEngine>((ref) {
  return MapEngineImpl(ref.read(mapControllerBundleProvider));
});
