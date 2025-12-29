import 'dart:async';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/map/presentation/providers/base_map_style_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/location_display_providers.dart';
import 'package:smart_route_app/features/map/presentation/widgets/base_map_switcher.dart';
import '../../domain/entities/address_result.dart' as entities;
import '../../domain/entities/route_result.dart' as entities;
import '../../domain/entities/incident.dart' as domain;

class RouteMapWidget extends HookConsumerWidget {
  final List<entities.AddressResult> waypoints;
  final entities.RouteResult? route;
  final Function(double, double)? onMapTap;
  final bool showIncidents;
  final List<domain.Incident> incidents;

  const RouteMapWidget({
    super.key,
    required this.waypoints,
    this.route,
    this.onMapTap,
    this.showIncidents = false,
    this.incidents = const [],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Controllers & Data Sources
    final mapViewController = useMemoized(
      () => ArcGISMapView.createController(),
    );
    final locationDataSource = useMemoized(() => SystemLocationDataSource());

    // Graphics overlays for route and markers
    final routeOverlay = useMemoized(() => GraphicsOverlay());
    final markersOverlay = useMemoized(() => GraphicsOverlay());
    final incidentsOverlay = useMemoized(() => GraphicsOverlay());

    // States
    final isFollowingUser = useState(false);
    final isMapReady = useState(false);

    // Get global location state
    final isGlobalLocationEnabled = ref.read(locationDisplayProviderProvider);

    // Initialize map
    useEffect(() {
      final baseMapStyle = ref.read(baseMapStyleProviderProvider);
      final map = ArcGISMap.withBasemapStyle(baseMapStyle);
      map.minScale = 100000000;
      mapViewController.arcGISMap = map;

      // Add overlays
      mapViewController.graphicsOverlays.add(routeOverlay);
      mapViewController.graphicsOverlays.add(markersOverlay);
      mapViewController.graphicsOverlays.add(incidentsOverlay);

      return () {
        locationDataSource.stop();
        routeOverlay.graphics.clear();
        markersOverlay.graphics.clear();
        incidentsOverlay.graphics.clear();
      };
    }, []);

    // Draw route when route data changes
    useEffect(() {
      if (!isMapReady.value || route == null) return;

      _drawRoute(routeOverlay, route!);
      _drawMarkers(markersOverlay, waypoints);
      _zoomToRoute(mapViewController, route!, waypoints);

      return null;
    }, [route, isMapReady.value]);

    // Draw incidents when showIncidents changes
    useEffect(() {
      if (!isMapReady.value) return;

      if (showIncidents && incidents.isNotEmpty) {
        _drawIncidents(incidentsOverlay, incidents);
      } else {
        incidentsOverlay.graphics.clear();
      }

      return null;
    }, [showIncidents, incidents, isMapReady.value]);

    // Handle My Location button
    Future<void> onMyLocationPressed() async {
      try {
        final locationDisplay = mapViewController.locationDisplay;

        if (!locationDisplay.started) {
          locationDisplay.dataSource = locationDataSource;
          locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;
          await locationDataSource.start();
          locationDisplay.start();

          if (locationDisplay.location != null) {
            await mapViewController.setViewpointCenter(
              locationDisplay.location!.position,
              scale: 10000,
            );
          }
        } else {
          locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;
          final location = locationDisplay.location;
          if (location != null) {
            await mapViewController.setViewpointCenter(
              location.position,
              scale: 10000,
            );
          }
        }
        isFollowingUser.value = true;
      } catch (e) {
        AppLogger.ui("Lỗi bật định vị: $e");
      }
    }

    // Zoom to fit route
    Future<void> onZoomToRoutePressed() async {
      if (route != null) {
        await _zoomToRoute(mapViewController, route!, waypoints);
      }
    }

    // Map ready callback
    void onMapViewReady() async {
      isMapReady.value = true;

      // Listen to autopan mode changes
      mapViewController.locationDisplay.onAutoPanModeChanged.listen((mode) {
        isFollowingUser.value =
            mode == LocationDisplayAutoPanMode.recenter ||
            mode == LocationDisplayAutoPanMode.compassNavigation;
      });

      // Enable location if global setting is on
      if (isGlobalLocationEnabled) {
        try {
          final locationDisplay = mapViewController.locationDisplay;
          if (!locationDisplay.started) {
            locationDisplay.dataSource = locationDataSource;
            await locationDataSource.start();
            locationDisplay.start();
          }
        } catch (e) {
          AppLogger.ui("Route Map: Failed to auto-start GPS: $e");
        }
      }

      // Draw route if already available
      if (route != null) {
        _drawRoute(routeOverlay, route!);
        _drawMarkers(markersOverlay, waypoints);
        await _zoomToRoute(mapViewController, route!, waypoints);
      } else if (waypoints.isNotEmpty) {
        // Zoom to first waypoint if no route yet
        final firstPoint = ArcGISPoint(
          x: waypoints.first.longitude,
          y: waypoints.first.latitude,
          spatialReference: SpatialReference.wgs84,
        );
        await mapViewController.setViewpointCenter(firstPoint, scale: 50000);
      }
    }

    return Stack(
      children: [
        // A. MAP VIEW
        ArcGISMapView(
          controllerProvider: () => mapViewController,
          onMapViewReady: onMapViewReady,
        ),

        // B. BASEMAP SWITCHER
        Positioned(top: 100, right: 16, child: BasemapSwitcher()),

        // C. ZOOM TO ROUTE BUTTON
        Positioned(
          right: 16,
          bottom: 270,
          child: FloatingActionButton(
            heroTag: 'zoom_route_btn',
            mini: true,
            backgroundColor: Colors.white,
            onPressed: onZoomToRoutePressed,
            child: Icon(Icons.zoom_out_map, color: Colors.grey.shade700),
          ),
        ),

        // D. MY LOCATION BUTTON
        Positioned(
          right: 16,
          bottom: 210,
          child: FloatingActionButton(
            heroTag: 'route_gps_btn',
            mini: true,
            backgroundColor: Colors.white,
            onPressed: onMyLocationPressed,
            child: Icon(
              isFollowingUser.value
                  ? Icons.my_location
                  : Icons.location_searching,
              color: isFollowingUser.value ? Colors.blue : Colors.grey.shade700,
            ),
          ),
        ),

        // E. LOADING INDICATOR (when no route yet)
        if (route == null && waypoints.length >= 2)
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.1),
              child: const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Đang tính toán tuyến đường...'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Draw route polyline on map
  void _drawRoute(GraphicsOverlay overlay, entities.RouteResult route) {
    overlay.graphics.clear();

    if (route.routePoints.isEmpty) return;

    // Create polyline from route points
    final points = route.routePoints
        .map(
          (p) => ArcGISPoint(
            x: p.longitude,
            y: p.latitude,
            spatialReference: SpatialReference.wgs84,
          ),
        )
        .toList();

    final polylineBuilder = PolylineBuilder(
      spatialReference: SpatialReference.wgs84,
    );
    for (final point in points) {
      polylineBuilder.addPoint(point);
    }
    final polyline = polylineBuilder.toGeometry();

    // Route line style - Blue color like Google Maps
    final routeSymbol = SimpleLineSymbol(
      style: SimpleLineSymbolStyle.solid,
      color: const Color(0xFF4285F4), // Google Blue
      width: 6,
    );

    // Route outline for better visibility
    final outlineSymbol = SimpleLineSymbol(
      style: SimpleLineSymbolStyle.solid,
      color: const Color(0xFF1A73E8), // Darker blue
      width: 8,
    );

    // Add outline first, then route line on top
    overlay.graphics.add(Graphic(geometry: polyline, symbol: outlineSymbol));
    overlay.graphics.add(Graphic(geometry: polyline, symbol: routeSymbol));
  }

  /// Draw start and end markers only (no labels - street names auto-highlight on zoom)
  void _drawMarkers(
    GraphicsOverlay overlay,
    List<entities.AddressResult> waypoints,
  ) {
    overlay.graphics.clear();

    if (waypoints.isEmpty) return;

    for (int i = 0; i < waypoints.length; i++) {
      final waypoint = waypoints[i];
      final isStart = i == 0;
      final isEnd = i == waypoints.length - 1;

      final point = ArcGISPoint(
        x: waypoint.longitude,
        y: waypoint.latitude,
        spatialReference: SpatialReference.wgs84,
      );

      // Create marker symbol
      final markerSymbol = _createMarkerSymbol(isStart, isEnd, i);
      overlay.graphics.add(Graphic(geometry: point, symbol: markerSymbol));
    }
  }

  /// Create marker symbol based on position
  ArcGISSymbol _createMarkerSymbol(bool isStart, bool isEnd, int index) {
    if (isStart) {
      // Start marker - Blue circle
      return CompositeSymbol(
        symbols: [
          // Outer circle (white border)
          SimpleMarkerSymbol(
            style: SimpleMarkerSymbolStyle.circle,
            color: Colors.white,
            size: 24,
          ),
          // Inner circle (blue)
          SimpleMarkerSymbol(
            style: SimpleMarkerSymbolStyle.circle,
            color: const Color(0xFF4285F4),
            size: 16,
          ),
          // Center dot (white)
          SimpleMarkerSymbol(
            style: SimpleMarkerSymbolStyle.circle,
            color: Colors.white,
            size: 6,
          ),
        ],
      );
    } else if (isEnd) {
      // End marker - Red location pin style
      return CompositeSymbol(
        symbols: [
          // Shadow
          SimpleMarkerSymbol(
            style: SimpleMarkerSymbolStyle.circle,
            color: Colors.black.withValues(alpha: 0.3),
            size: 12,
          ),
          // Pin body (red)
          SimpleMarkerSymbol(
            style: SimpleMarkerSymbolStyle.circle,
            color: const Color(0xFFEA4335), // Google Red
            size: 28,
          ),
          // Inner white circle
          SimpleMarkerSymbol(
            style: SimpleMarkerSymbolStyle.circle,
            color: Colors.white,
            size: 12,
          ),
        ],
      );
    } else {
      // Intermediate waypoint - smaller blue circle
      return CompositeSymbol(
        symbols: [
          SimpleMarkerSymbol(
            style: SimpleMarkerSymbolStyle.circle,
            color: Colors.white,
            size: 18,
          ),
          SimpleMarkerSymbol(
            style: SimpleMarkerSymbolStyle.circle,
            color: const Color(0xFF4285F4),
            size: 12,
          ),
        ],
      );
    }
  }

  /// Zoom map to fit entire route
  Future<void> _zoomToRoute(
    ArcGISMapViewController controller,
    entities.RouteResult route,
    List<entities.AddressResult> waypoints,
  ) async {
    if (route.routePoints.isEmpty && waypoints.isEmpty) return;

    try {
      // Collect all points (route + waypoints)
      final allPoints = <ArcGISPoint>[];

      // Add route points
      for (final p in route.routePoints) {
        allPoints.add(
          ArcGISPoint(
            x: p.longitude,
            y: p.latitude,
            spatialReference: SpatialReference.wgs84,
          ),
        );
      }

      // Add waypoints
      for (final w in waypoints) {
        allPoints.add(
          ArcGISPoint(
            x: w.longitude,
            y: w.latitude,
            spatialReference: SpatialReference.wgs84,
          ),
        );
      }

      if (allPoints.isEmpty) return;

      // Calculate bounding box
      double minX = allPoints.first.x;
      double maxX = allPoints.first.x;
      double minY = allPoints.first.y;
      double maxY = allPoints.first.y;

      for (final point in allPoints) {
        if (point.x < minX) minX = point.x;
        if (point.x > maxX) maxX = point.x;
        if (point.y < minY) minY = point.y;
        if (point.y > maxY) maxY = point.y;
      }

      // Add padding (10%)
      final paddingX = (maxX - minX) * 0.15;
      final paddingY = (maxY - minY) * 0.15;

      final envelope = Envelope.fromXY(
        xMin: minX - paddingX,
        yMin: minY - paddingY,
        xMax: maxX + paddingX,
        yMax: maxY + paddingY,
        spatialReference: SpatialReference.wgs84,
      );

      // Animate to envelope
      await controller.setViewpointGeometry(envelope, paddingInDiPs: 50);
    } catch (e) {
      AppLogger.error('Error zooming to route: $e', name: 'RouteMapWidget');
    }
  }

  /// Draw incidents on map
  void _drawIncidents(
    GraphicsOverlay overlay,
    List<domain.Incident> incidents,
  ) {
    overlay.graphics.clear();

    for (final incident in incidents) {
      final lat = double.tryParse(incident.latitude) ?? 0;
      final lon = double.tryParse(incident.longitude) ?? 0;

      if (lat == 0 || lon == 0) continue;

      final point = ArcGISPoint(
        x: lon,
        y: lat,
        spatialReference: SpatialReference.wgs84,
      );

      final incidentSymbol = _createIncidentSymbol(incident);
      overlay.graphics.add(Graphic(geometry: point, symbol: incidentSymbol));
    }
  }

  /// Create incident marker symbol based on type and severity
  ArcGISSymbol _createIncidentSymbol(domain.Incident incident) {
    final color = _getIncidentColor(incident.type, incident.severity);

    return CompositeSymbol(
      symbols: [
        // Outer warning circle (glow effect)
        SimpleMarkerSymbol(
          style: SimpleMarkerSymbolStyle.circle,
          color: color.withValues(alpha: 0.3),
          size: 36,
        ),
        // Middle circle
        SimpleMarkerSymbol(
          style: SimpleMarkerSymbolStyle.circle,
          color: color.withValues(alpha: 0.6),
          size: 28,
        ),
        // Inner warning triangle
        SimpleMarkerSymbol(
          style: SimpleMarkerSymbolStyle.triangle,
          color: color,
          size: 20,
        ),
        // Center exclamation (white dot)
        SimpleMarkerSymbol(
          style: SimpleMarkerSymbolStyle.circle,
          color: Colors.white,
          size: 6,
        ),
      ],
    );
  }

  /// Get color based on incident type and severity
  Color _getIncidentColor(String type, String severity) {
    // Priority by severity
    switch (severity.toLowerCase()) {
      case 'high':
      case 'severe':
        return Colors.red;
      case 'medium':
      case 'moderate':
        return Colors.orange;
      case 'low':
      case 'minor':
        return Colors.yellow.shade700;
    }

    // Fallback by type
    switch (type.toLowerCase()) {
      case 'accident':
        return Colors.red;
      case 'construction':
        return Colors.orange;
      case 'traffic':
        return Colors.amber;
      case 'weather':
        return Colors.blue;
      case 'road_closure':
        return Colors.red.shade900;
      default:
        return Colors.grey;
    }
  }
}
