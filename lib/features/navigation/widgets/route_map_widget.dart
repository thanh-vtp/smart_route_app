import 'dart:async';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/data/models/incident_model.dart';
import 'package:smart_route_app/features/incident/presentation/logics/incident_symbol_factory.dart';
import 'package:smart_route_app/features/incident/presentation/logics/map_location_logic.dart';
import 'package:smart_route_app/features/incident/presentation/models/incident_type_config.dart';
import 'package:smart_route_app/features/incident/presentation/providers/base_map_style_providers.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_display_providers.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/base_map_switcher.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import '../domain/entities/route_result.dart' as entities;
import '../../incident/domain/entities/incident.dart' as domain;

class RouteMapWidget extends HookConsumerWidget {
  final List<AddressResult>
  waypoints; // Danh sách các điểm dừng (Điểm đi và Điểm đến).
  final entities.RouteResult? route; // Đường đi trả về từ API
  final Function(double, double)? onMapTap;
  final bool showIncidents; // Sự cố trên bản đồ
  final List<domain.Incident>
  incidents; // Danh sách sự cố để hiển thị từ API (returnBarriers)

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
    final mapLocationLogic = useMemoized(() => MapLocationLogic());

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
        mapLocationLogic.dispose();
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
        // Dùng async function để vẽ incidents với ArcGISImage
        _updateIncidentsOverlay(
          incidentsOverlay,
          incidents,
          displaySize: 24.0, // Kích thước nhỏ hơn map chính
        );
      } else {
        incidentsOverlay.graphics.clear();
      }

      return null;
    }, [showIncidents, incidents, isMapReady.value]);

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
            locationDisplay.dataSource = mapLocationLogic.locationDataSource;
            await mapLocationLogic.locationDataSource.start();
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
            onPressed: () => mapLocationLogic.onMyLocationPressed(
              mapViewController: mapViewController,
              isFollowingUser: isFollowingUser,
            ),
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
  void _drawMarkers(GraphicsOverlay overlay, List<AddressResult> waypoints) {
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

  /// Create marker symbol based on position (start, end, intermediate)
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
    List<AddressResult> waypoints,
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

  /// Update GraphicsOverlay với danh sách incidents (dùng ArcGISImage)
  /// [displaySize] - Kích thước hiển thị marker (nhỏ hơn map chính)
  Future<void> _updateIncidentsOverlay(
    GraphicsOverlay overlay,
    List<domain.Incident> incidents, {
    double displaySize = 24.0, // Nhỏ hơn map chính (32.0)
  }) async {
    overlay.graphics.clear();

    if (incidents.isEmpty) return;

    // Factory instance - symbols đã được pre-cache nên sẽ rất nhanh
    final symbolFactory = IncidentSymbolFactory();

    // Tạo list graphics mới
    final List<Graphic> newGraphics = [];

    // Xử lý tuần tự để không block main thread quá lâu
    for (final incident in incidents) {
      try {
        final incidentModel = IncidentModel.fromEntity(incident);
        final graphic = incidentModel.toGraphic();

        // Lấy config type để tạo symbol
        final config = IncidentTypes.getById(incident.type);

        // Tạo và gán symbol tương ứng với kích thước nhỏ hơn
        graphic.symbol = await symbolFactory.getSymbol(
          config.id,
          displaySize: displaySize,
        );

        // Gán zIndex từ config để kiểm soát thứ tự hiển thị
        graphic.zIndex = config.zIndex;

        // Lưu thông tin incident vào attributes để dùng khi tap
        graphic.attributes['incident_id'] = incident.id;
        newGraphics.add(graphic);
      } catch (e) {
        AppLogger.error(
          'Error creating graphic for incident ${incident.id}: $e',
          name: 'RouteMapWidget',
        );
      }
    }

    // Update overlay một lần duy nhất
    overlay.graphics.addAll(newGraphics);

    AppLogger.ui(
      'Route map: Updated incidents overlay with ${newGraphics.length} incidents',
    );
  }
}
