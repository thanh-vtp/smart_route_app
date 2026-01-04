import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scene_controller_provider.g.dart';

@riverpod
ArcGISSceneViewController sceneController(SceneControllerRef ref) {
  final controller = ArcGISSceneView.createController();

  ref.onDispose(() {
    // controller.dispose();
  });

  return controller;
}
