import 'package:arcgis_maps/arcgis_maps.dart';

// Quản lí
// - Highlight marker
// - Clear highlight
// - Không đụng IncidentOverlay
class SelectionOverlayController {
  final GraphicsOverlay overlay;

  Graphic? _selectedGraphic;

  SelectionOverlayController({required this.overlay});

  void selectGraphic({
    required Graphic sourceGraphic,
    required ArcGISSymbol symbol,
  }) {
    clear();

    final graphic = Graphic(geometry: sourceGraphic.geometry, symbol: symbol);

    graphic.zIndex = 9999;

    _selectedGraphic = graphic;

    overlay.graphics.add(graphic);
  }

  void clear() {
    if (_selectedGraphic != null) {
      overlay.graphics.remove(_selectedGraphic!);
      _selectedGraphic = null;
    }
  }

  bool get hasSelection => _selectedGraphic != null;
}
