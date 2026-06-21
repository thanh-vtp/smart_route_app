/// Floating controls góc phải màn hình bản đồ (explore mode).
///
/// Bao gồm từ trên xuống dưới:
///   - [Compass] (ArcGIS Toolkit): la bàn xoay theo map, ẩn khi hướng Bắc,
///     bấm để reset về North-Up
///   - [LocationButton]: 3 trạng thái OFF → FOLLOW → NAVIGATION
///   - FAB "BÁO CÁO": mở reporting bottom sheet
library;

import 'package:arcgis_maps_toolkit/arcgis_maps_toolkit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/location/location_state.dart';
import 'package:smart_route_app/core/map_service/providers/map_controller_bundle_provider.dart';
import 'package:smart_route_app/features/map_drawing/state/location_ui_notifier.dart';

/// Cụm floating controls bên phải: Compass + Location button + FAB báo cáo.
class MapLocationControls extends ConsumerWidget {
  /// Callback khi bấm nút "BÁO CÁO"
  final VoidCallback onReportTap;

  const MapLocationControls({super.key, required this.onReportTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final locationState = ref.watch(locationUiProvider);

    return Positioned(
      bottom: 16,
      right: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Compass — tự ẩn khi map đang hướng Bắc (rotation = 0°)
          Compass(
            controllerProvider: () =>
                ref.read(mapControllerBundleProvider).map2D,
            padding: EdgeInsets.zero,
            size: 40,
          ),

          const SizedBox(height: 8),

          // Location button: OFF → FOLLOW → NAVIGATION → OFF
          _LocationButton(cs: cs, locationState: locationState),

          const SizedBox(height: 16),

          // FAB Báo cáo
          FloatingActionButton.extended(
            heroTag: 'report_incident',
            onPressed: onReportTap,
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
    );
  }
}

/// Location Button 3 trạng thái theo [LocationTrackingMode].
class _LocationButton extends ConsumerWidget {
  final ColorScheme cs;
  final LocationState locationState;

  const _LocationButton({required this.cs, required this.locationState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      onPressed: () =>
          ref.read(locationUiProvider.notifier).cycleLocationMode(),
      backgroundColor: bgColor,
      foregroundColor: color,
      elevation: 2,
      child: Icon(icon, color: color),
    );
  }
}
