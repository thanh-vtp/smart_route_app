import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:arcgis_maps_toolkit/arcgis_maps_toolkit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/app/notification_provider.dart';
import 'package:smart_route_app/core/app/router.dart';
import 'package:smart_route_app/core/common/map/interactions/interaction_result.dart';
import 'package:smart_route_app/core/common/map/location/location_state.dart';
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
import 'package:smart_route_app/features/navigation/presentation/state/navigation_notifier.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_state.dart';
import 'package:smart_route_app/features/navigation/presentation/widgets/alternative_routes_selector.dart';
import 'package:smart_route_app/maneuver_indicator.dart';
import 'reporting_bottom_sheet.dart';
import 'incident_detail_bottom_sheet.dart';

class MainMapView extends ConsumerStatefulWidget {
  const MainMapView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainMapViewState();
}

class _MainMapViewState extends ConsumerState<MainMapView> {
  bool _isMapInitialized = false;

  // CONTROLLER CHO NAVIGATION BOTTOM SHEET (khi đang navigate)
  final DraggableScrollableController _navSheetController =
      DraggableScrollableController();

  final double _navMinChildSize = 0.16;
  final double _navMaxChildSize = 0.6;
  bool _isNavSheetExpanded = false;

  // HÀM XỬ LÝ TOGGLE NAVIGATION SHEET
  void _toggleNavSheet() {
    setState(() {
      _isNavSheetExpanded = !_isNavSheetExpanded;
    });

    _navSheetController.animateTo(
      _isNavSheetExpanded ? _navMaxChildSize : _navMinChildSize,
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
    _navSheetController.dispose();
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
    ) async {
      if (nextIncidentId != null) {
        // Recenter map smoothly to the incident from notification
        await ref.read(mapFacadeProvider).recenterToIncident(nextIncidentId);

        if (!mounted) return;

        // Mở BottomSheet Chi tiết sự cố
        _showIncidentDetail(context, nextIncidentId);

        // Reset lại Provider về null để lần sau user bấm thông báo khác nó còn chạy tiếp
        Future.microtask(() {
          ref.read(selectedIncidentIdFromNotificationProvider.notifier).state =
              null;
        });
      }
    });

