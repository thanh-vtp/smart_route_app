import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/resources/extensions/build_context.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/data/models/incident_model.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart'
    as domain;
import 'package:smart_route_app/features/incident/presentation/logics/incident_symbol_factory.dart';
import 'package:smart_route_app/features/incident/presentation/models/incident_type_config.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_info_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_mode_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/map_page_notifier.dart';
import 'package:smart_route_app/features/search/presentation/providers/selected_address.dart';

/// Xử lý các tương tác người dùng (Tap, Zoom) trên bản đồ
class MapInteractionLogic {
  // Create a graphics overlay for displaying graphics.
  final _graphicsOverlay = GraphicsOverlay();

  // Create a graphics overlay for location marker
  final _locationMarkerOverlay = GraphicsOverlay();

  /// Highlight incident đã chọn bằng cách đổi symbol
  Graphic? _highlightedGraphic;
  ArcGISSymbol? _originalSymbol;

  void initialize() {
    // Khởi tạo shared LocationMarkerHelper với overlay
    sharedLocationMarkerHelper.initialize(_locationMarkerOverlay);

    // Đăng ký callback để clear highlight khi chuyển bottom sheet
    setClearHighlightCallback(_clearHighlight);
  }

  /// Di chuyển graphics overlay sang view đang active
  void moveGraphicsOverlayToActiveView({
    required MapMode mode,
    required ArcGISMapViewController mapViewController,
    required ArcGISSceneViewController sceneViewController,
  }) {
    // Remove từ cả hai view
    mapViewController.graphicsOverlays.remove(_graphicsOverlay);
    sceneViewController.graphicsOverlays.remove(_graphicsOverlay);
    mapViewController.graphicsOverlays.remove(_locationMarkerOverlay);
    sceneViewController.graphicsOverlays.remove(_locationMarkerOverlay);

    // Thêm vào view đang active
    if (mode == MapMode.map2D) {
      mapViewController.graphicsOverlays.add(_graphicsOverlay);
      mapViewController.graphicsOverlays.add(_locationMarkerOverlay);
    } else {
      sceneViewController.graphicsOverlays.add(_graphicsOverlay);
      sceneViewController.graphicsOverlays.add(_locationMarkerOverlay);
    }
  }

