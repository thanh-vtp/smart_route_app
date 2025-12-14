import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/map/data/models/incident_model.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart'
    as domain;
import 'package:smart_route_app/features/map/presentation/helpers/location_marker_helper.dart';
import 'package:smart_route_app/features/map/presentation/models/incident_symbol_factory.dart';
import 'package:smart_route_app/features/map/presentation/models/incident_type_config.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/map_page_notifier.dart';
import 'package:smart_route_app/features/map/presentation/widgets/add_incident_bottom_sheet.dart';
import 'package:smart_route_app/features/map/presentation/widgets/incident_detail_bottom_sheet.dart';
import 'package:smart_route_app/features/map/presentation/widgets/location_info_bottom_sheet.dart';

/// Xử lý các tương tác người dùng (Tap, Zoom) trên bản đồ
class MapInteractionLogic {
  // Create a graphics overlay for displaying graphics.
  final _graphicsOverlay = GraphicsOverlay();

  // Create a graphics overlay for location marker
  final _locationMarkerOverlay = GraphicsOverlay();

  // Helper để quản lý location marker
  final _locationMarkerHelper = LocationMarkerHelper();

  /// Highlight incident đã chọn bằng cách đổi symbol
  Graphic? _highlightedGraphic;
  ArcGISSymbol? _originalSymbol;

