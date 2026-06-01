import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';

class RouteOverlayController {
  final GraphicsOverlay overlay;

  Graphic? _routeGraphic;

  RouteOverlayController({required this.overlay});

  Future<void> drawRoute(Polyline routeLine) async {
    clear();

    final symbol = SimpleLineSymbol(
      style: SimpleLineSymbolStyle.solid,
      color: Colors.blue,
      width: 6,
    );

    final graphic = Graphic(geometry: routeLine, symbol: symbol);

    overlay.graphics.add(graphic);

    _routeGraphic = graphic;
  }

  void clear() {
    overlay.graphics.clear();
    _routeGraphic = null;
  }
}
