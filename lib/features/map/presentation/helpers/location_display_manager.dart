// import 'package:arcgis_maps/arcgis_maps.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:smart_route_app/core/utils/app_logger.dart';
// import 'package:smart_route_app/features/map/presentation/providers/current_location_providers.dart';
// import 'package:smart_route_app/features/map/presentation/providers/location_display_providers.dart';
// import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';

// /// Helper class để quản lý LocationDisplay (GPS tracking)
// class LocationDisplayManager {
//   final ArcGISMapViewController _mapViewController;
//   final SystemLocationDataSource _locationDataSource;
//   final WidgetRef _ref;
//   final BuildContext _context;

//   bool _mapViewReady = false;

//   LocationDisplayManager({
//     required ArcGISMapViewController mapViewController,
//     required SystemLocationDataSource locationDataSource,
//     required WidgetRef ref,
//     required BuildContext context,
//   }) : _mapViewController = mapViewController,
//        _locationDataSource = locationDataSource,
//        _ref = ref,
//        _context = context;

//   /// Set map view ready state
//   void setMapViewReady(bool ready) {
//     _mapViewReady = ready;
//   }

//   /// Cấu hình location data source cho map view
//   void configureLocationDataSource() {
//     // Set the system location data source (best practice theo ArcGIS docs)
//     _mapViewController.locationDisplay.dataSource = _locationDataSource;
//   }

//   /// Cập nhật LocationDisplay cho view đang active
//   /// Best practice theo: https://developers.arcgis.com/flutter/sample-code/show-device-location/
//   Future<void> updateLocationDisplay(MapMode mode, bool enabled) async {
//     if (mode == MapMode.map2D) {
//       // Kiểm tra xem map view đã sẵn sàng chưa
//       if (!_mapViewReady) {
//         AppLogger.ui('Map view not ready yet, skipping LocationDisplay update');
//         // Tắt LocationDisplay nếu map chưa sẵn sàng
//         if (enabled) {
//           _ref.read(locationDisplayProviderProvider.notifier).disable();
//         }
//         return;
//       }

//       // LocationDisplay chỉ hỗ trợ cho 2D Map
//       final locationDisplay = _mapViewController.locationDisplay;

//       if (enabled) {
//         // Set auto-pan mode trước khi start
//         locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;

//         // Attempt to start the location data source (best practice từ sample code)
//         // Ref: https://developers.arcgis.com/flutter/sample-code/show-device-location/
//         try {
//           await _locationDataSource.start();

//           // Log current location after starting
//           final location = locationDisplay.location;
//           if (location != null) {
//             final lat = location.position.y;
//             final lon = location.position.x;
//             AppLogger.ui(
//               'LocationDisplay started - Current location: Lat: $lat, Lon: $lon',
//             );
//           } else {
//             AppLogger.ui('LocationDisplay started for 2D map');
//           }

//           // Listen to location changes and log them
//           locationDisplay.onLocationChanged.listen((location) {
//             final lat = location.position.y;
//             final lon = location.position.x;
//             AppLogger.ui('Location updated: Lat: $lat, Lon: $lon');

//             // Lưu vị trí hiện tại vào provider
//             _ref
//                 .read(currentLocationProviderProvider.notifier)
//                 .updateLocation(location);
//           });
//         } on ArcGISException catch (e) {
//           AppLogger.ui(
//             'ArcGIS Error starting LocationDisplay: ${e.message}',
//             error: e,
//           );
//           // Tắt LocationDisplay trong provider nếu có lỗi
//           _ref.read(locationDisplayProviderProvider.notifier).disable();

//           // Hiển thị thông báo cho user
//           if (_context.mounted) {
//             ScaffoldMessenger.of(_context).showSnackBar(
//               SnackBar(
//                 content: Text('Không thể bật GPS: ${e.message}'),
//                 backgroundColor: Colors.red,
//                 duration: const Duration(seconds: 3),
//               ),
//             );
//           }
//         } catch (e) {
//           AppLogger.ui('Error starting LocationDisplay: $e', error: e);
//           _ref.read(locationDisplayProviderProvider.notifier).disable();
//           if (_context.mounted) {
//             ScaffoldMessenger.of(_context).showSnackBar(
//               SnackBar(
//                 content: Text('Không thể bật GPS: $e'),
//                 backgroundColor: Colors.red,
//                 duration: const Duration(seconds: 3),
//               ),
//             );
//           }
//         }
//       } else {
//         // Stop location data source
//         _locationDataSource.stop();
//         AppLogger.ui('LocationDisplay stopped for 2D map');
//       }
//     } else {
//       // 3D Scene không hỗ trợ LocationDisplay
//       if (enabled) {
//         // Tự động tắt LocationDisplay trong provider
//         _ref.read(locationDisplayProviderProvider.notifier).disable();

//         // Thông báo cho user
//         if (_context.mounted) {
//           ScaffoldMessenger.of(_context).showSnackBar(
//             const SnackBar(
//               content: Text('GPS chỉ khả dụng ở chế độ 2D'),
//               backgroundColor: Colors.orange,
//               duration: Duration(seconds: 2),
//             ),
//           );
//         }
//         AppLogger.ui('LocationDisplay not supported in 3D scene');
//       }
//     }
//   }

//   /// Stop location data source
//   void stop() {
//     _locationDataSource.stop();
//     // Xóa vị trí hiện tại khỏi provider
//     _ref.read(currentLocationProviderProvider.notifier).clearLocation();
//   }
// }
