/// Màn hình bản đồ chính — điểm vào duy nhất của ứng dụng sau khi đăng nhập.
///
/// Quản lý 3 chế độ hiển thị:
///   - **Explore**: bản đồ tự do, search bar, floating controls
///   - **Route preview**: bản đồ + route polyline + [RouteSummarySheet]
///   - **Navigation**: bản đồ + overlay turn-by-turn ([NavigationTopBanner],
///     [OffRouteBanner], [NavigationSpeedometer], [NavigationBottomPanel])
///
/// Không chứa business logic — tất cả được ủy quyền cho:
///   - [MapUiNotifier] (map state, navigation start/stop)
///   - [RouteNotifier] (route state)
///   - [NavigationNotifier] (turn-by-turn tracking)
///   - [LocationUiNotifier] (GPS tracking mode)
library;

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/app/notification_provider.dart';
import 'package:smart_route_app/core/common/map/interactions/interaction_result.dart';
import 'package:smart_route_app/core/common/map/providers/map_controller_bundle_provider.dart';
import 'package:smart_route_app/core/common/map/providers/map_facade_provider.dart';
import 'package:smart_route_app/core/common/screens/state/incidents_provider.dart';
import 'package:smart_route_app/core/common/screens/state/location_ui_notifier.dart';
import 'package:smart_route_app/core/common/screens/state/map_ui_notifier.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/cluster/presentation/states/cluster_notifier.dart';
import 'package:smart_route_app/features/cluster/presentation/states/cluster_state.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_state.dart';
import 'package:smart_route_app/features/navigation/presentation/widgets/navigation_bottom_panel.dart';
import 'package:smart_route_app/features/navigation/presentation/widgets/navigation_speedometer.dart';
import 'package:smart_route_app/features/navigation/presentation/widgets/navigation_top_banner.dart';
import 'package:smart_route_app/features/navigation/presentation/widgets/route_summary_sheet.dart';
import 'package:smart_route_app/shared/widgets/map_location_controls.dart';
import 'package:smart_route_app/shared/widgets/map_search_bar.dart';
import 'incident_detail_bottom_sheet.dart';
import 'reporting_bottom_sheet.dart';

class MainMapView extends ConsumerStatefulWidget {
  const MainMapView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainMapViewState();
}

class _MainMapViewState extends ConsumerState<MainMapView> {
  bool _isMapInitialized = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final notifierIncidents = ref.read(incidentsProvider.notifier);
      await notifierIncidents.fetchIncidents();
      notifierIncidents.listenToRealtimeUpdates();

