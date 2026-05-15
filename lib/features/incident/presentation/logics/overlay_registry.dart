import 'package:arcgis_maps/arcgis_maps.dart';

class GraphicsOverlayRegistry {
  final Map<String, GraphicsOverlay> _overlays = {};

  GraphicsOverlay getOrCreate(String key) {
    return _overlays.putIfAbsent(key, () => GraphicsOverlay());
  }

  List<GraphicsOverlay> get all => _overlays.values.toList();

  void clear() {
    for (final overlay in _overlays.values) {
      overlay.graphics.clear();
    }

    _overlays.clear();
  }
}
