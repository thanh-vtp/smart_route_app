import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/map_controller_bundle.dart';

final mapControllerBundleProvider = Provider<MapControllerBundle>((ref) {
  return MapControllerBundle(
    map2D: ArcGISMapView.createController(),
    scene3D: ArcGISSceneView.createController(),
  );
});
