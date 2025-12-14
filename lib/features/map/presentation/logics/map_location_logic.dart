import 'dart:async';

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/map/presentation/providers/location_display_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';

/// Xử lý logic liên quan đến Location Map / GPS
class MapLocationLogic {
  // Create system location data source (best practice theo tài liệu ArcGIS)
  final _locationDataSource = SystemLocationDataSource();

  /// Thêm
  /// Getter để truy cập dataSource
  SystemLocationDataSource get locationDataSource => _locationDataSource;

  // Biến để quản lý việc lắng nghe stream, giúp tránh memory leak
  StreamSubscription<ArcGISLocation>? _locationSubscription;

  void dispose() {
    _stopLocationUpdates();
    // Stop location data source when exiting (best practice từ sample code)
    _locationDataSource.stop();
  }

  void _stopLocationUpdates() {
    _locationSubscription?.cancel();
    _locationSubscription = null;
  }

  /// Cập nhật LocationDisplay cho view đang active
  /// Best practice theo: https://developers.arcgis.com/flutter/sample-code/show-device-location/
  Future<void> updateLocationDisplay({
    required bool enabled,
    required MapMode mode,
    required BuildContext context,
    required WidgetRef ref,
    required ArcGISMapViewController mapViewController,
    required bool mapViewReady,
    required bool mounted,
  }) async {
    // 1. 3D không hỗ trợ GPS → auto tắt nếu user bật
    if (mode == MapMode.scene3D) {
      if (enabled && mounted) {
        ref.read(locationDisplayProviderProvider.notifier).disable();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('GPS chỉ hỗ trợ ở chế độ 2D'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 2),
          ),
        );

        AppLogger.ui(
          'GPS disabled — 3D SceneView không hỗ trợ LocationDisplay',
        );
      }
      return;
    }

    if (mode == MapMode.map2D) {
      // Kiểm tra xem map view đã sẵn sàng chưa
      if (!mapViewReady) {
        AppLogger.ui('Map view not ready yet, skipping LocationDisplay update');
        // Tắt LocationDisplay nếu map chưa sẵn sàng
        if (enabled && mounted) {
          ref.read(locationDisplayProviderProvider.notifier).disable();
        }
        return;
      }

      // LocationDisplay chỉ hỗ trợ cho 2D Map
      final locationDisplay = mapViewController.locationDisplay;

      if (enabled) {
        if (locationDisplay.started) return;

        // Attempt to start the location data source (best practice từ sample code)
        // Ref: https://developers.arcgis.com/flutter/sample-code/show-device-location/
        try {
          // Set auto-pan mode trước khi start
          locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;

          // Gán data source, dùng SystemLocationDataSource
          locationDisplay.dataSource = _locationDataSource;
          locationDisplay.start();

          _stopLocationUpdates();

          // Log current location after starting
          // final location = locationDisplay.location;
          // if (location != null) {
          //   final lat = location.position.y;
          //   final lon = location.position.x;
          //   AppLogger.ui(
          //     'LocationDisplay started - Current location: Lat: $lat, Lon: $lon',
          //   );
          // } else {
          //   AppLogger.ui('LocationDisplay started for 2D map');
          // }

          // Listen to location changes and log them
          // locationDisplay.onLocationChanged.listen((location) {
          //   final lat = location.position.y;
          //   final lon = location.position.x;
          //   AppLogger.ui('Location updated: Lat: $lat, Lon: $lon');
          // });
        } on ArcGISException catch (e) {
          _handelCatchError(
            message: e.toString(),
            mounted: mounted,
            ref: ref,
            context: context,
          );
        } catch (e) {
          _handelCatchError(
            message: e.toString(),
            mounted: mounted,
            ref: ref,
            context: context,
          );
        }
      } else {
        _stopLocationUpdates();
        // Stop location data source
        if (locationDisplay.started) {
          locationDisplay.stop();
        }
        AppLogger.ui('LocationDisplay stopped for 2D map');
      }
    }
  }

  _handelCatchError({
    required String message,
    required bool mounted,
    required WidgetRef ref,
    required BuildContext context,
  }) {
    AppLogger.ui('Error starting LocationDisplay: $message', error: message);
    if (mounted) {
      ref.read(locationDisplayProviderProvider.notifier).disable();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Không thể bật GPS: $message'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