  void initialize() {
    // Khởi tạo LocationMarkerHelper với overlay
    _locationMarkerHelper.initialize(_locationMarkerOverlay);
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
  void updateGraphicsOverlay(
    List<domain.Incident> incidents, {
    required ArcGISMapViewController mapViewController,
  }) async {
    if (incidents.isEmpty) {
      _graphicsOverlay.graphics.clear();
      return;
    }

    // Factory instance
    final symbolFactory = IncidentSymbolFactory();

    // Convert từ Incident entities sang Graphics và thêm vào overlay
    // dùng Future.wait để tạo tất cả graphic cùng lúc
    final List<Graphic?> results = await Future.wait(
      incidents.map((incident) async {
        try {
          final incidentModel = IncidentModel.fromEntity(incident);
          final graphic = incidentModel.toGraphic();

          // Lấy config type để tạo symbol
          final config = IncidentTypes.getByDisplayName(incident.type);

          // Tạo và gán symbol tương ứng
          graphic.symbol = await symbolFactory.getSymbol(config.id);

          // Gán zIndex từ config để kiểm soát thứ tự hiển thị
          // zIndex cao hơn sẽ hiển thị trên cùng
          graphic.zIndex = config.zIndex;

          // Lưu thông tin incident vào attributes để dùng khi tap
          graphic.attributes['incident_id'] = incident.id;
          return graphic;
        } catch (e) {
          AppLogger.ui(
            'Error creating graphic for incident ${incident.id}: $e',
          );
          return null;
        }
      }),
    );

    // Lọc bỏ các graphic bị null (nếu có lỗi)
    final newGraphics = results.whereType<Graphic>().toList();

    // Update overlay
    _graphicsOverlay.graphics.clear();
    _graphicsOverlay.graphics.addAll(newGraphics);

    AppLogger.ui(
      'Updated graphics overlay with ${newGraphics.length} incidents',
    );

    // Fix lỗi Incident ở Mỹ mà màn hình ở VN thì không thấy gì
    _zoomToGraphicsExtent(mapViewController: mapViewController);
  }

  // Zoom to fit all graphics in the overlay
  void _zoomToGraphicsExtent({
    required ArcGISMapViewController mapViewController,
  }) {
    try {
      if (_graphicsOverlay.graphics.isNotEmpty) {
        // Lấy extent bao phủ tất cả các điểm
        final extent = _graphicsOverlay.extent;

        if (extent != null) {
          // Kiểm tra xem controller nào đang active (2D hay 3D)
          if (mapViewController.arcGISMap != null) {
            // Logic check đơn giản
            // Padding 50px để các điểm không nằm sát mép
            mapViewController.setViewpointGeometry(extent, paddingInDiPs: 50);
          }
          // Nếu bạn có logic switch controller, hãy dùng controller đang active
        }
      }
    } catch (e) {
      // Ignore lỗi nếu extent tính toán sai (vd chỉ có 1 điểm)
      AppLogger.ui('Auto zoom failed: $e');
    }
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
            loaded: (incidents, _) {
              final incident = incidents.firstWhere(
                (inc) => inc.id == incidentId,
                orElse: () => incidents.first,
              );

              // Zoom to incident và highlight
              _zoomToIncident(
                identifiedGraphic,
                mapViewController: mapViewController,
              );
              _highlightIncident(identifiedGraphic);

              // Hiển thị bottom sheet
              _showIncidentBottomSheet(incident, context: context);
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
  }) async {
    try {
      final geometry = graphic.geometry;
      if (geometry is ArcGISPoint) {
        // --- LOGIC TÍNH TOÁN OFFSET ---
        // Tại scale 5000, 1 độ vĩ độ ~ 111km.
        // Chúng ta cần dịch chuyển tâm bản đồ xuống dưới khoảng 300-400 mét
        // để marker nhảy lên trên khoảng 1/4 màn hình (tránh Bottom Sheet).

        // 0.003 độ ~ 330 mét
        // Ước lượng hoạt động tốt cho mức scale: 5000
        const double latitudeOffset = 0.0015; // Giảm số để đẩy marker xuống

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
        await mapViewController.setViewpointAnimated(
          viewpoint,
          duration: 0.8, // 0.8 giây là chuẩn Google Maps
          // curve: AnimationCurve.easeInOut, // Hiệu ứng tăng giảm tốc
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
      final highlightSymbol = await _createHighlightSymbol();

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

  /// Tạo highlight symbol (marker lớn hơn)
  Future<ArcGISSymbol> _createHighlightSymbol() async {
    try {
      // Load marker image từ assets
      final image = await ArcGISImage.fromAsset(
        'assets/icons/location_marker.png',
      );

      // Tạo picture marker lớn hơn bình thường
      return PictureMarkerSymbol.withImage(image)
        ..width =
            50 // Lớn hơn symbol thường (40)
        ..height = 50
        ..offsetY = 25; // Offset để pin trỏ đúng vị trí
    } catch (e) {
      AppLogger.ui('Error creating highlight symbol: $e', error: e);
      // Fallback: dùng SimpleMarkerSymbol màu vàng
      return SimpleMarkerSymbol(
          style: SimpleMarkerSymbolStyle.circle,
          color: Colors.yellow,
          size: 24,
        )
        ..outline = SimpleLineSymbol(
          style: SimpleLineSymbolStyle.solid,
          color: Colors.orange,
          width: 3,
        );
    }
  }

  /// Hiển thị modal bottom sheet với chi tiết sự cố
  void _showIncidentBottomSheet(
    domain.Incident incident, {
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => IncidentDetailBottomSheet(incident: incident),
    ).then((_) {
      // Clear highlight khi đóng bottom sheet
      _clearHighlight();
    });
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
        // Llấy thông tin vị trí tap
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

            // Nhưng hiển thị thông tin tọa độ thì dùng điểm WGS84 (wgs84Point)
            _showLocationInfo(
              wgs84Point.y,
              wgs84Point.x,
              context: context,
              ref: ref,
              mapViewController: mapViewController,
              sceneViewController: null,
            );
          }
        }
      }
    } catch (e) {
      AppLogger.ui('Error identifying graphic: $e', error: e);
    }
  }

  /// Thêm marker tạm thời tại vị trí được chọn
  Future<void> _addLocationMarker(ArcGISPoint point) async {
    await _locationMarkerHelper.addMarker(point);
  }

  /// Hiển thị thông tin vị trí khi tap vào map (không phải incident)
  void _showLocationInfo(
    double latitude,
    double longitude, {
    required BuildContext context,
    required WidgetRef ref,
    ArcGISMapViewController? mapViewController,
    ArcGISSceneViewController? sceneViewController,
  }) {
    final mapMode = ref.read(mapModeProviderProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LocationInfoBottomSheet(
        initialLatitude: latitude,
        initialLongitude: longitude,
        mapViewController: mapMode == MapMode.map2D ? mapViewController : null,
        sceneViewController: mapMode == MapMode.scene3D
            ? sceneViewController
            : null,
        title: 'Thông tin vị trí',
        description: 'Tọa độ của điểm bạn chạm vào',
        onReport: () {
          // Hiển thị form báo cáo với tọa độ cố định tại vị trí marker
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => AddIncidentBottomSheet(
              latitude: latitude,
              longitude: longitude,
            ),
          );
        },
      ),
    ).then((_) {
      // Xóa marker khi đóng bottom sheet
      _removeLocationMarker();
    });
  }

  /// Xóa location marker
  void _removeLocationMarker() {
    _locationMarkerHelper.removeMarker();
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
            loaded: (incidents, _) {
              final incident = incidents.firstWhere(
                (inc) => inc.id == incidentId,
                orElse: () => incidents.first,
              );
              _showIncidentBottomSheet(incident, context: context);
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
            _showLocationInfo(
              wgs84Point.y,
              wgs84Point.x,
              context: context,
              ref: ref,
              mapViewController: null,
              sceneViewController: sceneViewController,
            );
          }
        }
      }
    } catch (e) {
      AppLogger.ui('Error identifying graphic in 3D scene: $e', error: e);
    }
  }
}
