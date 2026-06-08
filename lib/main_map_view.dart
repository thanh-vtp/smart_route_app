import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/app/notification_provider.dart';
import 'package:smart_route_app/core/common/map/interactions/interaction_result.dart';
import 'package:smart_route_app/core/common/map/providers/map_controller_bundle_provider.dart';
import 'package:smart_route_app/core/common/map/providers/map_facade_provider.dart';
import 'package:smart_route_app/core/common/screens/state/incidents_provider.dart';
import 'package:smart_route_app/core/common/screens/state/location_ui_notifier.dart';
import 'package:smart_route_app/core/common/screens/state/map_ui_notifier.dart';
import 'package:smart_route_app/core/common/screens/state/map_ui_state.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/cluster/presentation/states/cluster_notifier.dart';
import 'package:smart_route_app/features/cluster/presentation/states/cluster_state.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart'
    as entity;
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';
import 'package:smart_route_app/maneuver_indicator.dart';
import 'reporting_bottom_sheet.dart';
import 'incident_detail_bottom_sheet.dart';
import 'package:smart_route_app/core/common/map/location/device_location_status.dart';

class MainMapView extends ConsumerStatefulWidget {
  const MainMapView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainMapViewState();
}

class _MainMapViewState extends ConsumerState<MainMapView> {
  bool _isMapInitialized = false;

  // 1. KHAI BÁO CONTROLLER ĐỂ ĐIỀU KHIỂN BOTTOM SHEET
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  // Các mốc kích thước của Bottom Sheet
  final double _minChildSize = 0.16;
  final double _maxChildSize = 0.6;
  bool _isSheetExpanded = false; // Biến trạng thái để biết đang thu hay mở

  // 2. HÀM XỬ LÝ SỰ KIỆN NHẤP VÀO HEADER
  void _toggleSheet() {
    setState(() {
      _isSheetExpanded = !_isSheetExpanded;
    });

    // Chạy Animation phóng to hoặc thu nhỏ
    _sheetController.animateTo(
      _isSheetExpanded ? _maxChildSize : _minChildSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final notifierIncidents = ref.read(incidentsProvider.notifier);
      await notifierIncidents.fetchIncidents(); // fetch incidents
      notifierIncidents.listenToRealtimeUpdates(); // update realtime incidents

      await ref.read(clusterNotifierProvider.notifier).fetchClusters();
    });

    ref.listenManual<IncidentsState>(incidentsProvider, (previous, next) async {
      await ref.read(mapUiProvider.notifier).renderIncidents(next.incidents);
      AppLogger.debug('renderIncidents: ${next.incidents.length}');
    });

    // LẮNG NGHE KẾT QUẢ PHÂN CỤM (DBSCAN) ĐỂ VẼ LÊN MAP
    ref.listenManual<ClusterState>(clusterNotifierProvider, (
      previous,
      next,
    ) async {
      final clusterResult = next.clusterResult;

      // AppLogger.debug(
      //   'Cluster result updated: $clusterResult',
      //   name: 'MainMapView',
      // );

      if (clusterResult != null) {
        await ref
            .read(mapUiProvider.notifier)
            .renderClusters(clusterResult.clusters);

        // AppLogger.debug(
        //   'Cluster count = ${clusterResult.clusters.length}',
        //   name: 'MainMapView',
        // );
      }
    });

