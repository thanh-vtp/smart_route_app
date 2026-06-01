import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/interactions/interaction_result.dart';
import 'package:smart_route_app/core/common/map/providers/map_controller_bundle_provider.dart';
import 'package:smart_route_app/core/common/map/providers/map_facade_provider.dart';
import 'package:smart_route_app/core/common/screens/state/incidents_provider.dart';
import 'package:smart_route_app/core/common/screens/state/location_ui_notifier.dart';
import 'package:smart_route_app/core/common/screens/state/map_ui_notifier.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
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

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final notifier = ref.read(incidentsProvider.notifier);

      await notifier.fetchIncidents(); // fetch
      notifier.listenToRealtimeUpdates(); // update
    });

    ref.listenManual<IncidentsState>(incidentsProvider, (previous, next) async {
      await ref.read(mapUiProvider.notifier).renderIncidents(next.incidents);
      AppLogger.debug('renderIncidents: ${next.incidents.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Stack(
        children: [
          // Index 0/1: Map View (We reuse the map for both Explore and Go for simplicity here)
          _buildMapLayer(context, cs, textTheme),
        ],
      ),
    );
  }

  Widget _buildMapLayer(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
  ) {
    final mapUiState = ref.watch(mapUiProvider);
    final locationState = ref.watch(locationUiProvider);

    return Stack(
      children: [
        // 1. Map Layer (Placeholder filling the screen)
        Positioned.fill(
          child: ArcGISMapView(
            controllerProvider: () {
              return ref.read(mapControllerBundleProvider).map2D;
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
        ),

        // Central Map Makers (Placeholder for visual context)
        // Center(
        //   child: GestureDetector(
        //     onTap: () {
        //       _showIncidentDetail(context);
        //     },
        //     child: Icon(Icons.shield, size: 48, color: cs.primary),
        //   ),
        // ),

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
      onTap: () {
        // TODO '/explore/search' is the route for SearchScreen
        context.push('/explore/search');
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

// Subtle grid painter to simulate the map background aesthetic in the spec.
class _MapGridPainter extends CustomPainter {
  final Color color;

  _MapGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    const double spacing = 40.0;

    for (double i = 0; i <= size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i <= size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _MapGridPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
