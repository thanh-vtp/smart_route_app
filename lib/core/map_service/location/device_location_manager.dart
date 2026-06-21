// import 'dart:async';

// import 'package:arcgis_maps/arcgis_maps.dart';
// import 'package:smart_route_app/core/utils/app_logger.dart';

// /// Lấy và cập nhật vị trí thiết bị (Device Location)
// class DeviceLocationManager {
//   final SystemLocationDataSource dataSource = SystemLocationDataSource();

//   /// Đăng ký để nhận thông báo về các thay đổi trạng thái của nguồn dữ liệu vị trí.
//   StreamSubscription<LocationDataSourceStatus>? _statusSubscription;

//   /// Đăng ký để nhận thông báo về các thay đổi đối với chế độ tự động xoay.
//   StreamSubscription<LocationDisplayAutoPanMode>? _autoPanModeSubscription;

//   StreamSubscription<ArcGISLocation>? _locationSubscription;

//   /// Init location display
//   void configure(LocationDisplay display) {
//     display.dataSource = dataSource;

//     display.autoPanMode = LocationDisplayAutoPanMode.recenter;
//   }

//   /// Bật hiển thị vị trí
//   Future<void> startLocationDisplay({
//     required LocationDisplay display,
//     required Function(ArcGISLocation) onLocationChanged,
//     required Function(String error) onError,
//   }) async {
//     try {
//       if (dataSource.status == LocationDataSourceStatus.started) {
//         display.autoPanMode = LocationDisplayAutoPanMode.recenter;

//         return;
//       }

//       if (display.dataSource != dataSource) {
//         display.dataSource = dataSource;
//       }

//       // Listen location updates
//       _locationSubscription?.cancel();

//       _locationSubscription = display.onLocationChanged.listen(
//         onLocationChanged,
//       );

//       // Start datasource
//       await dataSource.start();

//       // Enable recenter
//       display.autoPanMode = LocationDisplayAutoPanMode.recenter;

//       AppLogger.ui("GPS started");
//     } on ArcGISException catch (e) {
//       onError(e.message);
//     } catch (e) {
//       onError(e.toString());
//     }
//   }

//   /// Tắt hiển thị vị trí
//   Future<void> stopLocationDisplay(LocationDisplay display) async {
//     display.autoPanMode = LocationDisplayAutoPanMode.off;
//     await dataSource.stop();
//     AppLogger.ui("GPS stopped");
//   }

//   /// Zoom & Recenter về vị trí hiện tại
//   void recenter(LocationDisplay display) {
//     if (dataSource.status != LocationDataSourceStatus.started) {
//       return;
//     }

//     display.autoPanMode = LocationDisplayAutoPanMode.recenter;
//   }

//   /// Follow state stream
//   Stream<bool> followState(LocationDisplay display) {
//     return display.onAutoPanModeChanged.map((mode) {
//       return mode != LocationDisplayAutoPanMode.off;
//     });
//   }

//   void dispose() {
//     dataSource.stop();
//     _statusSubscription?.cancel();
//     _autoPanModeSubscription?.cancel();
//     _locationSubscription?.cancel();
//   }
// }
