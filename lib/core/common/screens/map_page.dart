import 'dart:async';
import 'dart:ui' as ui;
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/screens/widgets/map_floating_actions.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/common/design_pattern/structural_pattern/arcgis_map_facade.dart';
import 'package:smart_route_app/features/incident/presentation/helpers/map_configuration_helper.dart';
import 'package:smart_route_app/features/incident/presentation/logics/map_interaction_logic.dart';
import 'package:smart_route_app/features/incident/presentation/logics/map_location_logic.dart';
import 'package:smart_route_app/features/incident/presentation/providers/base_map_style_providers.dart';
import 'package:smart_route_app/core/common/provider/incident_feature_layer_providers.dart';
import 'package:smart_route_app/features/incident/domain/entities/cluster_item.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_display_providers.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_info_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_center_providers.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_controller_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_facade_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_mode_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/scene_controller_provider.dart';
import 'package:smart_route_app/core/common/screens/map_page_notifier.dart';
import 'package:smart_route_app/core/common/screens/map_page_state.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart'
    as domain;
import 'package:smart_route_app/features/incident/presentation/providers/user_location_provider.dart';

import 'package:smart_route_app/features/incident/presentation/widgets/map_controls_overlay.dart';
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
  late final ArcGISMapFacade _mapFacade;

  // Flag để track khi map view đã sẵn sàng
  bool _mapViewReady = false;

  //  Quản lý Subscriptions và Timer để tránh Memory Leak
  StreamSubscription? _mapViewpointChangedSubscription;
  StreamSubscription? _sceneViewpointChangedSubscription;
  Timer? _debounceTimer;

  @override
  void dispose() {
    _mapViewpointChangedSubscription?.cancel();
    _sceneViewpointChangedSubscription?.cancel();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Khởi tạo Facade với Controllers lấy từ Riverpod
    _mapFacade = ref.read(mapFacadeProvider);

    // Khởi tạo Bản đồ 2D ngay lập tức (Default view) với Style từ Provider
    final initialStyle = ref.read(baseMapStyleProviderProvider);
    _mapFacade.initialize2D(initialStyle);

    // Lắng nghe các thay đổi trạng thái (Mode 2D/3D, Basemap, Navigation)
    _setupStateListeners();

    // Preload resources và Fetch incidents từ MapNotifier
    Future.microtask(() async {
      /// Pre-cache symbols trước khi render map để tránh lag khi hiển thị
      await _mapFacade.initialize();

      if (mounted) {
        ref.read(mapPageNotifierProvider.notifier).fetchIncidents();
        ref.read(mapPageNotifierProvider.notifier).fetchClusters();
      }
    });
  }

  /// Lắng nghe state riverpod
  void _setupStateListeners() {
    // A. Lắng nghe người dùng chuyển đổi Mode 2D <-> 3D
    ref.listenManual(mapModeProviderProvider, (previous, nextMode) {
      if (!mounted || previous == nextMode) return;

      final currentStyle = ref.read(baseMapStyleProviderProvider);

      if (nextMode == MapMode.scene3D) {
        _mapFacade.switchTo3D(currentStyle);
      } else {
        _mapFacade.switchTo2D(currentStyle);
      }

      // Rebuild để IndexedStack lật sang view tương ứng
      setState(() {});
    });

    // B. Lắng nghe người dùng đổi kiểu bản đồ nền (Basemap)
    ref.listenManual(baseMapStyleProviderProvider, (previous, nextStyle) {
      if (!mounted || previous == nextStyle) return;

      // Facade sẽ tự lo việc đổi Basemap cho cả 2D và 3D
      _mapFacade.changeBasemapStyle(nextStyle);

      // Tắt overlay loading sau khi đã ra lệnh đổi basemap
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          ref.read(basemapLoadingProvider.notifier).setLoading(false);
        }
      });
    });

    // C. Lắng nghe sự kiện Navigate (Tìm kiếm hoặc bấm để di chuyển Camera)
    ref.listenManual(navigateToPointProvider, (previous, next) {
      if (!mounted || next == null || !_mapViewReady) return;

      final mapMode = ref.read(mapModeProviderProvider);
      if (mapMode == MapMode.map2D) {
        _mapFacade.mapController.setViewpointCenter(
          next.point,
          scale: next.scale,
        );
      } else {
        // Tương tự cho Scene 3D
        _mapFacade.sceneController.setViewpointCamera(
          Camera.withLatLong(
            latitude: next.point.y,
            longitude: next.point.x,
            altitude: 5000, // Đặt độ cao mặc định cho Scene 3D
            heading: 0, // Hướng nhìn về phía bắc
            pitch: 45, // Góc nhìn nghiêng để thấy hiệu ứng 3D rõ hơn
            roll: 0, // Không xoay ngang
          ),
        );
      }

      // Cập nhật tâm bản đồ
      ref.read(mapCenterProvider.notifier).update(next.point);
      // Clear event sau khi xử lý xong
      ref.read(navigateToPointProvider.notifier).clear();
    });

    // D. Lắng nghe Dữ liệu sự cố thay đổi
    ref.listenManual(mapPageNotifierProvider, (previous, state) {
      state.whenOrNull(
        loaded: (incidents) => _mapFacade.updateIncidentGraphics(incidents),
        submitted: (incidents) => _mapFacade.updateIncidentGraphics(incidents),
      );
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

    AppLogger.ui("init: lat: $targetLat, long: $targetLong");

    // Di chuyển camera đến vị trí ban đầu (Incident cũ hoặc Default)
    final initialPoint = ArcGISPoint(
      x: targetLong,
      y: targetLat,
      spatialReference: SpatialReference.wgs84,
    );

    try {
      // Cập nhật tọa độ center map vào provider
      ref.read(mapCenterProvider.notifier).update(initialPoint);

      // Di chuyển camera đến vị trí ban đầu
      await _mapFacade.mapController.setViewpointCenter(
        initialPoint,
        scale: 5000,
      );
    } catch (e) {
      AppLogger.ui(
        "LỖI: Không thể di chuyển camera đến vị trí ban đầu: $e",
        error: e,
      );
    }

    // Lắng nghe map 2D di chuyển - LƯU SUBSCRIPTION ĐỂ DISPOSE
    _mapViewpointChangedSubscription?.cancel(); // Cancel subscription cũ nếu có
    _mapViewpointChangedSubscription = _mapFacade
        .mapController
        .onViewpointChanged
        .listen((_) {
          // Hủy timer cũ nếu map vẫn đang di chuyển
          _debounceTimer?.cancel();

          // Chỉ tính toán khi map đã DỪNG lại khoảng 200ms
          _debounceTimer = Timer(const Duration(milliseconds: 200), () {
            // Tác vụ nặng thực hiện ở đây (lúc người dùng đang nghỉ tay)
            try {
              final visibleArea = _mapFacade.mapController.visibleArea;
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
                  // AppLogger.ui(
                  //   "Map Center Updated - map_page: ${wgs84Point.y}, ${wgs84Point.x}",
                  // );
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

    // Lắng nghe scene 3D di chuyển - LƯU SUBSCRIPTION ĐỂ DISPOSE
    _sceneViewpointChangedSubscription
        ?.cancel(); // Cancel subscription cũ nếu có
    _sceneViewpointChangedSubscription = _mapFacade
        .sceneController
        .onViewpointChanged
        .listen((_) {
          // Hủy timer cũ nếu scene vẫn đang di chuyển
          _debounceTimer?.cancel();

          // Chỉ tính toán khi scene đã DỪNG lại khoảng 200ms
          _debounceTimer = Timer(const Duration(milliseconds: 200), () {
            try {
              // Lấy viewpoint hiện tại của scene
              final currentViewpoint = _mapFacade.sceneController
                  .getCurrentViewpoint(ViewpointType.centerAndScale);

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

                    // AppLogger.ui(
                    //   "Scene Center Updated: ${wgs84Point.y}, ${wgs84Point.x}",
                    // );
                  }
                }
              }
            } catch (e) {
              AppLogger.ui('Error updating scene center: $e', error: e);
            }
          });
        });
  }

  /// Fetch incidents với logic xử lý lỗi nâng cao
  Future<void> _retryData() async {
    ref
        .read(mapPageNotifierProvider.notifier)
        .fetchIncidents(isManualRetry: true);
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
                controllerProvider: () => _mapFacade.mapController,
                onMapViewReady: _onMapViewReady,
                onTap: (screenPoint) => _handleMapTap(screenPoint, is3D: false),
                // onLongPressEnd: (screenPoint) =>
                //     _mapInteractionLogic.onMapLongPressEnd(
                //       screenPoint: screenPoint,
                //       context: context,
                //       ref: ref,
                //       mounted: mounted,
                //       mapViewController: _mapViewController,
                //     ),
              ),
              // 3D Scene View - index 1
              ArcGISSceneView(
                controllerProvider: () => _mapFacade.sceneController,
                onSceneViewReady: _onSceneViewReady,
                onTap: (screenPoint) => _handleMapTap(screenPoint, is3D: true),
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
            mapViewController: _mapFacade.mapController,
            sceneViewController: _mapFacade.sceneController,
          ),
        ],
      ),
      // Button để bật GPS và Recenter về vị trí hiện tại
      floatingActionButton: MapFloatingActions(mapFacade: _mapFacade),
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
    return state.maybeWhen(
      loading: () => const MapLoadingOverlay(),
      submitting: (_) => const MapSubmittingOverlay(),
      orElse: () => const SizedBox.shrink(),
    );
  }

  /// Xử lý sự kiện chạm tay vào bản đồ
  Future<void> _handleMapTap(Offset screenPoint, {required bool is3D}) async {
    // 1. Hỏi Facade xem tao vừa chạm trúng cái ID nào không?
    final incidentId = await _mapFacade.onMapTap(screenPoint, is3D: is3D);

    // 2. Nếu trúng một sự cố -> Mở BottomSheet chi tiết
    if (incidentId != null && mounted) {
      AppLogger.ui("User tapped on Incident: $incidentId");

      // Lấy danh sách sự cố hiện tại từ State
      final List<domain.Incident> incidents = ref
          .read(mapPageNotifierProvider)
          .maybeWhen(
            loaded: (list) => list,
            submitted: (list) => list,
            orElse: () => <domain.Incident>[],
          );

      // Tìm sự cố đó trong mảng
      final selectedIncident = incidents.firstWhere(
        (inc) => inc.id == incidentId,
        orElse: () => incidents.first, // Fallback an toàn
      );

      // (Tùy chọn) Ra lệnh cho Facade Highlight cái Marker này lên (To ra/Đổi màu)
      // _mapFacade.highlightIncident(incidentId);

      // Ra lệnh cho Riverpod Provider để mở Bottom Sheet chi tiết lên!
      ref
          .read(mapBottomSheetProvider.notifier)
          .showIncidentDetail(selectedIncident);
    }
    // 3. Nếu chạm vào chỗ trống (Đóng Bottom Sheet hoặc Xóa Highlight)
    else {
      // _mapFacade.clearHighlight();
    }
  }
}
