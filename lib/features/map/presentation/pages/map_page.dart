import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/map/data/models/incident_model.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart'
    as domain;
import 'package:smart_route_app/features/map/presentation/helpers/location_marker_helper.dart';
import 'package:smart_route_app/features/map/presentation/helpers/map_configuration_helper.dart';
import 'package:smart_route_app/features/map/presentation/models/incident_symbol_factory.dart';
import 'package:smart_route_app/features/map/presentation/models/incident_type_config.dart';
import 'package:smart_route_app/features/map/presentation/providers/base_map_style_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/location_display_provider.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/map_page_notifier.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/map_page_state.dart';
import 'package:smart_route_app/features/map/presentation/widgets/add_incident_bottom_sheet.dart';
import 'package:smart_route_app/features/map/presentation/widgets/incident_detail_bottom_sheet.dart';
import 'package:smart_route_app/features/map/presentation/widgets/location_info_bottom_sheet.dart';
import 'package:smart_route_app/features/map/presentation/widgets/map_controls_overlay.dart';
import 'package:smart_route_app/features/map/presentation/widgets/map_floating_actions.dart';
import 'package:smart_route_app/features/map/presentation/widgets/map_state_overlays.dart';
import 'package:smart_route_app/features/map/presentation/widgets/navigator_incidents_bottom_sheet.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  // Create controllers for both 2D map and 3D scene.
  final _mapViewController = ArcGISMapView.createController();
  final _sceneViewController = ArcGISSceneView.createController();
  // Create a graphics overlay for displaying graphics.
  final _graphicsOverlay = GraphicsOverlay();
  // Create a graphics overlay for location marker
  final _locationMarkerOverlay = GraphicsOverlay();
  // Create system location data source (best practice theo tài liệu ArcGIS)
  final _locationDataSource = SystemLocationDataSource();
  // Flag để track khi map view đã sẵn sàng
  bool _mapViewReady = false;
  // Helper để quản lý location marker
  final _locationMarkerHelper = LocationMarkerHelper();

  @override
  void dispose() {
    // Stop location data source when exiting (best practice từ sample code)
    _locationDataSource.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Khởi tạo 2D map và 3D scene với base map style từ provider
    final baseMapStyle = ref.read(baseMapStyleProviderProvider);
    final map = ArcGISMap.withBasemapStyle(baseMapStyle);

    // Giới hạn zoom tối thiểu để tránh hiển thị lưới xám (giống Google Maps)
    // MinScale: 100000000 = hạn chế zoom out và kéo map, bản đồ luôn phủ kín màn hình
    map.minScale = 100000000;

    _mapViewController.arcGISMap = map;
    _sceneViewController.arcGISScene = ArcGISScene.withBasemapStyle(
      baseMapStyle,
    );

    // Khởi tạo LocationMarkerHelper với overlay
    _locationMarkerHelper.initialize(_locationMarkerOverlay);

    // Chỉ thêm graphics overlay vào view đang active (mặc định là 2D)
    final initialMode = ref.read(mapModeProviderProvider);
    if (initialMode == MapMode.map2D) {
      _mapViewController.graphicsOverlays.add(_graphicsOverlay);
      _mapViewController.graphicsOverlays.add(_locationMarkerOverlay);
    } else {
      _sceneViewController.graphicsOverlays.add(_graphicsOverlay);
      _sceneViewController.graphicsOverlays.add(_locationMarkerOverlay);
    }

    // Fetch incidents từ MapNotifier
    Future.microtask(() {
      ref.read(mapPageNotifierProvider.notifier).fetchIncidents();
    });

    // Lắng nghe thay đổi của baseMapStyle và cập nhật cả map và scene
    ref.listenManual(baseMapStyleProviderProvider, (previous, next) {
      if (mounted && previous != next) {
        final mapMode = ref.read(mapModeProviderProvider);

        if (mapMode == MapMode.map2D) {
          final newMap = ArcGISMap.withBasemapStyle(next);
          newMap.minScale = 100000000; // Giới hạn zoom tối thiểu
          _mapViewController.arcGISMap = newMap;
          _mapViewController.graphicsOverlays.clear();
          _mapViewController.graphicsOverlays.add(_graphicsOverlay);
          _mapViewController.graphicsOverlays.add(_locationMarkerOverlay);
        } else {
          _sceneViewController.arcGISScene = ArcGISScene.withBasemapStyle(next);
          _sceneViewController.graphicsOverlays.clear();
          _sceneViewController.graphicsOverlays.add(_graphicsOverlay);
          _sceneViewController.graphicsOverlays.add(_locationMarkerOverlay);
        }
      }
    });

    // Lắng nghe thay đổi của mapMode để chuyển đổi giữa 2D và 3D
    ref.listenManual(mapModeProviderProvider, (previous, next) {
      if (mounted && previous != next) {
        // Di chuyển graphics overlay từ view cũ sang view mới
        _moveGraphicsOverlayToActiveView(next);
        // Rebuild để hiển thị view tương ứng
        setState(() {});

        // Đợi view mới được build rồi mới cập nhật LocationDisplay
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            final isLocationEnabled = ref.read(locationDisplayProviderProvider);
            if (isLocationEnabled) {
              _updateLocationDisplay(next, true);
            }
          }
        });
      }
    });

    // Lắng nghe thay đổi của LocationDisplay để bật/tắt GPS
    ref.listenManual(locationDisplayProviderProvider, (previous, next) {
      if (mounted && previous != next) {
        final mapMode = ref.read(mapModeProviderProvider);
        _updateLocationDisplay(mapMode, next);
      }
    });
  }

  /// Di chuyển graphics overlay sang view đang active
  void _moveGraphicsOverlayToActiveView(MapMode mode) {
    // Remove từ cả hai view
    _mapViewController.graphicsOverlays.remove(_graphicsOverlay);
    _sceneViewController.graphicsOverlays.remove(_graphicsOverlay);
    _mapViewController.graphicsOverlays.remove(_locationMarkerOverlay);
    _sceneViewController.graphicsOverlays.remove(_locationMarkerOverlay);

    // Thêm vào view đang active
    if (mode == MapMode.map2D) {
      _mapViewController.graphicsOverlays.add(_graphicsOverlay);
      _mapViewController.graphicsOverlays.add(_locationMarkerOverlay);
    } else {
      _sceneViewController.graphicsOverlays.add(_graphicsOverlay);
      _sceneViewController.graphicsOverlays.add(_locationMarkerOverlay);
    }
  }

  /// Callback khi map view 2D đã sẵn sàng
  void _onMapViewReady() {
    setState(() {
      _mapViewReady = true;
    });
    AppLogger.ui('Map view is ready');

    // Cấu hình BackgroundGrid màu nước biển
    _mapViewController.backgroundGrid =
        MapConfigurationHelper.createOceanBackgroundGrid();

    // Note: WrapAround mode được bật tự động trong ArcGIS SDK mới
    // không cần set thủ công isWrapAroundEnabled

    // Set the system location data source (best practice theo ArcGIS docs)
    _mapViewController.locationDisplay.dataSource = _locationDataSource;

    // Nếu LocationDisplay đã được bật trước khi map ready, bật nó ngay bây giờ
    final isLocationEnabled = ref.read(locationDisplayProviderProvider);
    if (isLocationEnabled) {
      _updateLocationDisplay(MapMode.map2D, true);
    }
  }

  /// Callback khi scene view 3D đã sẵn sàng
  void _onSceneViewReady() {
    AppLogger.ui('Scene view is ready');
    // Scene view không cần LocationDisplay nên không cần track ready state
  }

  /// Cập nhật LocationDisplay cho view đang active
  /// Best practice theo: https://developers.arcgis.com/flutter/sample-code/show-device-location/
  Future<void> _updateLocationDisplay(MapMode mode, bool enabled) async {
    if (mode == MapMode.map2D) {
      // Kiểm tra xem map view đã sẵn sàng chưa
      if (!_mapViewReady) {
        AppLogger.ui('Map view not ready yet, skipping LocationDisplay update');
        // Tắt LocationDisplay nếu map chưa sẵn sàng
        if (enabled && mounted) {
          ref.read(locationDisplayProviderProvider.notifier).disable();
        }
        return;
      }

      // LocationDisplay chỉ hỗ trợ cho 2D Map
      final locationDisplay = _mapViewController.locationDisplay;

      if (enabled) {
        // Set auto-pan mode trước khi start
        locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;

        // Attempt to start the location data source (best practice từ sample code)
        // Ref: https://developers.arcgis.com/flutter/sample-code/show-device-location/
        try {
          await _locationDataSource.start();

          // Log current location after starting
          final location = locationDisplay.location;
          if (location != null) {
            final lat = location.position.y;
            final lon = location.position.x;
            AppLogger.ui(
              'LocationDisplay started - Current location: Lat: $lat, Lon: $lon',
            );
          } else {
            AppLogger.ui('LocationDisplay started for 2D map');
          }

          // Listen to location changes and log them
          locationDisplay.onLocationChanged.listen((location) {
            final lat = location.position.y;
            final lon = location.position.x;
            AppLogger.ui('Location updated: Lat: $lat, Lon: $lon');
          });
        } on ArcGISException catch (e) {
          AppLogger.ui(
            'ArcGIS Error starting LocationDisplay: ${e.message}',
            error: e,
          );
          if (mounted) {
            // Tắt LocationDisplay trong provider nếu có lỗi
            ref.read(locationDisplayProviderProvider.notifier).disable();

            // Hiển thị thông báo cho user
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Không thể bật GPS: ${e.message}'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        } catch (e) {
          AppLogger.ui('Error starting LocationDisplay: $e', error: e);
          if (mounted) {
            ref.read(locationDisplayProviderProvider.notifier).disable();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Không thể bật GPS: $e'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        }
      } else {
        // Stop location data source
        _locationDataSource.stop();
        AppLogger.ui('LocationDisplay stopped for 2D map');
      }
    } else {
      // 3D Scene không hỗ trợ LocationDisplay
      if (enabled && mounted) {
        // Tự động tắt LocationDisplay trong provider
        ref.read(locationDisplayProviderProvider.notifier).disable();

        // Thông báo cho user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('GPS chỉ khả dụng ở chế độ 2D'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 2),
          ),
        );
        AppLogger.ui('LocationDisplay not supported in 3D scene');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen state từ mapNotifierProvider
    final mapPageState = ref.watch(mapPageNotifierProvider);
    final mapMode = ref.watch(mapModeProviderProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Hiển thị 2D Map hoặc 3D Scene tùy theo mapMode
          if (mapMode == MapMode.map2D)
            ArcGISMapView(
              controllerProvider: () => _mapViewController,
              onMapViewReady: _onMapViewReady,
              onTap: _onMapTap,
              onLongPressEnd: _onMapLongPressEnd,
            )
          else
            ArcGISSceneView(
              controllerProvider: () => _sceneViewController,
              onSceneViewReady: _onSceneViewReady,
              onTap: _onSceneTap,
            ),
          // Hiển thị UI dựa trên state
          _buildStateUI(mapPageState),
          // Map controls (Basemap switcher, Map mode switcher)
          const MapControlsOverlay(),
          NavigatorIncidentsBottomSheet(
            mapViewController: _mapViewController,
            sceneViewController: _sceneViewController,
          ),
        ],
      ),
      floatingActionButton: const MapFloatingActions(),
    );
  }

  /// Widget để hiển thị UI dựa trên state (loading, error, success)
  Widget _buildStateUI(MapPageState state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const MapLoadingOverlay(),
      loaded: (incidents) {
        _updateGraphicsOverlay(incidents);
        return const SizedBox.shrink();
      },
      submitting: (incidents) {
        _updateGraphicsOverlay(incidents);
        return const MapSubmittingOverlay();
      },
      submitted: (incidents) {
        _updateGraphicsOverlay(incidents);
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (mounted) {
            ref.read(mapPageNotifierProvider.notifier).resetToLoaded();
          }
        });
        return const SizedBox.shrink();
      },
      error: (failure) => MapErrorOverlay(
        message: failure.message,
        onRetry: () =>
            ref.read(mapPageNotifierProvider.notifier).fetchIncidents(),
      ),
    );
  }

  /// Update GraphicsOverlay với danh sách incidents mới
  void _updateGraphicsOverlay(List<domain.Incident> incidents) async {
    // Factory instance
    final symbolFactory = IncidentSymbolFactory();

    // Tạo danh sách graphics tạm thời để add một lần (tốt hơn add từng cái)
    final List<Graphic> newGraphics = [];

    // Convert từ Incident entities sang Graphics và thêm vào overlay
    for (final incident in incidents) {
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

        newGraphics.add(graphic);
      } catch (e) {
        AppLogger.ui(
          'Error creating graphic for incident ${incident.id}: $e',
          error: e,
        );
      }

      // Update overlay
      _graphicsOverlay.graphics.clear();
      _graphicsOverlay.graphics.addAll(newGraphics);
    }

    AppLogger.ui(
      'Updated graphics overlay with ${_graphicsOverlay.graphics.length} incidents',
    );
  }

  /// Xử lý sự kiện tap trên bản đồ 2D
  Future<void> _onMapTap(Offset screenPoint) async {
    try {
      // Thực hiện identify operation để tìm graphic tại vị trí tap
      final identifyResult = await _mapViewController.identifyGraphicsOverlay(
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
              _zoomToIncident(identifiedGraphic);
              _highlightIncident(identifiedGraphic);

              // Hiển thị bottom sheet
              _showIncidentBottomSheet(incident);
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

  /// Xử lý sự kiện long press end trên bản đồ 2D
  Future<void> _onMapLongPressEnd(Offset screenPoint) async {
    try {
      if (mounted) {
        // Llấy thông tin vị trí tap
        final mapPoint = _mapViewController.screenToLocation(
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
            _showLocationInfo(wgs84Point.y, wgs84Point.x);
          }
        }
      }
    } catch (e) {
      AppLogger.ui('Error identifying graphic: $e', error: e);
    }
  }

  /// Xử lý sự kiện tap trên scene 3D
  Future<void> _onSceneTap(Offset screenPoint) async {
    try {
      // Thực hiện identify operation để tìm graphic tại vị trí tap trong 3D scene
      final identifyResult = await _sceneViewController.identifyGraphicsOverlay(
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
              _showIncidentBottomSheet(incident);
            },
          );
        }
      } else if (mounted) {
        // Không có graphic, lấy thông tin vị trí tap
        final scenePoint = _sceneViewController.screenToBaseSurface(
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
            _showLocationInfo(wgs84Point.y, wgs84Point.x);
          }
        }
      }
    } catch (e) {
      AppLogger.ui('Error identifying graphic in 3D scene: $e', error: e);
    }
  }

  /// Zoom map đến vị trí incident
  Future<void> _zoomToIncident(Graphic graphic) async {
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
        await _mapViewController.setViewpointAnimated(
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

  /// Highlight incident đã chọn bằng cách đổi symbol
  Graphic? _highlightedGraphic;
  ArcGISSymbol? _originalSymbol;

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
  void _showIncidentBottomSheet(domain.Incident incident) {
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

  /// Thêm marker tạm thời tại vị trí được chọn
  Future<void> _addLocationMarker(ArcGISPoint point) async {
    await _locationMarkerHelper.addMarker(point);
  }

  /// Xóa location marker
  void _removeLocationMarker() {
    _locationMarkerHelper.removeMarker();
  }

  /// Hiển thị thông tin vị trí khi tap vào map (không phải incident)
  void _showLocationInfo(double latitude, double longitude) {
    final mapMode = ref.read(mapModeProviderProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LocationInfoBottomSheet(
        initialLatitude: latitude,
        initialLongitude: longitude,
        mapViewController: mapMode == MapMode.map2D ? _mapViewController : null,
        sceneViewController: mapMode == MapMode.scene3D
            ? _sceneViewController
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
}
