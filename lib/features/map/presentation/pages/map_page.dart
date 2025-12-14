import 'dart:async';

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/map/presentation/helpers/map_configuration_helper.dart';
import 'package:smart_route_app/features/map/presentation/logics/map_interaction_logic.dart';
import 'package:smart_route_app/features/map/presentation/logics/map_location_logic.dart';
import 'package:smart_route_app/features/map/presentation/providers/base_map_style_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/feature_layer_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/location_display_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_center_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_controller_provider.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';
import 'package:smart_route_app/features/map/presentation/providers/scene_controller_provider.dart';
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
  // final _mapViewController = ArcGISMapView.createController();
  // final _sceneViewController = ArcGISSceneView.createController();
  late ArcGISMapViewController _mapViewController;
  late ArcGISSceneViewController _sceneViewController;

  /// logic modules
  final _mapLocationLogic = MapLocationLogic(); // Location/GPS logic
  final _mapInteractionLogic = MapInteractionLogic(); // Map interaction logic

  // Flag để track khi map view đã sẵn sàng
  bool _mapViewReady = false;

  @override
  void dispose() {
    _mapLocationLogic
        .dispose(); // Gọi dispose MapLocationLogic (stop SystemLocationDataSource)
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _mapViewController = ref.read(mapControllerProvider);
    _sceneViewController = ref.read(sceneControllerProvider);

    if (_mapViewController.arcGISMap == null) {
      final baseMapStyle = ref.read(baseMapStyleProviderProvider);
      final map = ArcGISMap.withBasemapStyle(baseMapStyle);
      map.minScale = 100000000;
      _mapViewController.arcGISMap = map;
    }

    if (_sceneViewController.arcGISScene == null) {
      final baseMapStyle = ref.read(baseMapStyleProviderProvider);
      _sceneViewController.arcGISScene = ArcGISScene.withBasemapStyle(
        baseMapStyle,
      );
    }

    // Khởi tạo 2D map và 3D scene với base map style từ provider
    // final baseMapStyle = ref.read(baseMapStyleProviderProvider);
    // final map = ArcGISMap.withBasemapStyle(baseMapStyle);

    // Giới hạn zoom tối thiểu để tránh hiển thị lưới xám (giống Google Maps)
    // MinScale: 100000000 = hạn chế zoom out và kéo map, bản đồ luôn phủ kín màn hình
    // map.minScale = 100000000;

    // _mapViewController.arcGISMap = map;
    // _sceneViewController.arcGISScene = ArcGISScene.withBasemapStyle(
    //   baseMapStyle,
    // );

    // Khởi tạo LocationMarkerHelper với overlay
    _mapInteractionLogic.initialize();

    // Chỉ thêm graphics overlay vào view đang active (mặc định là 2D)
    final initialMode = ref.read(mapModeProviderProvider);
    // if (initialMode == MapMode.map2D) {
    //   _mapViewController.graphicsOverlays.add(_graphicsOverlay);
    //   _mapViewController.graphicsOverlays.add(_locationMarkerOverlay);
    // } else {
    //   _sceneViewController.graphicsOverlays.add(_graphicsOverlay);
    //   _sceneViewController.graphicsOverlays.add(_locationMarkerOverlay);
    // }
    _mapInteractionLogic.moveGraphicsOverlayToActiveView(
      mode: initialMode,
      mapViewController: _mapViewController,
      sceneViewController: _sceneViewController,
    );

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
          // _mapViewController.graphicsOverlays.clear();
          // _mapViewController.graphicsOverlays.add(_graphicsOverlay);
          // _mapViewController.graphicsOverlays.add(_locationMarkerOverlay);
          // Clear and re-add overlays
          _mapInteractionLogic.moveGraphicsOverlayToActiveView(
            mode: mapMode,
            mapViewController: _mapViewController,
            sceneViewController: _sceneViewController,
          );
        } else {
          _sceneViewController.arcGISScene = ArcGISScene.withBasemapStyle(next);
          _sceneViewController.graphicsOverlays.clear();
          // _sceneViewController.graphicsOverlays.add(_graphicsOverlay);
          // _sceneViewController.graphicsOverlays.add(_locationMarkerOverlay);
          // Clear and re-add overlays
          _mapInteractionLogic.moveGraphicsOverlayToActiveView(
            mode: mapMode,
            mapViewController: _mapViewController,
            sceneViewController: _sceneViewController,
          );
        }
      }
    });

    // Lắng nghe thay đổi của mapMode để chuyển đổi giữa 2D và 3D
    ref.listenManual(mapModeProviderProvider, (previous, next) {
      if (mounted && previous != next) {
        // Di chuyển graphics overlay từ view cũ sang view mới
        // _moveGraphicsOverlayToActiveView(next);
        _mapInteractionLogic.moveGraphicsOverlayToActiveView(
          mode: next,
          mapViewController: _mapViewController,
          sceneViewController: _sceneViewController,
        );
        // Rebuild để hiển thị view tương ứng
        setState(() {});

        // Đợi view mới được build rồi mới cập nhật LocationDisplay
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            final isLocationEnabled = ref.read(locationDisplayProviderProvider);
            if (isLocationEnabled) {
              // _updateLocationDisplay(next, true);
              _mapLocationLogic.updateLocationDisplay(
                mode: next,
                context: context,
                mapViewController: _mapViewController,
                mapViewReady: _mapViewReady,
                mounted: mounted,
                ref: ref,
                enabled: isLocationEnabled,
              );
            }
          }
        });
      }
    });

    // Lắng nghe thay đổi của LocationDisplay để bật/tắt GPS
    ref.listenManual(locationDisplayProviderProvider, (previous, next) {
      if (mounted && previous != next) {
        final mapMode = ref.read(mapModeProviderProvider);
        // _updateLocationDisplay(mapMode, next);
        _mapLocationLogic.updateLocationDisplay(
          mode: mapMode,
          context: context,
          mapViewController: _mapViewController,
          mapViewReady: _mapViewReady,
          mounted: mounted,
          ref: ref,
          enabled: next,
        );
      }
    });
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
    // _mapViewController.locationDisplay.dataSource = _locationDataSource;
    _mapViewController.locationDisplay.dataSource =
        _mapLocationLogic.locationDataSource;

    // Nếu LocationDisplay đã được bật trước khi map ready, bật nó ngay bây giờ
    final isLocationEnabled = ref.read(locationDisplayProviderProvider);
    if (isLocationEnabled) {
      // _updateLocationDisplay(MapMode.map2D, true);
      _mapLocationLogic.updateLocationDisplay(
        context: context,
        ref: ref,
        mode: MapMode.map2D,
        enabled: true,
        mapViewController: _mapViewController,
        mapViewReady: true,
        mounted: mounted,
      );
    }

    Timer? debounceTimer;

    // Lắng nghe map di chuyển
    _mapViewController.onViewpointChanged.listen((_) {
      // Hủy timer cũ nếu map vẫn đang di chuyển
      debounceTimer?.cancel();

      // Chỉ tính toán khi map đã DỪNG lại khoảng 200ms
      debounceTimer = Timer(const Duration(milliseconds: 200), () {
        // Tác vụ nặng thực hiện ở đây (lúc người dùng đang nghỉ tay)
        try {
          final visibleArea = _mapViewController.visibleArea;
          if (visibleArea != null) {
            final center = visibleArea.extent.center;
            final wgs84Point =
                GeometryEngine.project(
                      center,
                      outputSpatialReference: SpatialReference.wgs84,
                    )
                    as ArcGISPoint?;

            if (wgs84Point != null && mounted) {
              // Cập nhật vào Provider
              ref.read(mapCenterProvider.notifier).update(wgs84Point);

              // Log nhẹ để kiểm tra (không log UI dồn dập)
              AppLogger.ui(
                "Map Center Updated - map_page: ${wgs84Point.y}, ${wgs84Point.x}",
              );
            }
          }
        } catch (e) {
          // Ignore error
        }
      });
    });
  }

  /// Callback khi scene view 3D đã sẵn sàng
  void _onSceneViewReady() {
    AppLogger.ui('Scene view is ready');
    // Scene view không cần LocationDisplay nên không cần track ready state
  }

  Future<void> _retryData() async {
    // 1. Retry load Map (Basemap)
    final map = _mapViewController.arcGISMap;
    if (map != null && map.loadStatus == LoadStatus.failedToLoad) {
      map.retryLoad();
    }

    // 2. Retry load Scene
    final scene = _sceneViewController.arcGISScene;
    if (scene != null && scene.loadStatus == LoadStatus.failedToLoad) {
      scene.retryLoad();
    }

    // 3. Retry Data FeatureLayer
    ref.invalidate(incidentFeatureLayerProvider);
    ref.read(mapPageNotifierProvider.notifier).fetchIncidents();
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
              onTap: (screenPoint) => _mapInteractionLogic.onMapTap(
                screenPoint: screenPoint,
                context: context,
                ref: ref,
                mounted: mounted,
                mapViewController: _mapViewController,
              ),
              onLongPressEnd: (screenPoint) =>
                  _mapInteractionLogic.onMapLongPressEnd(
                    screenPoint: screenPoint,
                    context: context,
                    ref: ref,
                    mounted: mounted,
                    mapViewController: _mapViewController,
                  ),
            )
          else
            ArcGISSceneView(
              controllerProvider: () => _sceneViewController,
              onSceneViewReady: _onSceneViewReady,
              onTap: (screenPoint) => _mapInteractionLogic.onSceneTap(
                screenPoint: screenPoint,
                context: context,
                ref: ref,
                mounted: mounted,
                sceneViewController: _sceneViewController,
              ),
            ),

          // Hiển thị UI dựa trên state
          _buildStateUI(mapPageState),

          _buildErrorUI(mapPageState),
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

  Widget _buildErrorUI(MapPageState state) {
    return state.maybeWhen(
      // Lỗi Fatal: Che toàn bộ màn hình
      error: (failure) => MapErrorOverlay(
        message: failure.technicalMessage ?? "",
        onRetry: _retryData,
        isFatal: true,
      ),

      // Lỗi Mạng (trong khi đã Loaded): Hiện thanh nhỏ
      loaded: (incidents, failure) {
        if (failure != null && failure.technicalMessage != null) {
          final message = failure.technicalMessage!;
          return MapErrorOverlay(
            message: message,
            onRetry: _retryData,
            isFatal: false, // Quan trọng: false để hiển thị floating bar
          );
        }
        return const SizedBox.shrink();
      },
      orElse: () => const SizedBox.shrink(),
    );
  }

  /// Widget để hiển thị UI dựa trên state (loading, error, success)
  Widget _buildStateUI(MapPageState state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const MapLoadingOverlay(),
      loaded: (incidents, failure) {
        _mapInteractionLogic.updateGraphicsOverlay(
          incidents,
          mapViewController: _mapViewController,
        );
        return const SizedBox.shrink();
      },
      submitting: (incidents) {
        _mapInteractionLogic.updateGraphicsOverlay(
          incidents,
          mapViewController: _mapViewController,
        );
        return const MapSubmittingOverlay();
      },
      submitted: (incidents) {
        _mapInteractionLogic.updateGraphicsOverlay(
          incidents,
          mapViewController: _mapViewController,
        );
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (mounted) {
            ref.read(mapPageNotifierProvider.notifier).resetToLoaded();
          }
        });
        return const SizedBox.shrink();
      },
      error: (_) => const SizedBox.shrink(),
    );
  }
}
