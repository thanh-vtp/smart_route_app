import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart'
    as route_entity;

class RouteOverlayController {
  final GraphicsOverlay routeOverlay;

  final GraphicsOverlay navigationOverlay;

  RouteOverlayController({
    required this.routeOverlay,
    required this.navigationOverlay,
  });

  Future<void> renderRoute(route_entity.RouteResult route) async {
    clear();

    if (route.polylinePoints.isEmpty) return;

    final polyline = _buildPolyline(route.polylinePoints);

    await _drawPolyline(polyline);

    await _drawStartEnd(route);
  }

  Polyline _buildPolyline(List<route_entity.RoutePoint> points) {
    final builder = PolylineBuilder(spatialReference: SpatialReference.wgs84);
    for (final point in points) {
      builder.addPoint(ArcGISPoint(x: point.lng, y: point.lat));
    }

    return builder.toGeometry() as Polyline;
  }

  Future<void> _drawPolyline(Polyline polyline) async {
    final symbol = SimpleLineSymbol(
      style: SimpleLineSymbolStyle.solid,
      color: Colors.blue,
      width: 6,
    );

    final graphic = Graphic(geometry: polyline, symbol: symbol);

    graphic.zIndex = 100;

    routeOverlay.graphics.add(graphic);
  }

  Future<void> _drawStartEnd(route_entity.RouteResult route) async {
    final start = route.polylinePoints.first;
    final end = route.polylinePoints.last;

    final startPoint = ArcGISPoint(
      x: start.lng,
      y: start.lat,
      spatialReference: SpatialReference.wgs84,
    );

    final endPoint = ArcGISPoint(
      x: end.lng,
      y: end.lat,
      spatialReference: SpatialReference.wgs84,
    );

    final startGraphic = Graphic(
      geometry: startPoint,
      symbol: SimpleMarkerSymbol(
        style: SimpleMarkerSymbolStyle.circle,
        color: Colors.green,
        size: 14,
      ),
    );

    final endGraphic = Graphic(
      geometry: endPoint,
      symbol: SimpleMarkerSymbol(
        style: SimpleMarkerSymbolStyle.circle,
        color: Colors.red,
        size: 14,
      ),
    );

    startGraphic.zIndex = 200;
    endGraphic.zIndex = 200;

    navigationOverlay.graphics.add(startGraphic);
    navigationOverlay.graphics.add(endGraphic);
  }

  void clear() {
    routeOverlay.graphics.clear();

    navigationOverlay.graphics.clear();
  }
}