      await ref.read(clusterNotifierProvider.notifier).fetchClusters();
    });

    ref.listenManual<IncidentsState>(incidentsProvider, (previous, next) async {
      await ref.read(mapUiProvider.notifier).renderIncidents(next.incidents);
      AppLogger.debug('renderIncidents: ${next.incidents.length}');
    });

    ref.listenManual<ClusterState>(clusterNotifierProvider, (
      previous,
      next,
    ) async {
      final clusterResult = next.clusterResult;
      if (clusterResult != null) {
        await ref
            .read(mapUiProvider.notifier)
            .renderClusters(clusterResult.clusters);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final mapUiState = ref.watch(mapUiProvider);
    final routeState = ref.watch(routeNotifierProvider);
    final hasRoute = routeState.routeResult != null;
    final isNavigating = mapUiState.isNavigating;

    // Recenter khi có route mới
    ref.listen<RouteState>(routeNotifierProvider, (previous, next) async {
      if (next.routeResult != null && previous?.routeResult == null) {
        final route = next.routeResult!;
        if (route.polylinePoints.isNotEmpty) {
          final mid = route.polylinePoints[route.polylinePoints.length ~/ 2];
          await ref
              .read(mapFacadeProvider)
              .recenterToPoint(
                ArcGISPoint(
                  x: mid.lng,
                  y: mid.lat,
                  spatialReference: SpatialReference.wgs84,
                ),
                scale: 15000,
              );
        }
      }
    });

    // Recenter khi có notification incident
    ref.listen<String?>(selectedIncidentIdFromNotificationProvider, (
      _,
      nextId,
    ) async {
      if (nextId == null) return;
      await ref.read(mapFacadeProvider).recenterToIncident(nextId);
      if (!mounted) return;
      _showIncidentDetail(context, nextId);
      Future.microtask(() {
        ref.read(selectedIncidentIdFromNotificationProvider.notifier).state =
            null;
      });
    });

    return Scaffold(
      backgroundColor: cs.surface,
      // Route summary sheet (explore mode có route)
      bottomSheet: (hasRoute && !isNavigating)
          ? RouteSummarySheet(routeResult: routeState.routeResult!)
          : null,
      body: Stack(
        children: [
          // ── Lớp bản đồ ───────────────────────────────────────────────────
          _MapLayer(
            onMapReady: () async {
              if (_isMapInitialized) return;
              _isMapInitialized = true;
              await ref.read(mapUiProvider.notifier).initialize();
              // Không tự động start location ở đây —
              // để cycleLocationMode() xin permission khi user chủ động bấm nút.
            },
            onTap: _handleMapTap,
            mapUiState: mapUiState,
          ),

          // ── Navigation overlays ───────────────────────────────────────────
          if (isNavigating && routeState.routeResult != null) ...[
            NavigationTopBanner(routeResult: routeState.routeResult!),
            const OffRouteBanner(),
            const NavigationSpeedometer(),
            _NavigationReportButton(onTap: () => _showReportingSheet(context)),
            NavigationBottomPanel(
              routeResult: routeState.routeResult!,
              directions: routeState.routeResult!.directions,
            ),
          ],
        ],
      ),
    );
  }

  // ── Map tap handler ─────────────────────────────────────────────────────────

  Future<void> _handleMapTap(Offset screenPoint) async {
    final result = await ref.read(mapFacadeProvider).onTap(screenPoint);
    if (!mounted) return;

    switch (result.type) {
      case InteractionType.incident:
        if (result.objectId == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Không thể xác định báo cáo. Thử lại sau.'),
            ),
          );
          return;
        }
        await ref.read(mapFacadeProvider).selectIncident(result.objectId!);
        await ref.read(mapFacadeProvider).recenterToIncident(result.objectId!);
        if (!mounted) return;
        await _showIncidentDetail(context, result.objectId!);
        ref.read(mapFacadeProvider).clearSelection();
        AppLogger.ui('Mở Báo Cáo: ${result.objectId!}');
        break;
      case InteractionType.none:
        ref.read(mapFacadeProvider).clearSelection();
        break;
      default:
        break;
    }
  }

  // ── Bottom sheets ───────────────────────────────────────────────────────────

  Future<void> _showReportingSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ReportingBottomSheet(),
    );
  }

  Future<void> _showIncidentDetail(BuildContext context, String incidentId) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => IncidentDetailBottomSheet(incidentId: incidentId),
    );
  }
}

// ============================================================
// _MapLayer
// ============================================================

/// Layer bản đồ ArcGIS + explore controls (search bar, floating buttons).
/// Tách thành StatefulWidget riêng để tránh rebuild toàn bộ tree.
class _MapLayer extends ConsumerStatefulWidget {
  final Future<void> Function() onMapReady;
  final Future<void> Function(Offset) onTap;
  final dynamic mapUiState;

  const _MapLayer({
    required this.onMapReady,
    required this.onTap,
    required this.mapUiState,
  });

  @override
  ConsumerState<_MapLayer> createState() => _MapLayerState();
}

class _MapLayerState extends ConsumerState<_MapLayer> {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final mapUiState = widget.mapUiState;
    final routeState = ref.watch(routeNotifierProvider);
    final hasRoute = routeState.routeResult != null;

    return Stack(
      children: [
        // ArcGIS MapView
        Positioned.fill(
          child: ArcGISMapView(
            controllerProvider: () {
              final controller = ref.read(mapControllerBundleProvider).map2D;
              AppLogger.debug('MapController ${identityHashCode(controller)}');
              return controller;
            },
            onMapViewReady: widget.onMapReady,

            onTap: widget.onTap,
          ),
        ),

        // Loading overlay
        if (mapUiState.isLoading)
          Positioned.fill(
            child: Container(
              color: cs.surface,
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),

        // Error fallback
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
                  FilledButton(onPressed: () {}, child: const Text('Thử lại')),
                ],
              ),
            ),
          ),

        // Explore mode controls (ẩn khi có route)
        if (!hasRoute) ...[
          // Search bar phía trên
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: const MapSearchBar(),
          ),

          // Compass + Location + Report FAB (góc phải)
          MapLocationControls(
            onReportTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const ReportingBottomSheet(),
            ),
          ),

          // Layers + Tune (góc trái)
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
}

// ============================================================
// _NavigationReportButton
// ============================================================

/// Nút "BÁO CÁO" góc dưới phải trong chế độ navigation.
class _NavigationReportButton extends StatelessWidget {
  final VoidCallback onTap;

  const _NavigationReportButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Positioned(
      right: 16,
      bottom: MediaQuery.of(context).size.height * 0.15 + 16,
      child: FloatingActionButton.extended(
        heroTag: 'active_report',
        onPressed: onTap,
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
}
