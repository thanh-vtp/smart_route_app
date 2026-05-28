import 'package:arcgis_maps/arcgis_maps.dart';

class ViewpointSyncManager {
  final ArcGISMapViewController mapController;
  final ArcGISSceneViewController sceneController;

  ViewpointSyncManager({
    required this.mapController,
    required this.sceneController,
  });

  Future<void> sync2DTo3D() async {
    final viewpoint = mapController.getCurrentViewpoint(
      ViewpointType.centerAndScale,
    );

    if (viewpoint == null) return;

    sceneController.setViewpoint(viewpoint);
  }

  Future<void> sync3DTo2D() async {
    final viewpoint = sceneController.getCurrentViewpoint(
      ViewpointType.centerAndScale,
    );

    if (viewpoint == null) return;

    mapController.setViewpoint(viewpoint);
  }
}
