import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/map/presentation/helpers/graphics_overlay_manager.dart';
import 'package:smart_route_app/features/map/presentation/helpers/incident_highlighter.dart';
import 'package:smart_route_app/features/map/presentation/helpers/location_display_manager.dart';
import 'package:smart_route_app/features/map/presentation/helpers/location_marker_helper.dart';
import 'package:smart_route_app/features/map/presentation/helpers/map_camera_controller.dart';
import 'package:smart_route_app/features/map/presentation/helpers/map_configuration_helper.dart';
import 'package:smart_route_app/features/map/presentation/helpers/map_initializer.dart';
import 'package:smart_route_app/features/map/presentation/helpers/map_interaction_handler.dart';
import 'package:smart_route_app/features/map/presentation/providers/base_map_style_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/location_display_provider.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/map_page_notifier.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/map_page_state.dart';
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

  // Helpers - tách logic phức tạp ra khỏi State
  late final GraphicsOverlayManager _graphicsManager;
  late final IncidentHighlighter _highlighter;
  late final LocationMarkerHelper _locationMarkerHelper;
  late final MapCameraController _cameraController;
  late LocationDisplayManager? _locationDisplayManager;
  late MapInteractionHandler? _interactionHandler;

  @override
  void initState() {
    super.initState();

    // Khởi tạo helpers
    _graphicsManager = GraphicsOverlayManager(_graphicsOverlay);
    _highlighter = IncidentHighlighter();
    _locationMarkerHelper = LocationMarkerHelper();
    _cameraController = MapCameraController(_mapViewController);

    // Khởi tạo LocationMarkerHelper với overlay
    _locationMarkerHelper.initialize(_locationMarkerOverlay);

    // Khởi tạo 2D map và 3D scene với base map style từ provider
    final baseMapStyle = ref.read(baseMapStyleProviderProvider);
    _mapViewController.arcGISMap = MapInitializer.initializeMap(baseMapStyle);
    _sceneViewController.arcGISScene = MapInitializer.initializeScene(
      baseMapStyle,
    );

    // Chỉ thêm graphics overlay vào view đang active (mặc định là 2D)
    final initialMode = ref.read(mapModeProviderProvider);
    MapInitializer.setupGraphicsOverlays(
      mapController: _mapViewController,
      sceneController: _sceneViewController,
      mode: initialMode,
      incidentOverlay: _graphicsOverlay,
      locationMarkerOverlay: _locationMarkerOverlay,
    );

    // Fetch incidents từ MapNotifier
    Future.microtask(() {
      ref.read(mapPageNotifierProvider.notifier).fetchIncidents();
    });

    _setupProviderListeners();
  }

  /// Setup các provider listeners
  void _setupProviderListeners() {
    // Lắng nghe thay đổi của baseMapStyle và cập nhật cả map và scene
    ref.listenManual(baseMapStyleProviderProvider, (previous, next) {
      if (mounted && previous != next) {
        final mapMode = ref.read(mapModeProviderProvider);
        MapInitializer.updateBasemapStyle(
          newStyle: next,
          mode: mapMode,
          mapController: _mapViewController,
          sceneController: _sceneViewController,
          incidentOverlay: _graphicsOverlay,
          locationMarkerOverlay: _locationMarkerOverlay,
        );
      }
    });

    // Lắng nghe thay đổi của mapMode để chuyển đổi giữa 2D và 3D
    ref.listenManual(mapModeProviderProvider, (previous, next) {
      if (mounted && previous != next) {
        // Di chuyển graphics overlay từ view cũ sang view mới
        MapInitializer.moveGraphicsOverlays(
          mapController: _mapViewController,
          sceneController: _sceneViewController,
          targetMode: next,
          incidentOverlay: _graphicsOverlay,
          locationMarkerOverlay: _locationMarkerOverlay,
        );

        // Rebuild để hiển thị view tương ứng
        setState(() {});

        // Đợi view mới được build rồi mới cập nhật LocationDisplay
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted && _locationDisplayManager != null) {
            final isLocationEnabled = ref.read(locationDisplayProviderProvider);
            if (isLocationEnabled) {
              _locationDisplayManager!.updateLocationDisplay(next, true);
            }
          }
        });
      }
    });

    // Lắng nghe thay đổi của LocationDisplay để bật/tắt GPS
    ref.listenManual(locationDisplayProviderProvider, (previous, next) {
      if (mounted && _locationDisplayManager != null) {
        final mapMode = ref.read(mapModeProviderProvider);
        _locationDisplayManager!.updateLocationDisplay(mapMode, next);
      }
    });
  }

  @override
  void dispose() {
    // Stop location data source when exiting (best practice từ sample code)
    _locationDisplayManager?.stop();
    super.dispose();
  }

  /// Callback khi map view 2D đã sẵn sàng
  void _onMapViewReady() {
    AppLogger.ui('Map view is ready');

    // Cấu hình BackgroundGrid màu nước biển
    _mapViewController.backgroundGrid =
        MapConfigurationHelper.createOceanBackgroundGrid();

    // Note: WrapAround mode được bật tự động trong ArcGIS SDK mới
    // không cần set thủ công isWrapAroundEnabled

    // Khởi tạo LocationDisplayManager khi map ready
    _locationDisplayManager = LocationDisplayManager(
      mapViewController: _mapViewController,
      locationDataSource: _locationDataSource,
      ref: ref,
      context: context,
    );
    _locationDisplayManager!.setMapViewReady(true);
    _locationDisplayManager!.configureLocationDataSource();

    // Khởi tạo InteractionHandler khi map ready
    _interactionHandler = MapInteractionHandler(
      mapViewController: _mapViewController,
      sceneViewController: _sceneViewController,
      graphicsOverlay: _graphicsOverlay,
      ref: ref,
      context: context,
      highlighter: _highlighter,
      cameraController: _cameraController,
      locationMarkerHelper: _locationMarkerHelper,
    );

    // Nếu LocationDisplay đã được bật trước khi map ready, bật nó ngay bây giờ
    final isLocationEnabled = ref.read(locationDisplayProviderProvider);
    if (isLocationEnabled) {
      _locationDisplayManager!.updateLocationDisplay(MapMode.map2D, true);
    }
  }

  /// Callback khi scene view 3D đã sẵn sàng
  void _onSceneViewReady() {
    AppLogger.ui('Scene view is ready');
    // Scene view không cần LocationDisplay nên không cần track ready state
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
              onTap: (offset) => _interactionHandler?.handleMapTap(offset),
              onLongPressEnd: (offset) =>
                  _interactionHandler?.handleMapLongPress(offset),
            )
          else
            ArcGISSceneView(
              controllerProvider: () => _sceneViewController,
              onSceneViewReady: _onSceneViewReady,
              onTap: (offset) => _interactionHandler?.handleSceneTap(offset),
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
        // Update GraphicsOverlay với danh sách incidents mới
        _graphicsManager.updateIncidents(incidents);
        return const SizedBox.shrink();
      },
      submitting: (incidents) {
        _graphicsManager.updateIncidents(incidents);
        return const MapSubmittingOverlay();
      },
      submitted: (incidents) {
        _graphicsManager.updateIncidents(incidents);
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
}