    // AppLogger.debug('MainMapView init ${identityHashCode(this)}');
  }

  @override
  void dispose() {
    _sheetController.dispose();
    // AppLogger.debug('MainMapView dispose ${identityHashCode(this)}');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final mapUiState = ref.watch(mapUiProvider);
    final routeState = ref.watch(routeNotifierProvider);
    final hasRoute = routeState.routeResult != null;

    final isNavigating = mapUiState.isNavigating; // Trạng thái đang dẫn đường

    ref.listen<String?>(selectedIncidentIdFromNotificationProvider, (
      previous,
      nextIncidentId,
    ) {
      if (nextIncidentId != null) {
        // Mở BottomSheet Chi tiết sự cố
        _showIncidentDetail(context, nextIncidentId);

        // Reset lại Provider về null để lần sau user bấm thông báo khác nó còn chạy tiếp
        Future.microtask(() {
          ref.read(selectedIncidentIdFromNotificationProvider.notifier).state =
              null;
        });
      }
    });

    return Scaffold(
      backgroundColor: cs.surface,
      bottomSheet: (hasRoute && !isNavigating)
          ? _buildSummaryBottomSheet(
              cs,
              textTheme,
              context,
              routeState.routeResult!,
            )
          : null,
      body: Stack(
        children: [
          // Index 0/1: Map View (We reuse the map for both Explore and Go for simplicity here)
          _buildMapLayer(
            context,
            cs,
            textTheme,
            hasRoute,
            mapUiState,
            isNavigating,
          ),

          // Active Navigation: Chỉ đường
          if (isNavigating && routeState.routeResult != null) ...[
            // A. Bảng chỉ dẫn ngã rẽ ở trên cùng
            _buildActiveNavTopBanner(
              context,
              cs,
              textTheme,
              routeState.routeResult!,
            ),

            // B. Đồng hồ tốc độ tròn (Góc dưới trái)
            _buildSpeedometer(context, cs, textTheme),

            // C. Nút Báo cáo sự cố khi đang lái xe (Góc dưới phải)
            _buildActiveReportButton(context, cs, textTheme),

            // D. Bảng trượt danh sách chỉ dẫn chi tiết (Draggable Bottom Sheet)
            _buildDraggableBottomPanel(
              context,
              cs,
              textTheme,
              routeState.routeResult!,
              routeState.routeResult!.directions,
            ),
          ],
        ],
      ),
    );
  }

  // --- A. BẢNG CHỈ DẪN NGÃ RẼ TRÊN ĐỈNH ---
  Widget _buildActiveNavTopBanner(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    entity.RouteResult routeResult,
  ) {
    final List<RouteDirection> directions = routeResult.directions;
    final currentDirection = directions.isNotEmpty ? directions.first : null;
    final nextDirection = directions.length > 1 ? directions[1] : null;

    if (currentDirection == null) return const SizedBox.shrink();

    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 16,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ManeuverIndicator(
            type: currentDirection.maneuverType,
            distance: currentDirection.formattedDistance,
            instruction: currentDirection.instruction,
            size: ManeuverSize.large,
          ),
          const SizedBox(height: 8),
          if (nextDirection != null &&
              nextDirection.maneuverType != ManeuverType.stop)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: cs.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    nextDirection.maneuverType.icon,
                    size: 16,
                    color: nextDirection.maneuverType.color,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Sau đó ${nextDirection.formattedDistance}',
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.onSurface,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // --- B. ĐỒNG HỒ TỐC ĐỘ (GÓC DƯỚI TRÁI) ---
  Widget _buildSpeedometer(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
  ) {
    final locationState = ref.watch(locationUiProvider);
    final double speedMpS = locationState.location?.speed ?? 0.0;
    final int speedKmh = (speedMpS * 3.6).round();

    return Positioned(
      left: 16,
      bottom: MediaQuery.of(context).size.height * 0.15 + 16,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: cs.surfaceContainerLowest,
          shape: BoxShape.circle,
          border: Border.all(
            color: speedKmh > 80 ? cs.error : cs.outlineVariant,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              speedKmh.toString(),
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: cs.onSurface,
                height: 1.0,
              ),
            ),
            Text(
              'km/h',
              style: textTheme.labelSmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }

  // --- C. NÚT BÁO CÁO NHANH (GÓC DƯỚI PHẢI) ---
  Widget _buildActiveReportButton(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
  ) {
    return Positioned(
      right: 16,
      bottom: MediaQuery.of(context).size.height * 0.15 + 16,
      child: FloatingActionButton.extended(
        heroTag: 'active_report',
        onPressed: () => _showReportingSheet(context),
        backgroundColor: cs.error,
        foregroundColor: cs.onError,
        elevation: 4,
        icon: Icon(Icons.campaign, color: cs.onError),
        label: Text(
          'BÁO CÁO',
          style: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: cs.onError,
          ),
        ),
      ),
    );
  }

  // --- D. BẢNG TRƯỢT DANH SÁCH CHỈ ĐƯỜNG (Thay thế Navigator.pop bằng dừng dẫn đường) ---
  Widget _buildDraggableBottomPanel(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    entity.RouteResult routeResult,
    List<RouteDirection> directions,
  ) {
    return DraggableScrollableSheet(
      controller: _sheetController,
      initialChildSize: _minChildSize,
      minChildSize: _minChildSize,
      maxChildSize: _maxChildSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: cs.surfaceContainerLowest,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: _toggleSheet,
            behavior: HitTestBehavior.opaque, // Giúp vùng chạm mượt mà hơn
            child: Column(
              children: [
                // Drag Handle & Summary Header
                Column(
                  children: [
                    // --- DRAG HANDLE ---
                    const SizedBox(height: 12),
                    Container(
                      width: 48,
                      height: 5,
                      decoration: BoxDecoration(
                        color: cs.outlineVariant,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // --- HEADER TÓM TẮT ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      routeResult.estimatedArrival,
                                      style: textTheme.headlineLarge?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: cs.primary,
                                        fontSize: 36,
                                        height: 1.0,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        'Dự kiến',
                                        style: textTheme.labelMedium?.copyWith(
                                          color: cs.onSurfaceVariant,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${routeResult.formattedTime} • ${routeResult.formattedDistance}',
                                  style: textTheme.titleMedium?.copyWith(
                                    color: cs.onSurfaceVariant,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // NÚT THOÁT DẪN ĐƯỜNG: Gọi hàm dừng dẫn đường thay vì đóng màn hình!
                          GestureDetector(
                            onTap: () {
                              ref.read(mapUiProvider.notifier).stopNavigation();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: cs.errorContainer,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: cs.error,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                Divider(height: 1, color: cs.outlineVariant.withOpacity(0.3)),

                // --- DANH SÁCH CHỈ ĐƯỜNG CHI TIẾT ---
                Expanded(
                  child: ListView.separated(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: directions.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      indent: 64,
                      color: cs.surfaceVariant,
                    ),
                    itemBuilder: (context, index) {
                      final dir = directions[index];
                      return _buildDirectionListItem(dir, textTheme, cs);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ListTile _buildDirectionListItem(
    RouteDirection dir,
    TextTheme textTheme,
    ColorScheme cs,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: dir.maneuverType.color.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(
          dir.maneuverType.icon,
          color: dir.maneuverType.color,
          size: 24,
        ),
      ),
      title: Text(
        dir.instruction,
        style: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: cs.onSurface,
        ),
      ),
      subtitle: dir.distanceMeters > 0
          ? Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                dir.formattedDistance,
                style: textTheme.bodyMedium?.copyWith(
                  color: cs.outline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildMapLayer(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    bool hasRoute,
    MapUiState mapUiState,
    bool isNavigating,
  ) {
    final locationState = ref.watch(locationUiProvider);

    return Stack(
      children: [
        // 1. Map Layer (Placeholder filling the screen)
        Positioned.fill(
          child: IndexedStack(
            index: isNavigating ? 1 : 0,
            children: [
              ArcGISMapView(
                controllerProvider: () {
                  final controller = ref
                      .read(mapControllerBundleProvider)
                      .map2D;

                  AppLogger.debug(
                    'MapController ${identityHashCode(controller)}',
                  );

                  return controller;
                },
                onMapViewReady: () async {
                  if (_isMapInitialized) return;
                  _isMapInitialized = true;
                  await ref.read(mapUiProvider.notifier).initialize();
                },

                onTap: (screenPoint) async {
                  // Tap marker to Identify marker to Highlight marker to Show bottom sheet
                  final result = await ref
                      .read(mapFacadeProvider)
                      .onTap(screenPoint);
                  if (!mounted) return;
                  switch (result.type) {
                    case InteractionType.incident:
                      if (result.objectId == null) {
                        ScaffoldMessenger.of(this.context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Không thể xác định báo cáo. Thử lại sau.',
                            ),
                          ),
                        );
                        return;
                      }
                      await ref
                          .read(mapFacadeProvider)
                          .selectIncident(result.objectId!);
                      if (!mounted) return;
                      await _showIncidentDetail(this.context, result.objectId!);
                      ref
                          .read(mapFacadeProvider)
                          .clearSelection(); // Clear highlight marker
                      AppLogger.ui("Mở Báo Cáo: ${result.objectId!}");
                      break;
                    case InteractionType.none:
                      ref.read(mapFacadeProvider).clearSelection();
                      break;
                    default:
                      break;
                  }
                },
              ),

              ArcGISSceneView(
                controllerProvider: () {
                  final controller = ref
                      .read(mapControllerBundleProvider)
                      .scene3D;

                  AppLogger.debug(
                    'SceneController ${identityHashCode(controller)}',
                  );

                  return controller;
                },

                onTap: (screenPoint) async {
                  final result = await ref
                      .read(mapFacadeProvider)
                      .onTap(screenPoint);

                  if (!mounted) return;

                  switch (result.type) {
                    case InteractionType.incident:
                      if (result.objectId == null) return;

                      await ref
                          .read(mapFacadeProvider)
                          .selectIncident(result.objectId!);

                      if (!mounted) return;

                      await _showIncidentDetail(this.context, result.objectId!);

                      ref.read(mapFacadeProvider).clearSelection();
                      break;

                    case InteractionType.none:
                      ref.read(mapFacadeProvider).clearSelection();
                      break;

                    default:
                      break;
                  }
                },
              ),
            ],
          ),
        ),

        /// LOADING
        if (mapUiState.isLoading)
          Positioned.fill(
            child: Container(
              color: cs.surface,
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),

        /// ERROR FALLBACK
        if (mapUiState.error != null)
          Positioned.fill(
            child: Container(
              color: cs.surfaceContainerLow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined, size: 64, color: cs.outline),

                  const SizedBox(height: 16),

                  Text(
                    mapUiState.error ?? 'Không thể tải bản đồ',
                    style: textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 24),

                  FilledButton(
                    onPressed: () {
                      // ref.read(mapViewProvider.notifier).retry();
                    },
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            ),
          ),

        // KHI ĐANG CÓ LỘ TRÌNH (TÌM ĐƯỜNG XONG)
        if (!hasRoute) ...[
          // 2. Top Search Bar (Floating Card)
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: _buildSearchBar(context, cs, textTheme),
          ),

          // 3. Floating Controls (Bottom Right)
          Positioned(
            bottom: 16,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // My Location Button
                FloatingActionButton.small(
                  heroTag: 'my_location',
                  onPressed: () async {
                    final notifier = ref.read(locationUiProvider.notifier);

                    if (locationState.status != DeviceLocationStatus.running) {
                      await notifier.startLocation();
                      return;
                    }

                    notifier.recenter();
                  },
                  backgroundColor: cs.surfaceContainerLowest,
                  foregroundColor: cs.onSurfaceVariant,
                  elevation: 2,
                  child: Icon(
                    locationState.isFollowing
                        ? Icons.my_location
                        : Icons.location_searching,
                  ),
                ),
                const SizedBox(height: 16),
                // Massive BÁO CÁO FAB
                FloatingActionButton.extended(
                  heroTag: 'report_incident',
                  onPressed: () {
                    _showReportingSheet(context);
                  },
                  backgroundColor: cs.primary,
                  foregroundColor: cs.onPrimary,
                  elevation: 4,
                  icon: const Icon(Icons.campaign),
                  label: Text(
                    'BÁO CÁO',
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Extra floating controls (Bottom Left) like Layers/Tune
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FloatingActionButton.small(
                  heroTag: 'layers',
                  onPressed: () {},
                  backgroundColor: cs.surfaceContainerLowest,
                  foregroundColor: cs.onSurfaceVariant,
                  elevation: 2,
                  child: const Icon(Icons.layers_outlined),
                ),
                const SizedBox(height: 16),
                FloatingActionButton.small(
                  heroTag: 'tune',
                  onPressed: () {},
                  backgroundColor: cs.surfaceContainerLowest,
                  foregroundColor: cs.onSurfaceVariant,
                  elevation: 2,
                  child: const Icon(Icons.tune),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSummaryBottomSheet(
    ColorScheme cs,
    TextTheme textTheme,
    BuildContext context,
    entity.RouteResult routeResult,
  ) {
    return Container(
      // Bỏ margin ngoài để nó dính chặt vào đáy điện thoại
      padding: const EdgeInsets.fromLTRB(24, 12, 16, 32),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Tự co giãn ôm sát nội dung
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Thanh Drag Handle xám nhỏ trên đỉnh sheet
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: cs.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Đã chọn lộ trình né sự cố',
                style: textTheme.titleSmall?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Button hủy Route
              IconButton(
                icon: Icon(Icons.close, color: cs.onSurfaceVariant),
                onPressed: () {
                  // Gọi hàm xóa lộ trình -> Bản đồ tự dọn đường, BottomSheet tự thụt xuống
                  ref.read(routeNotifierProvider.notifier).clearRoute();
                },
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: cs.surface,
                  side: BorderSide(color: cs.outlineVariant),
                  elevation: 2,
                  shadowColor: Colors.black26,
                  minimumSize: const Size(40, 40),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          Text(
            routeResult.formattedTime,
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${routeResult.formattedDistance} • Tới lúc ${routeResult.estimatedArrival}',
            style: textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              ref.read(mapUiProvider.notifier).startNavigation();
            },
            style: FilledButton.styleFrom(
              backgroundColor: cs.primary,
              foregroundColor: cs.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BẮT ĐẦU ĐI',
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.navigation, color: cs.onPrimary, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showReportingSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ReportingBottomSheet(),
    );
  }

  Future<dynamic> _showIncidentDetail(BuildContext context, String incidentId) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => IncidentDetailBottomSheet(incidentId: incidentId),
    );
  }

  Widget _buildSearchBar(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
  ) {
    return GestureDetector(
      onTap: () async {
        // TODO '/explore/search' is the route for SearchScreen
        context.push('/explore/route-setup');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: cs.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: cs.outlineVariant.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // User Avatar Placeholder
            CircleAvatar(
              radius: 16,
              backgroundColor: cs.surfaceVariant,
              child: Icon(Icons.person, size: 20, color: cs.onSurfaceVariant),
            ),
            const SizedBox(width: 12),

            // Search Prompt
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.search, color: cs.outline),
                  const SizedBox(width: 8),
                  Text(
                    'Bạn muốn đi đâu?',
                    style: textTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // Notification Bell with Red Dot
            GestureDetector(
              onTap: () {
                // TODO '/explore/notifications' is the route for NotificationScreen
                context.push('/explore/notifications');
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.notifications_none, color: cs.onSurfaceVariant),
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: cs.error,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: cs.surfaceContainerLowest,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
