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

  void dispose() {
    // Stop location data source when exiting (best practice từ sample code)
    _locationDataSource.stop();
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
        // Set auto-pan mode trước khi start
        locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;

        // Attempt to start the location data source (best practice từ sample code)
        // Ref: https://developers.arcgis.com/flutter/sample-code/show-device-location/
        try {
          await _locationDataSource.start();

          // Log current location after starting
          final location = locationDisplay.location;
          if (location != null) {
            final lat = location.position.y;
            final lon = location.position.x;
            AppLogger.ui(
              'LocationDisplay started - Current location: Lat: $lat, Lon: $lon',
            );
          } else {
            AppLogger.ui('LocationDisplay started for 2D map');
          }

          // Listen to location changes and log them
          locationDisplay.onLocationChanged.listen((location) {
            final lat = location.position.y;
            final lon = location.position.x;
            AppLogger.ui('Location updated: Lat: $lat, Lon: $lon');
          });
        } on ArcGISException catch (e) {
          AppLogger.ui(
            'ArcGIS Error starting LocationDisplay: ${e.message}',
            error: e,
          );
          if (mounted) {
            // Tắt LocationDisplay trong provider nếu có lỗi
            ref.read(locationDisplayProviderProvider.notifier).disable();

            // Hiển thị thông báo cho user
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Không thể bật GPS: ${e.message}'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        } catch (e) {
          AppLogger.ui('Error starting LocationDisplay: $e', error: e);
          if (mounted) {
            ref.read(locationDisplayProviderProvider.notifier).disable();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Không thể bật GPS: $e'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        }
      } else {
        // Stop location data source
        _locationDataSource.stop();
        AppLogger.ui('LocationDisplay stopped for 2D map');
      }
    } else {
      // 3D Scene không hỗ trợ LocationDisplay
      if (enabled && mounted) {
        // Tự động tắt LocationDisplay trong provider
        ref.read(locationDisplayProviderProvider.notifier).disable();

        // Thông báo cho user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('GPS chỉ khả dụng ở chế độ 2D'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 2),
          ),
        );
        AppLogger.ui('LocationDisplay not supported in 3D scene');
      }
    }
  }
}