  /// Update GraphicsOverlay với danh sách incidents mới
  Future<void> updateGraphicsOverlay(
    List<domain.Incident> incidents, {
    required ArcGISMapViewController mapViewController,
  }) async {
    if (incidents.isEmpty) {
      _graphicsOverlay.graphics.clear();
      return;
    }

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

        // Tạo và gán symbol tương ứng (đã cached nên instant)
        graphic.symbol = await symbolFactory.getSymbol(config.id);

        // Gán zIndex từ config để kiểm soát thứ tự hiển thị
        graphic.zIndex = config.zIndex;

        // Lưu thông tin incident vào attributes để dùng khi tap
        graphic.attributes['incident_id'] = incident.id;
        newGraphics.add(graphic);
      } catch (e) {
        AppLogger.ui('Error creating graphic for incident ${incident.id}: $e');
      }
    }

    // Update overlay một lần duy nhất
    _graphicsOverlay.graphics.clear();
    _graphicsOverlay.graphics.addAll(newGraphics);

    AppLogger.ui(
      'Updated graphics overlay with ${newGraphics.length} incidents',
    );
  }

  /// Xử lý sự kiện tap trên bản đồ 2D
  Future<void> onMapTap({
    required Offset screenPoint,
    required BuildContext context,
    required WidgetRef ref,
    required bool mounted,
    required ArcGISMapViewController mapViewController,
  }) async {
    try {
      // Thực hiện identify operation để tìm graphic tại vị trí tap
      final identifyResult = await mapViewController.identifyGraphicsOverlay(
        _graphicsOverlay,
        screenPoint: screenPoint,
        tolerance: 12,
      );

      // Nếu có graphic được identify, lấy incident từ state và hiển thị
      if (identifyResult.graphics.isNotEmpty && mounted) {
        final identifiedGraphic = identifyResult.graphics.first;
        final incidentId =
            identifiedGraphic.attributes['incident_id'] as String?;

        if (incidentId != null) {
          // Lấy incident details từ state
          final mapState = ref.read(mapPageNotifierProvider);
          mapState.whenOrNull(
            loaded: (incidents) {
              final incident = incidents.firstWhere(
                (inc) => inc.id == incidentId,
                orElse: () => incidents.first,
              );

              // Zoom to incident và highlight
              _zoomToIncident(
                identifiedGraphic,
                mapViewController: mapViewController,
                context: context,
              );
              _highlightIncident(identifiedGraphic);

              // Hiển thị bottom sheet
              _showIncidentBottomSheet(
                incident,
                context: context,
                ref: ref,
                mounted: mounted,
              );
            },
          );
        }
      } else if (mounted) {
        // Tap vào chỗ trống - clear highlight
        _clearHighlight();
        return;
      }
    } catch (e) {
      AppLogger.ui('Error identifying graphic: $e', error: e);
    }
  }

  /// Zoom map đến vị trí incident
  Future<void> _zoomToIncident(
    Graphic graphic, {
    required ArcGISMapViewController mapViewController,
    required BuildContext context,
  }) async {
    try {
      final geometry = graphic.geometry;
      if (geometry is ArcGISPoint) {
        // 1. Xác định Target Scale
        // Nếu user đang zoom out xa (>10000), zoom vào 8000 cho rõ
        // Nếu user đang zoom in gần (<10000), giữ nguyên scale hiện tại để không làm họ khó chịu
        final currentViewpoint = mapViewController.getCurrentViewpoint(
          ViewpointType.centerAndScale,
        );
        final currentScale = currentViewpoint?.targetScale ?? 10000;
        final targetScale = currentScale > 10000 ? 8000.0 : currentScale;

        // 2. Tính Offset động
        // Chúng ta muốn Marker nằm ở 25% màn hình từ trên xuống (screenRatioY: 0.25)
        // Vì Sheet chiếm 50% dưới, nên 50% trên còn trống -> Tâm là 25%
        final latitudeOffset = _calculateLatitudeOffset(
          context: context,
          targetScale: targetScale,
          screenRatioY: 0.4,
        );

        // --- LOGIC TÍNH TOÁN OFFSET ---
        // Tại scale 5000, 1 độ vĩ độ ~ 111km.
        // Chúng ta cần dịch chuyển tâm bản đồ xuống dưới khoảng 300-400 mét
        // để marker nhảy lên trên khoảng 1/4 màn hình (tránh Bottom Sheet).

        // 0.003 độ ~ 330 mét
        // Ước lượng hoạt động tốt cho mức scale: 5000
        // const double latitudeOffset = 0.0015; // Giảm số để đẩy marker xuống

        // Tạo điểm tâm mới nằm thấp hơn vị trí thật của incident
        // (Giữ nguyên kinh độ x, giảm vĩ độ y)
        final offsetPoint = ArcGISPoint(
          x: geometry.x,
          y: geometry.y - latitudeOffset,
          spatialReference: geometry.spatialReference,
        );

        // Tạo viewpoint với tâm đã dịch chuyển
        final viewpoint = Viewpoint.fromCenter(
          offsetPoint, // Dùng điểm tâm ảo
          scale: 8000, // Zoom level mong muốn
        );

        // Animate mượt mà
        await mapViewController.setViewpointWithDurationAndCurve(
          viewpoint: viewpoint,
          durationSeconds: 0.8, // 0.8 giây là chuẩn Google Maps
          curve: AnimationCurve.easeInOutCubic,
        );

        AppLogger.ui(
          'Zoomed & Offset to incident: ${geometry.y}, ${geometry.x}',
        );
      }
    } catch (e) {
      AppLogger.ui('Error zooming to incident: $e', error: e);
    }
  }

  Future<void> _highlightIncident(Graphic graphic) async {
    try {
      // Clear highlight cũ trước
      _clearHighlight();

      // Lưu symbol gốc
      _originalSymbol = graphic.symbol;
      _highlightedGraphic = graphic;

      // Tạo highlight symbol (marker lớn hơn, màu nổi bật)
      final highlightSymbol = await IncidentSymbolFactory()
          .getHighlightSymbol();

      // Đổi symbol của graphic
      graphic.symbol = highlightSymbol;

      AppLogger.ui('Highlighted incident');
    } catch (e) {
      AppLogger.ui('Error highlighting incident: $e', error: e);
    }
  }

  /// Clear highlight incident
  void _clearHighlight() {
    if (_highlightedGraphic != null && _originalSymbol != null) {
      _highlightedGraphic!.symbol = _originalSymbol;
      _highlightedGraphic = null;
      _originalSymbol = null;
      AppLogger.ui('Cleared incident highlight');
    }
  }

  /// Hiển thị modal bottom sheet với chi tiết sự cố
  void _showIncidentBottomSheet(
    domain.Incident incident, {
    required BuildContext context,
    required WidgetRef ref,
    required bool mounted,
  }) {
    // Sử dụng provider thay vì showModalBottomSheet trực tiếp
    ref.read(mapBottomSheetProvider.notifier).showIncidentDetail(incident);

    // // Show bottom sheet
    // if (mounted) {
    //   context.go('/map-bottom-sheet');
    // }
  }

  /// Xử lý sự kiện long press end trên bản đồ 2D
  Future<void> onMapLongPressEnd({
    required Offset screenPoint,
    required bool mounted,
    required ArcGISMapViewController mapViewController,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    try {
      if (mounted) {
        // Lấy thông tin vị trí tap
        final mapPoint = mapViewController.screenToLocation(
          screen: screenPoint,
        );

        if (mapPoint != null) {
          // Chuyển tọa độ sang WGS84
          final wgs84Point =
              GeometryEngine.project(
                    mapPoint,
                    outputSpatialReference: SpatialReference.wgs84,
                  )
                  as ArcGISPoint?;

          if (wgs84Point != null) {
            // Vẽ marker tại vị trí gốc (mapPoint) để hiển thị đúng trên map
            _addLocationMarker(mapPoint);

            // Zoom và recenter đến vị trí long press
            await _zoomToLongPressLocation(
              mapPoint,
              mapViewController: mapViewController,
              context: context,
            );

            // Hiển thị thông tin tọa độ (dùng điểm WGS84)
            _showLocationInfo(
              wgs84Point.y,
              wgs84Point.x,
              context: context,
              ref: ref,
              mapViewController: mapViewController,
              sceneViewController: null,
              mounted: mounted,
            );
          }
        }
      }
    } catch (e) {
      AppLogger.ui('Error identifying graphic: $e', error: e);
    }
  }

  /// Tính toán độ lệch Vĩ độ (Latitude) để đưa điểm target vào vùng hiển thị mong muốn
  /// [context] - Để lấy chiều cao màn hình
  /// [targetScale] - Mức zoom đích (ví dụ 8000)
  /// [screenRatioY] - Vị trí Y mong muốn trên màn hình (0.0 - 1.0).
  ///                  0.25 nghĩa là điểm đó sẽ nằm ở 1/4 màn hình từ trên xuống (giữa phần trống).
  double _calculateLatitudeOffset({
    required BuildContext context,
    required double targetScale,
    double screenRatioY = 0.25,
  }) {
    // 1. Lấy chiều cao màn hình (logical pixels)
    final screenHeight = context.height;

    // 2. Tính khoảng cách pixel từ tâm màn hình (0.5) đến điểm mong muốn
    // Ví dụ: Muốn nằm ở 0.25, thì lệch 0.25 so với tâm 0.5
    // Chúng ta cần dịch Map Center xuống dưới (Latitude giảm) để điểm Target chạy lên trên
    final pixelOffset = screenHeight * (0.5 - screenRatioY);

    // 3. Tính độ phân giải (Meters per Pixel) tại Scale đích
    // Công thức: Resolution = Scale / (DPI * InchesPerMeter)
    // Flutter logical DPI ~ 96, 1 meter = 39.37 inches
    // Constant = 96 * 39.37 ≈ 3780
    final resolution = targetScale / 3780;

    // 4. Đổi Pixel sang Mét
    final metersOffset = pixelOffset * resolution;

    // 5. Đổi Mét sang Độ Vĩ Độ (Degrees Latitude)
    // 1 độ vĩ độ ≈ 111,320 mét
    final degreesOffset = metersOffset / 111320;

    return degreesOffset;
  }

  /// Zoom và recenter map đến vị trí long press
  Future<void> _zoomToLongPressLocation(
    ArcGISPoint point, {
    required ArcGISMapViewController mapViewController,
    required BuildContext context,
  }) async {
    try {
      // 1. Xác định Target Scale
      // Nếu user đang zoom out xa (>10000), zoom vào 8000 cho rõ
      // Nếu user đang zoom in gần (<10000), giữ nguyên scale hiện tại để không làm họ khó chịu
      final currentViewpoint = mapViewController.getCurrentViewpoint(
        ViewpointType.centerAndScale,
      );
      final currentScale = currentViewpoint?.targetScale ?? 10000;
      final targetScale = currentScale > 10000 ? 8000.0 : currentScale;

      // 2. Tính Offset động
      // Chúng ta muốn Marker nằm ở 25% màn hình từ trên xuống (screenRatioY: 0.25)
      // Vì Sheet chiếm 50% dưới, nên 50% trên còn trống -> Tâm là 25%
      final latitudeOffset = _calculateLatitudeOffset(
        context: context,
        targetScale: targetScale,
        screenRatioY: 0.3,
      );

      // Offset để marker nằm phía trên bottom sheet (khoảng 1/4 màn hình từ trên)
      // Tại scale 5000, 0.0015 độ ~ 165 mét
      // const double latitudeOffset = 0.0015;

      // Chuyển sang WGS84 để tính offset
      final wgs84Point =
          GeometryEngine.project(
                point,
                outputSpatialReference: SpatialReference.wgs84,
              )
              as ArcGISPoint?;

      if (wgs84Point == null) return;

      // 4. Tạo tâm ảo (Virtual Center) thấp hơn điểm thật
      // Trừ đi offset để tâm map chạy xuống nam -> điểm marker chạy lên bắc (lên trên)
      final offsetPoint = ArcGISPoint(
        x: wgs84Point.x,
        y: wgs84Point.y - latitudeOffset,
        spatialReference: SpatialReference.wgs84,
      );

      // Tạo viewpoint với tâm đã dịch chuyển
      final viewpoint = Viewpoint.fromCenter(offsetPoint, scale: targetScale);

      // Animate mượt mà
      await mapViewController.setViewpointWithDurationAndCurve(
        viewpoint: viewpoint,
        durationSeconds:
            0.6, // 0.6 giây cho long press (nhanh hơn tap incident)
        curve: AnimationCurve.easeOutCubic,
      );

      AppLogger.ui(
        'Zoomed to long press location: ${wgs84Point.y}, ${wgs84Point.x}, scale: $targetScale',
      );
    } catch (e) {
      AppLogger.ui('Error zooming to long press location: $e', error: e);
    }
  }

  /// Thêm marker tạm thời tại vị trí được chọn
  Future<void> _addLocationMarker(ArcGISPoint point) async {
    await sharedLocationMarkerHelper.addMarker(point);
  }

  /// Hiển thị thông tin vị trí khi long press/tap vào map (không phải incident)
  /// Dùng provider để hiển thị DraggableScrollableSheet trong widget tree
  void _showLocationInfo(
    double latitude,
    double longitude, {
    required BuildContext context,
    required WidgetRef ref,
    ArcGISMapViewController? mapViewController,
    ArcGISSceneViewController? sceneViewController,
    required bool mounted,
  }) {
    // Tìm incident gần vị trí long press (trong bán kính ~100m)
    final nearbyIncident = _findNearbyIncident(latitude, longitude, ref);

    // Update selectedAddressProvider với tọa độ (sẽ reverse geocode sau trong LocationInfoDraggableSheet)
    ref
        .read(selectedAddressProvider.notifier)
        .setAddress(latitude: latitude, longitude: longitude);

    // Update provider để hiển thị bottom sheet (kèm incident nếu có)
    ref
        .read(locationInfoProvider.notifier)
        .show(latitude, longitude, nearbyIncident: nearbyIncident);

    // // Show bottom sheet
    // if (mounted) {
    //   context.go('/map-bottom-sheet');
    // }
  }

  /// Tìm incident gần vị trí được chọn (trong bán kính ~100m)
  domain.Incident? _findNearbyIncident(
    double latitude,
    double longitude,
    WidgetRef ref,
  ) {
    const double thresholdMeters = 100; // Bán kính tìm kiếm 100m
    const double metersPerDegree = 111320; // ~111km per degree at equator

    final mapState = ref.read(mapPageNotifierProvider);
    domain.Incident? nearestIncident;
    double minDistance = double.infinity;

    mapState.whenOrNull(
      loaded: (incidents) {
        for (final incident in incidents) {
          try {
            final incLat = double.parse(incident.latitude);
            final incLon = double.parse(incident.longitude);

            // Tính khoảng cách đơn giản (Euclidean approximation)
            final dLat = (latitude - incLat) * metersPerDegree;
            final dLon =
                (longitude - incLon) *
                metersPerDegree *
                _cosine(latitude * 3.14159 / 180);
            final distance = _sqrt(dLat * dLat + dLon * dLon);

            if (distance < thresholdMeters && distance < minDistance) {
              minDistance = distance;
              nearestIncident = incident;
            }
          } catch (e) {
            // Skip invalid coordinates
          }
        }
      },
    );

    return nearestIncident;
  }

  /// Simple cosine approximation
  double _cosine(double x) {
    // Taylor series approximation for cos(x)
    return 1 - (x * x) / 2 + (x * x * x * x) / 24;
  }

  /// Simple square root using Newton's method
  double _sqrt(double x) {
    if (x <= 0) return 0;
    double guess = x / 2;
    for (int i = 0; i < 10; i++) {
      guess = (guess + x / guess) / 2;
    }
    return guess;
  }

  /// Xử lý sự kiện tap trên scene 3D
  Future<void> onSceneTap({
    required Offset screenPoint,
    required bool mounted,
    required BuildContext context,
    required WidgetRef ref,
    required ArcGISSceneViewController sceneViewController,
  }) async {
    try {
      // Thực hiện identify operation để tìm graphic tại vị trí tap trong 3D scene
      final identifyResult = await sceneViewController.identifyGraphicsOverlay(
        _graphicsOverlay,
        screenPoint: screenPoint,
        tolerance: 12,
      );

      // Nếu có graphic được identify, lấy incident từ state và hiển thị
      if (identifyResult.graphics.isNotEmpty && mounted) {
        final identifiedGraphic = identifyResult.graphics.first;
        final incidentId =
            identifiedGraphic.attributes['incident_id'] as String?;

        if (incidentId != null) {
          // Lấy incident details từ state
          final mapState = ref.read(mapPageNotifierProvider);
          mapState.whenOrNull(
            loaded: (incidents) {
              final incident = incidents.firstWhere(
                (inc) => inc.id == incidentId,
                orElse: () => incidents.first,
              );
              _showIncidentBottomSheet(
                incident,
                context: context,
                ref: ref,
                mounted: mounted,
              );
            },
          );
        }
      } else if (mounted) {
        // Không có graphic, lấy thông tin vị trí tap
        final scenePoint = sceneViewController.screenToBaseSurface(
          screen: screenPoint,
        );

        if (scenePoint != null) {
          // Chuyển tọa độ sang WGS84
          final wgs84Point =
              GeometryEngine.project(
                    scenePoint,
                    outputSpatialReference: SpatialReference.wgs84,
                  )
                  as ArcGISPoint?;
          if (wgs84Point != null) {
            _addLocationMarker(scenePoint);

            // Zoom và recenter scene đến vị trí tap
            await _zoomToLongPressLocationScene(
              wgs84Point,
              sceneViewController: sceneViewController,
            );

            _showLocationInfo(
              wgs84Point.y,
              wgs84Point.x,
              context: context,
              ref: ref,
              mapViewController: null,
              sceneViewController: sceneViewController,
              mounted: mounted,
            );
          }
        }
      }
    } catch (e) {
      AppLogger.ui('Error identifying graphic in 3D scene: $e', error: e);
    }
  }

  /// Zoom và recenter scene 3D đến vị trí tap/long press
  Future<void> _zoomToLongPressLocationScene(
    ArcGISPoint wgs84Point, {
    required ArcGISSceneViewController sceneViewController,
  }) async {
    try {
      // Offset để marker nằm phía trên bottom sheet
      const double latitudeOffset = 0.0015;

      // Tạo điểm tâm mới nằm thấp hơn vị trí thật
      final offsetPoint = ArcGISPoint(
        x: wgs84Point.x,
        y: wgs84Point.y - latitudeOffset,
        spatialReference: SpatialReference.wgs84,
      );

      // Lấy scale hiện tại
      final currentViewpoint = sceneViewController.getCurrentViewpoint(
        ViewpointType.centerAndScale,
      );
      final currentScale = currentViewpoint?.targetScale ?? 10000;

      // Nếu scale > 10000, zoom vào scale 8000
      final targetScale = currentScale > 10000 ? 8000.0 : currentScale;

      // Tạo viewpoint với tâm đã dịch chuyển
      final viewpoint = Viewpoint.fromCenter(offsetPoint, scale: targetScale);

      // Set viewpoint cho Scene 3D
      await sceneViewController.setViewpointAnimated(viewpoint, duration: 0.6);

      AppLogger.ui(
        'Zoomed scene to location: ${wgs84Point.y}, ${wgs84Point.x}, scale: $targetScale',
      );
    } catch (e) {
      AppLogger.ui('Error zooming scene to location: $e', error: e);
    }
  }
}
