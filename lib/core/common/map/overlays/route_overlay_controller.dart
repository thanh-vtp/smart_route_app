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

  /// Render multiple alternative routes with different visual styles
  Future<void> renderAlternativeRoutes({
    required route_entity.RouteResult recommendedRoute,
    required List<route_entity.RouteAlternative> alternatives,
    required route_entity.RouteStrategy selectedStrategy,
  }) async {
    clear();

    // Tạo map tất cả routes với strategy
    final allRoutes =
        <
          ({
            route_entity.RouteStrategy strategy,
            route_entity.RouteResult route,
          })
        >[
          (
            strategy: route_entity.RouteStrategy.balanced,
            route: recommendedRoute,
          ),
          ...alternatives.map(
            (alt) => (strategy: alt.strategy, route: alt.route),
          ),
        ];

    // Vẽ tất cả routes
    for (final item in allRoutes) {
      if (item.route.polylinePoints.isEmpty) continue;

      final polyline = _buildPolyline(item.route.polylinePoints);
      final isSelected = item.strategy == selectedStrategy;

      await _drawPolyline(
        polyline,
        color: isSelected ? Colors.blue : Colors.grey.withOpacity(0.6),
        width: isSelected ? 6 : 4,
        zIndex: isSelected ? 100 : 50,
      );
    }

    // Vẽ start/end markers (highest z-index)
    await _drawStartEnd(recommendedRoute);
  }

  Polyline _buildPolyline(List<route_entity.RoutePoint> points) {
    final builder = PolylineBuilder(spatialReference: SpatialReference.wgs84);
    for (final point in points) {
      builder.addPoint(ArcGISPoint(x: point.lng, y: point.lat));
    }

    return builder.toGeometry() as Polyline;
  }

  Future<void> _drawPolyline(
    Polyline polyline, {
    Color color = Colors.blue,
    double width = 6,
    int zIndex = 100,
  }) async {
    final symbol = SimpleLineSymbol(
      style: SimpleLineSymbolStyle.solid,
      color: color,
      width: width,
    );

    final graphic = Graphic(geometry: polyline, symbol: symbol);

    graphic.zIndex = zIndex;

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
