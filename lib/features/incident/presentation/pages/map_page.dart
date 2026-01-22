import 'dart:async';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/presentation/helpers/map_configuration_helper.dart';
import 'package:smart_route_app/features/incident/presentation/logics/map_interaction_logic.dart';
import 'package:smart_route_app/features/incident/presentation/logics/map_location_logic.dart';
import 'package:smart_route_app/features/incident/presentation/providers/base_map_style_providers.dart';
import 'package:smart_route_app/core/feature_layer/providers/incident_feature_layer_providers.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_display_providers.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_center_providers.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_controller_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_mode_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/scene_controller_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/map_page_notifier.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/map_page_state.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart'
    as domain;

import 'package:smart_route_app/features/incident/presentation/widgets/map_controls_overlay.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/map_floating_actions.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/simmer/loading/base_map_loading_overlay.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/simmer/loading/map_loading_overlay.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/simmer/error/map_state_overlays.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/navigator_incidents_bottom_sheet.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/simmer/loading/map_submitting_overlay.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  // Create controllers for both 2D map and 3D scene.
  late ArcGISMapViewController _mapViewController;
  late ArcGISSceneViewController _sceneViewController;

  /// logic modules
  final _mapLocationLogic = MapLocationLogic(); // Location/GPS logic
  final _mapInteractionLogic = MapInteractionLogic(); // Map interaction logic

  // Flag để track khi map view đã sẵn sàng
  bool _mapViewReady = false;

  // Flag để tránh gọi updateGraphicsOverlay nhiều lần
  List<String>? _lastIncidentIds;

  // Stream subscriptions để dispose
  StreamSubscription? _mapViewpointChangedSubscription;
  StreamSubscription? _sceneViewpointChangedSubscription;

  @override
  void dispose() {
    // Cancel stream subscriptions để tránh memory leak
    _mapViewpointChangedSubscription?.cancel();
    _sceneViewpointChangedSubscription?.cancel();
    _basemapLoadSubscription?.cancel();
    _mapLocationLogic
        .dispose(); // Gọi dispose MapLocationLogic (stop SystemLocationDataSource)
    super.dispose();
  }

  // Subscription để track basemap load
  StreamSubscription? _basemapLoadSubscription;

  /// Đợi basemap load hoàn tất rồi tắt loading indicator
  void _waitForBasemapLoad(Basemap basemap) {
    // Cancel subscription cũ nếu có
    _basemapLoadSubscription?.cancel();

    // Nếu đã loaded rồi thì tắt loading ngay
    if (basemap.loadStatus == LoadStatus.loaded) {
      ref.read(basemapLoadingProvider.notifier).setLoading(false);
      return;
    }

    // Lắng nghe loadStatus changes
    _basemapLoadSubscription = basemap.onLoadStatusChanged.listen((status) {
      if (status == LoadStatus.loaded || status == LoadStatus.failedToLoad) {
        if (mounted) {
          ref.read(basemapLoadingProvider.notifier).setLoading(false);
        }
        _basemapLoadSubscription?.cancel();
      }
    });

    // Load basemap
    basemap.load();

    // Timeout fallback - tắt loading sau 5s nếu vẫn chưa load xong
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted && ref.read(basemapLoadingProvider)) {
        ref.read(basemapLoadingProvider.notifier).setLoading(false);
        _basemapLoadSubscription?.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _mapViewController = ref.read(mapControllerProvider);
    _sceneViewController = ref.read(sceneControllerProvider);

    // Khởi tạo map 2D ngay lập tức (cần thiết cho ArcGISMapView)
    if (_mapViewController.arcGISMap == null) {
      final baseMapStyle = ref.read(baseMapStyleProviderProvider);
      final map = ArcGISMap.withBasemapStyle(baseMapStyle);
      map.minScale = 100000000;
      _mapViewController.arcGISMap = map;
    }

    // Scene 3D: lazy init khi cần (trong listener mapMode)

    // Khởi tạo LocationMarkerHelper với overlay
    _mapInteractionLogic.initialize();

    // Chỉ thêm graphics overlay vào view đang active (mặc định là 2D)
    final initialMode = ref.read(mapModeProviderProvider);
    _mapInteractionLogic.moveGraphicsOverlayToActiveView(
      mode: initialMode,
      mapViewController: _mapViewController,
      sceneViewController: _sceneViewController,
    );

    // Fetch incidents từ MapNotifier
    Future.microtask(() {
      if (mounted) {
        ref.read(mapPageNotifierProvider.notifier).fetchIncidents();
      }
    });

    // Lắng nghe thay đổi của baseMapStyle và cập nhật basemap
    ref.listenManual(baseMapStyleProviderProvider, (previous, next) {
      if (mounted && previous != next) {
        final mapMode = ref.read(mapModeProviderProvider);

        if (mapMode == MapMode.map2D) {
          // Thay đổi basemap của map hiện tại thay vì tạo map mới
          final currentMap = _mapViewController.arcGISMap;
          if (currentMap != null) {
            final newBasemap = Basemap.withStyle(next);
            currentMap.basemap = newBasemap;

            // Đợi basemap load hoàn tất rồi mới tắt loading
            _waitForBasemapLoad(newBasemap);
          }
        } else {
          // Thay đổi basemap của scene hiện tại
          final currentScene = _sceneViewController.arcGISScene;
          if (currentScene != null) {
            final newBasemap = Basemap.withStyle(next);
            currentScene.basemap = newBasemap;

            // Đợi basemap load hoàn tất rồi mới tắt loading
            _waitForBasemapLoad(newBasemap);
          }
        }
      }
    });

    // Lắng nghe thay đổi của mapMode để chuyển đổi giữa 2D và 3D
    ref.listenManual(mapModeProviderProvider, (previous, next) {
      if (mounted && previous != next) {
        final baseMapStyle = ref.read(baseMapStyleProviderProvider);
        bool sceneJustCreated = false;

        // Lazy init Scene 3D khi cần
        if (next == MapMode.scene3D &&
            _sceneViewController.arcGISScene == null) {
          final scene = ArcGISScene.withBasemapStyle(baseMapStyle);
          _sceneViewController.arcGISScene = scene;
          sceneJustCreated = true; // Đánh dấu Scene vừa được tạo
        }

        // Chỉ sync basemap khi chuyển về 2D, hoặc Scene đã tồn tại từ trước
        // (tránh set basemap 2 lần khi Scene vừa được tạo với basemap style)
        if (next == MapMode.map2D || !sceneJustCreated) {
          _syncBasemapStyle(next, baseMapStyle);
        }

        // Di chuyển graphics overlay từ view cũ sang view mới
        _mapInteractionLogic.moveGraphicsOverlayToActiveView(
          mode: next,
          mapViewController: _mapViewController,
          sceneViewController: _sceneViewController,
        );

        // Khi chuyển sang Scene 3D, sync viewpoint từ map 2D hiện tại
        if (next == MapMode.scene3D) {
          _syncViewpointToScene();
        }

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

    // Lắng nghe yêu cầu di chuyển map đến vị trí cụ thể (từ SearchMapPage)
    ref.listenManual(navigateToPointProvider, (previous, next) {
      if (mounted && next != null && _mapViewReady) {
        final mapMode = ref.read(mapModeProviderProvider);
        if (mapMode == MapMode.map2D) {
          _mapViewController.setViewpointCenter(next.point, scale: next.scale);
        } else {
          // TODO: Xử lý cho Scene 3D
        }
        // Cập nhật mapCenterProvider
        ref.read(mapCenterProvider.notifier).update(next.point);
        // Clear request sau khi đã xử lý
        ref.read(navigateToPointProvider.notifier).clear();
      }
    });
  }

  /// Callback khi map view 2D đã sẵn sàng
  void _onMapViewReady() async {
    setState(() {
      _mapViewReady = true;
    });

    // Khởi tạo tọa độ mặc định
    double targetLat = 12.2388;
    double targetLong = 109.1967;

    // Di chuyển camera đến vị trí ban đầu (Incident cũ hoặc Default)
    final initialPoint = ArcGISPoint(
      x: targetLong,
      y: targetLat,
      spatialReference: SpatialReference.wgs84,
    );

    // Cập nhật tọa độ center map vào provider
    ref.read(mapCenterProvider.notifier).update(initialPoint);

    // Kiểm tra trạng thái LocationDisplay từ provider
    final isLocationEnabled = ref.read(locationDisplayProviderProvider);

    if (isLocationEnabled) {
      // nếu location bật
      // Set the system location data source (best practice theo ArcGIS docs)
      // _mapViewController.locationDisplay.dataSource = _locationDataSource;
      _mapViewController.locationDisplay.dataSource =
          _mapLocationLogic.locationDataSource;

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
    } else {
      // location tắt lấy center map qua initialPoint
      // zoom về initial point
      await _mapViewController.setViewpointCenter(initialPoint, scale: 5000);
    }

    AppLogger.ui('Map view is ready');

    // Cấu hình BackgroundGrid màu nước biển
    _mapViewController.backgroundGrid =
        MapConfigurationHelper.createOceanBackgroundGrid();

    Timer? debounceTimer;

    // Lắng nghe map 2D di chuyển - LƯU SUBSCRIPTION ĐỂ DISPOSE
    _mapViewpointChangedSubscription?.cancel(); // Cancel subscription cũ nếu có
    _mapViewpointChangedSubscription = _mapViewController.onViewpointChanged
        .listen((_) {
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
                  // Cập nhật vào Provider sau mỗi lần di chuyển map
                  ref.read(mapCenterProvider.notifier).update(wgs84Point);

                  // Log nhẹ để kiểm tra (không log UI dồn dập)
                  AppLogger.ui(
                    "Map Center Updated - map_page: ${wgs84Point.y}, ${wgs84Point.x}",
                  );
                }
              }
            } catch (e) {
              // Ignore error
              AppLogger.ui('Error updating map center: $e', error: e);
            }
          });
        });
  }

  /// Callback khi scene view 3D đã sẵn sàng
  void _onSceneViewReady() {
    AppLogger.ui('Scene view is ready');

    Timer? debounceTimer;

    // Lắng nghe scene 3D di chuyển - LƯU SUBSCRIPTION ĐỂ DISPOSE
    _sceneViewpointChangedSubscription
        ?.cancel(); // Cancel subscription cũ nếu có
    _sceneViewpointChangedSubscription = _sceneViewController.onViewpointChanged
        .listen((_) {
          // Hủy timer cũ nếu scene vẫn đang di chuyển
          debounceTimer?.cancel();

          // Chỉ tính toán khi scene đã DỪNG lại khoảng 200ms
          debounceTimer = Timer(const Duration(milliseconds: 200), () {
            try {
              // Lấy viewpoint hiện tại của scene
              final currentViewpoint = _sceneViewController.getCurrentViewpoint(
                ViewpointType.centerAndScale,
              );

              if (currentViewpoint != null && mounted) {
                final targetGeometry = currentViewpoint.targetGeometry;
                ArcGISPoint? centerPoint;

                if (targetGeometry is ArcGISPoint) {
                  centerPoint = targetGeometry;
                } else if (targetGeometry is Envelope) {
                  centerPoint = targetGeometry.center;
                }

                if (centerPoint != null) {
                  final wgs84Point =
                      GeometryEngine.project(
                            centerPoint,
                            outputSpatialReference: SpatialReference.wgs84,
                          )
                          as ArcGISPoint?;

                  if (wgs84Point != null) {
                    // Cập nhật vào Provider sau mỗi lần di chuyển scene
                    ref.read(mapCenterProvider.notifier).update(wgs84Point);

                    AppLogger.ui(
                      "Scene Center Updated: ${wgs84Point.y}, ${wgs84Point.x}",
                    );
                  }
                }
              }
            } catch (e) {
              AppLogger.ui('Error updating scene center: $e', error: e);
            }
          });
        });
  }

  /// Sync basemap style cho view đang active
  void _syncBasemapStyle(MapMode mode, BasemapStyle style) {
    if (mode == MapMode.map2D) {
      // Sync basemap cho map 2D
      final currentMap = _mapViewController.arcGISMap;
      if (currentMap != null) {
        currentMap.basemap = Basemap.withStyle(style);
      }
    } else {
      // Sync basemap cho scene 3D
      final currentScene = _sceneViewController.arcGISScene;
      if (currentScene != null) {
        currentScene.basemap = Basemap.withStyle(style);
      }
    }
  }

  /// Sync viewpoint từ map 2D sang Scene 3D khi chuyển mode
  void _syncViewpointToScene() {
    // Lấy tọa độ hiện tại từ mapCenterProvider
    final currentCenter = ref.read(mapCenterProvider.notifier).current();

    // Fallback về tọa độ mặc định nếu chưa có
    final targetLat = currentCenter?.y ?? 12.2388;
    final targetLong = currentCenter?.x ?? 109.1967;

    final centerPoint = ArcGISPoint(
      x: targetLong,
      y: targetLat,
      spatialReference: SpatialReference.wgs84,
    );

    // Lấy scale hiện tại từ map 2D nếu có
    final currentMapViewpoint = _mapViewController.getCurrentViewpoint(
      ViewpointType.centerAndScale,
    );
    final scale = currentMapViewpoint?.targetScale ?? 5000;

    // Tạo viewpoint với tọa độ và scale từ map 2D
    final viewpoint = Viewpoint.fromCenter(centerPoint, scale: scale);

    // Set viewpoint cho Scene 3D
    _sceneViewController.setViewpoint(viewpoint);

    // AppLogger.ui(
    //   'Synced viewpoint to Scene 3D: $targetLat, $targetLong, scale: $scale',
    // );
  }

  Future<void> _retryData() async {
    // Invalidate ArcGIS Feature Layer
    ref.invalidate(incidentFeatureLayerProvider);

    // Retry load Map (Basemap)
    final map = _mapViewController.arcGISMap;
    if (map != null && map.loadStatus == LoadStatus.failedToLoad) {
      map.retryLoad();
    }

    // Retry load Scene
    final scene = _sceneViewController.arcGISScene;
    if (scene != null && scene.loadStatus == LoadStatus.failedToLoad) {
      scene.retryLoad();
    }

    // Fetch data
    ref
        .read(mapPageNotifierProvider.notifier)
        .fetchIncidents(
          isManualRetry: true, // Kích hoạt logic chuyển về .loading()
        );
  }

  @override
  Widget build(BuildContext context) {
    // Listen state từ mapNotifierProvider
    final mapPageState = ref.watch(mapPageNotifierProvider);
    final mapMode = ref.watch(mapModeProviderProvider);
    final isBasemapLoading = ref.watch(basemapLoadingProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Dùng IndexedStack để giữ cả 2 view trong widget tree
          // Tránh dispose/recreate khi chuyển mode gây mất state
          IndexedStack(
            index: mapMode == MapMode.map2D ? 0 : 1,
            children: [
              // 2D Map View - index 0
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
              ),
              // 3D Scene View - index 1
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
            ],
          ),

          // Loading overlay khi đang chuyển basemap
          if (isBasemapLoading) const BasemapLoadingOverlay(),

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
      // Trạng thái Error: Hiện overlay lỗi Fatal che toàn màn hình
      // Đây là trường hợp fetch data thất bại hoàn toàn (không có cache)
      error: (failure) => MapErrorOverlay(
        message: failure.technicalMessage ?? "Đã xảy ra lỗi tải dữ liệu",
        onRetry: _retryData,
        isFatal: true, // Full screen error
      ),

      // Các trạng thái khác (loaded, submitting...) không hiển thị ErrorOverlay ở đây.
      // - Lỗi Internet: Đã có Global Internet Handler lo.
      // - Lỗi Action (Add/Update): Đã có Snackbar lo.
      orElse: () => const SizedBox.shrink(),
    );
  }

  /// Widget để hiển thị UI dựa trên state (loading, error, success)
  Widget _buildStateUI(MapPageState state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const MapLoadingOverlay(),
      loaded: (incidents) {
        // CHỈ UPDATE KHI DANH SÁCH INCIDENTS THỰC SỰ THAY ĐỔI
        _updateGraphicsIfNeeded(incidents);
        return const SizedBox.shrink();
      },
      submitting: (incidents) {
        _updateGraphicsIfNeeded(incidents);
        return const MapSubmittingOverlay();
      },
      submitted: (incidents) {
        _updateGraphicsIfNeeded(incidents);
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

  /// Chỉ update graphics khi danh sách incidents thực sự thay đổi
  void _updateGraphicsIfNeeded(List<domain.Incident> incidents) {
    final currentIds = incidents.map((e) => e.id).toList()..sort();

    // So sánh với lần trước - chỉ update nếu khác
    if (_lastIncidentIds == null ||
        _lastIncidentIds!.length != currentIds.length ||
        !_listEquals(_lastIncidentIds!, currentIds)) {
      _lastIncidentIds = currentIds;
      _mapInteractionLogic.updateGraphicsOverlay(
        incidents,
        mapViewController: _mapViewController,
      );
    }
  }

  /// So sánh 2 list đã sort
  bool _listEquals(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