    // Listen for route changes to recenter map
    ref.listen<RouteState>(routeNotifierProvider, (previous, next) async {
      // Khi có route mới được tính toán
      if (next.routeResult != null && previous?.routeResult == null) {
        final route = next.routeResult!;

        // Recenter map để hiển thị toàn bộ route
        if (route.polylinePoints.isNotEmpty) {
          // Lấy điểm giữa route để recenter
          final midPoint =
              route.polylinePoints[route.polylinePoints.length ~/ 2];

          await ref
              .read(mapFacadeProvider)
              .recenterToPoint(
                ArcGISPoint(
                  x: midPoint.lng,
                  y: midPoint.lat,
                  spatialReference: SpatialReference.wgs84,
                ),
                scale: 15000, // Zoom out để nhìn toàn bộ route
              );
        }
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

            // B. Banner lệch tuyến / đang tính lại đường
            _buildOffRouteBanner(context, cs, textTheme),

            // C. Đồng hồ tốc độ tròn (Góc dưới trái)
            _buildSpeedometer(context, cs, textTheme),

            // D. Nút Báo cáo sự cố khi đang lái xe (Góc dưới phải)
            _buildActiveReportButton(context, cs, textTheme),

            // E. Bảng trượt danh sách chỉ dẫn chi tiết (Draggable Bottom Sheet)
            _buildNavigationDraggableBottomPanel(
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
    // Ưu tiên dùng NavigationSession để lấy bước hiện tại (real-time)
    final navSession = ref.watch(navigationNotifierProvider).session;
    final currentDirection =
        navSession?.currentDirection ??
        (routeResult.directions.isNotEmpty
            ? routeResult.directions.first
            : null);
    final nextDirection =
        navSession?.nextDirection ??
        (routeResult.directions.length > 1 ? routeResult.directions[1] : null);

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

  // --- B. BANNER LỆCH TUYẾN / ĐANG TÍNH LẠI ---
  Widget _buildOffRouteBanner(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
  ) {
    final navState = ref.watch(navigationNotifierProvider);
    final session = navState.session;

    if (session == null) return const SizedBox.shrink();
    if (!session.isOffRoute && !session.isRerouting) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: MediaQuery.of(context).size.height * 0.35,
      left: 24,
      right: 24,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: session.isRerouting
                ? cs.tertiaryContainer
                : cs.errorContainer,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              if (session.isRerouting)
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: cs.onTertiaryContainer,
                  ),
                )
              else
                Icon(
                  Icons.warning_amber_rounded,
                  color: cs.onErrorContainer,
                  size: 20,
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  session.isRerouting
                      ? 'Đang tính lại đường...'
                      : 'Bạn đã đi lệch tuyến đường',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: session.isRerouting
                        ? cs.onTertiaryContainer
                        : cs.onErrorContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- C. ĐỒNG HỒ TỐC ĐỘ (GÓC DƯỚI TRÁI) ---
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

  // --- D. BẢNG TRƯỢT DANH SÁCH CHỈ ĐƯỜNG KHI ĐANG NAVIGATE ---
  Widget _buildNavigationDraggableBottomPanel(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    entity.RouteResult routeResult,
    List<RouteDirection> directions,
  ) {
    return DraggableScrollableSheet(
      controller: _navSheetController,
      initialChildSize: _navMinChildSize,
      minChildSize: _navMinChildSize,
      maxChildSize: _navMaxChildSize,
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
            onTap: _toggleNavSheet,
            behavior: HitTestBehavior.opaque,
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
                            child: Builder(
                              builder: (context) {
                                // Dùng session nếu đang điều hướng để hiện remaining
                                final navSession = ref
                                    .watch(navigationNotifierProvider)
                                    .session;
                                final eta =
                                    navSession?.estimatedArrival ??
                                    routeResult.estimatedArrival;
                                final summary = navSession != null
                                    ? '${navSession.formattedRemainingTime} • ${navSession.formattedRemainingDistance}'
                                    : '${routeResult.formattedTime} • ${routeResult.formattedDistance}';

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          eta,
                                          style: textTheme.headlineLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w900,
                                                color: cs.primary,
                                                fontSize: 36,
                                                height: 1.0,
                                              ),
                                        ),
                                        const SizedBox(width: 8),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 4,
                                          ),
                                          child: Text(
                                            'Dự kiến',
                                            style: textTheme.labelMedium
                                                ?.copyWith(
                                                  color: cs.onSurfaceVariant,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      summary,
                                      style: textTheme.titleMedium?.copyWith(
                                        color: cs.onSurfaceVariant,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                );
                              },
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
                      final currentStepIndex =
                          ref
                              .watch(navigationNotifierProvider)
                              .session
                              ?.currentDirectionIndex ??
                          0;
                      return _buildDirectionListItem(
                        dir,
                        textTheme,
                        cs,
                        isActive: index == currentStepIndex,
                      );
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
    ColorScheme cs, {
    bool isActive = false,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      tileColor: isActive ? cs.primaryContainer.withOpacity(0.25) : null,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: (isActive ? cs.primary : dir.maneuverType.color).withOpacity(
            0.15,
          ),
          shape: BoxShape.circle,
          border: isActive ? Border.all(color: cs.primary, width: 2) : null,
        ),
        child: Icon(
          dir.maneuverType.icon,
          color: isActive ? cs.primary : dir.maneuverType.color,
          size: 24,
        ),
      ),
      title: Text(
        dir.instruction,
        style: textTheme.titleMedium?.copyWith(
          fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
          color: isActive ? cs.primary : cs.onSurface,
        ),
      ),
      subtitle: dir.distanceMeters > 0
          ? Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                dir.formattedDistance,
                style: textTheme.bodyMedium?.copyWith(
                  color: isActive ? cs.primary : cs.outline,
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
        // 1. ArcGISMapView — dùng cho cả Explore và Navigation
        // Navigation mode: LocationDisplayAutoPanMode.navigation (tilt + compass)
        // Explore mode: LocationDisplayAutoPanMode.recenter
        Positioned.fill(
          child: ArcGISMapView(
            controllerProvider: () {
              final controller = ref.read(mapControllerBundleProvider).map2D;
              AppLogger.debug('MapController ${identityHashCode(controller)}');
              return controller;
            },
            onMapViewReady: () async {
              if (_isMapInitialized) return;
              _isMapInitialized = true;
              await ref.read(mapUiProvider.notifier).initialize();

              // Tự động bật GPS + recenter sau khi map sẵn sàng
              // Giống Google Maps: vào app là thấy vị trí ngay, không cần bấm nút
              await ref.read(locationUiProvider.notifier).startLocation();
            },
            onTap: (screenPoint) async {
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
                  await ref
                      .read(mapFacadeProvider)
                      .recenterToIncident(result.objectId!);
                  if (!mounted) return;
                  await _showIncidentDetail(this.context, result.objectId!);
                  ref.read(mapFacadeProvider).clearSelection();
                  AppLogger.ui('Mở Báo Cáo: ${result.objectId!}');
                  break;
                case InteractionType.none:
                  ref.read(mapFacadeProvider).clearSelection();
                  break;
                default:
                  break;
              }
            },
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
                // ── Compass (ArcGIS Toolkit) ──────────────────────────────
                // Tự động ẩn khi map đang hướng Bắc (rotation = 0°)
                // Bấm để reset về North-Up
                Compass(
                  controllerProvider: () =>
                      ref.read(mapControllerBundleProvider).map2D,
                  padding: EdgeInsets.all(0),
                  automaticallyHides: false,
                  size: 40,
                ),

                const SizedBox(height: 8),

                // ── Location Button ────────────────────────────────────────
                // OFF       → 📍 (xám)    : bấm để bắt đầu follow
                // FOLLOW    → 📍 (xanh)   : map recenter theo vị trí
                // NAVIGATION→ 🧭 (xanh đậm): map xoay theo hướng di chuyển
                _buildLocationButton(cs, locationState),

                const SizedBox(height: 16),

                // ── Nút BÁO CÁO ───────────────────────────────────────────
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
    // Lấy thông tin alternatives từ state
    final routeState = ref.watch(routeNotifierProvider);
    final alternatives = routeState.alternativeRoutesResult;
    final selectedStrategy =
        routeState.selectedStrategy ?? RouteStrategy.balanced;

    return Container(
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Thanh Drag Handle
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
                alternatives != null
                    ? 'Lựa chọn lộ trình'
                    : 'Đã chọn lộ trình né sự cố',
                style: textTheme.titleSmall?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Button hủy Route
              GestureDetector(
                onTap: () {
                  ref.read(routeNotifierProvider.notifier).clearRoute();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: cs.surface,
                    shape: BoxShape.circle,
                    border: Border.all(color: cs.outlineVariant),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.close,
                    color: cs.onSurfaceVariant,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ALTERNATIVE ROUTES SELECTOR (nếu có)
          if (alternatives != null && alternatives.alternatives.isNotEmpty) ...[
            AlternativeRoutesSelector(
              alternatives: alternatives,
              selectedStrategy: selectedStrategy,
            ),
            const SizedBox(height: 16),
          ],

          // SELECTED ROUTE INFO
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

  /// Location Button với 3 trạng thái: OFF → FOLLOW → NAVIGATION → OFF
  ///
  /// OFF       : icon xám, gợi ý bấm để bắt đầu
  /// FOLLOW    : icon xanh, map đang recenter theo GPS
  /// NAVIGATION: icon compass xanh đậm, map đang xoay theo heading
  Widget _buildLocationButton(ColorScheme cs, LocationState locationState) {
    final mode = locationState.trackingMode;

    final (icon, color, bgColor) = switch (mode) {
      LocationTrackingMode.off => (
        Icons.location_searching,
        cs.onSurfaceVariant,
        cs.surfaceContainerLowest,
      ),
      LocationTrackingMode.follow => (
        Icons.my_location,
        cs.primary,
        cs.primaryContainer,
      ),
      LocationTrackingMode.navigation => (
        Icons.navigation,
        cs.onPrimary,
        cs.primary,
      ),
    };

    return FloatingActionButton.small(
      heroTag: 'my_location',
      onPressed: () {
        ref.read(locationUiProvider.notifier).cycleLocationMode();
      },
      backgroundColor: bgColor,
      foregroundColor: color,
      elevation: 2,
      child: Icon(icon, color: color),
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
                // TODO: Navigate to NotificationScreen
                context.go(AppRoutes.notifications);
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
