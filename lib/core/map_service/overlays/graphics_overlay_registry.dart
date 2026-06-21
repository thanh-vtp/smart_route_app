import 'package:arcgis_maps/arcgis_maps.dart';

/// Registry để quản lý các GraphicsOverlay theo key ('incidents', 'locationMarker')
/// typed API
/// remove overlay
/// attach/detach
/// visibility support
class GraphicsOverlayRegistry {
  final Map<String, GraphicsOverlay> _overlays = {};

  GraphicsOverlay getOrCreate(String id) {
    return _overlays.putIfAbsent(id, () => GraphicsOverlay());
  }

  GraphicsOverlay? get(String id) {
    return _overlays[id];
  }

  bool contains(String id) {
    return _overlays.containsKey(id);
  }

  void remove(String id) {
    final overlay = _overlays.remove(id);

    overlay?.graphics.clear();
  }

  void clear() {
    for (final overlay in _overlays.values) {
      overlay.graphics.clear();
    }

    _overlays.clear();
  }

  List<GraphicsOverlay> get all {
    return _overlays.values.toList();
  }
}

// Incident overlay
// Route overlay
// Navigation overlay
// Heatmap overlay
// Cluster overlay
