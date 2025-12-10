// import 'dart:async';
// import 'package:arcgis_maps/arcgis_maps.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:smart_route_app/core/utils/app_logger.dart';
// import 'package:smart_route_app/features/map/presentation/helpers/map_initializer.dart';
// import 'package:smart_route_app/features/map/presentation/providers/base_map_style_providers.dart';

// class LocationPickerMapWidget extends HookConsumerWidget {
//   const LocationPickerMapWidget({
//     super.key,
//     required this.initialLatitude,
//     required this.initialLongitude,
//   });

//   final double initialLatitude;
//   final double initialLongitude;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 1. Controller cho MapView
//     final mapViewController = useMemoized(
//       () => ArcGISMapView.createController(),
//     );

//     // 2. Data Source cho GPS (Tạo riêng cho màn hình này)
//     final locationDataSource = useMemoized(() => SystemLocationDataSource());

//     // 3. States
//     // Tọa độ tâm bản đồ (WGS84) để hiển thị và trả về
//     final centerLatitude = useState<double>(initialLatitude);
//     final centerLongitude = useState<double>(initialLongitude);

//     // Trạng thái đang kéo map (để làm hiệu ứng UI)
//     final isMoving = useState(false);

//     // Trạng thái GPS đang bật hay tắt
//     final isLocationStarted = useState(false);

//     // 4. Lifecycle: Init Map & Dispose
//     useEffect(() {
//       final baseMapStyle = ref.read(baseMapStyleProviderProvider);
//       mapViewController.arcGISMap = MapInitializer.initializeMap(baseMapStyle);

//       // Cleanup: Tắt GPS khi thoát màn hình để tiết kiệm pin
//       return () {
//         locationDataSource.stop();
//       };
//     }, []);

//     // 5. Hàm xử lý nút "My Location"
//     Future<void> toggleLocation() async {
//       try {
//         final locationDisplay = mapViewController.locationDisplay;

//         // Nếu chưa bật -> Bật lên
//         if (!isLocationStarted.value) {
//           locationDisplay.dataSource = locationDataSource;
//           locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;

//           await locationDataSource.start();
//           isLocationStarted.value = true;

//           // Zoom ngay về vị trí hiện tại
//           if (locationDisplay.location != null) {
//             await mapViewController.setViewpointCenter(
//               locationDisplay.location!.position,
//               scale: 5000,
//             );
//           }
//         }
//         // Nếu đã bật -> Bấm vào để Recenter (Quay về vị trí mình)
//         else {
//           locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;
//           final location = locationDisplay.location;
//           if (location != null) {
//             await mapViewController.setViewpointCenter(
//               location.position,
//               scale: 5000,
//             );
//           }
//         }
//       } catch (e) {
//         AppLogger.ui("Lỗi bật định vị picker: $e");
//         // Có thể show SnackBar báo lỗi quyền truy cập ở đây
//       }
//     }

//     // 6. Callback khi Map đã sẵn sàng
//     void onMapViewReady() async {
//       // Di chuyển camera đến vị trí ban đầu (Incident cũ hoặc Default)
//       final initialPoint = ArcGISPoint(
//         x: initialLongitude,
//         y: initialLatitude,
//         spatialReference: SpatialReference.wgs84,
//       );
//       await mapViewController.setViewpointCenter(initialPoint, scale: 5000);

//       // -- LOGIC DETECT DỪNG MAP (DEBOUNCE) --
//       Timer? debounceTimer;

//       // Lắng nghe sự thay đổi của camera
//       mapViewController.onViewpointChanged.listen((_) {
//         // Ngay khi map nhúc nhích, set isMoving = true
//         if (!isMoving.value) isMoving.value = true;

//         // Hủy timer cũ
//         debounceTimer?.cancel();

//         // Cập nhật tọa độ hiển thị (Real-time update)
//         try {
//           final visibleArea = mapViewController.visibleArea;
//           if (visibleArea != null) {
//             final center = visibleArea.extent.center;

//             // Project từ WebMercator sang WGS84
//             final wgs84Point =
//                 GeometryEngine.project(
//                       center,
//                       outputSpatialReference: SpatialReference.wgs84,
//                     )
//                     as ArcGISPoint?;

//             if (wgs84Point != null) {
//               centerLatitude.value = wgs84Point.y;
//               centerLongitude.value = wgs84Point.x;
//             }
//           }
//         } catch (_) {}

//         // Set timer mới: Nếu 150ms không di chuyển nữa -> Coi như dừng
//         debounceTimer = Timer(const Duration(milliseconds: 150), () {
//           isMoving.value = false;
//         });
//       });
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chọn vị trí'),
//         elevation: 0,
//         actions: [
//           TextButton(
//             onPressed: () {
//               // Trả về kết quả cho màn hình trước
//               Navigator.pop(context, {
//                 'latitude': centerLatitude.value,
//                 'longitude': centerLongitude.value,
//               });
//             },
//             child: const Text(
//               'LƯU',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           // A. MAP VIEW
//           ArcGISMapView(
//             controllerProvider: () => mapViewController,
//             onMapViewReady: onMapViewReady,
//           ),

//           // B. CENTER PIN (Marker tĩnh)
//           Center(
//             child: Padding(
//               // Offset padding bottom để mũi nhọn của Pin chạm đúng tâm màn hình
//               padding: const EdgeInsets.only(bottom: 40),
//               child: AnimatedTranslation(
//                 // Hiệu ứng: Khi đang kéo map (isMoving), Pin nảy lên 1 chút (-10px)
//                 offset: isMoving.value ? const Offset(0, -10) : Offset.zero,
//                 child: const Icon(
//                   Icons.location_on,
//                   size: 50,
//                   color: Colors.red,
//                   shadows: [
//                     Shadow(
//                       color: Colors.black26,
//                       blurRadius: 10,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Bóng đổ dưới chân Pin (Cho đẹp)
//           Center(
//             child: Container(
//               margin: const EdgeInsets.only(top: 5),
//               width: 6,
//               height: 6,
//               decoration: BoxDecoration(
//                 color: Colors.black.withValues(alpha: 0.2),
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),

//           // C. NÚT MY LOCATION
//           Positioned(
//             right: 16,
//             bottom: 250, // Nằm trên Info Card
//             child: FloatingActionButton(
//               heroTag: 'picker_gps_btn',
//               backgroundColor: Colors.white,
//               onPressed: toggleLocation,
//               child: Icon(
//                 isLocationStarted.value
//                     ? Icons.my_location
//                     : Icons.location_searching,
//                 color: isLocationStarted.value ? Colors.blue : Colors.grey[700],
//               ),
//             ),
//           ),

//           // D. INFO CARD (Hiển thị tọa độ)
//           Positioned(
//             left: 16,
//             right: 16,
//             bottom: 30,
//             child: Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.info_outline,
//                           color: Colors.blue,
//                           size: 20,
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             isMoving.value ? "Đang chọn..." : "Vị trí đã chọn",
//                             style: TextStyle(
//                               color: isMoving.value
//                                   ? Colors.blue
//                                   : Colors.black87,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Divider(height: 24),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _CoordinateItem(
//                           label: "Latitude",
//                           value: centerLatitude.value.toStringAsFixed(6),
//                         ),
//                         _CoordinateItem(
//                           label: "Longitude",
//                           value: centerLongitude.value.toStringAsFixed(6),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context, {
//                             'latitude': centerLatitude.value,
//                             'longitude': centerLongitude.value,
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text("Xác nhận vị trí này"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Widget con hiển thị thông số tọa độ
// class _CoordinateItem extends StatelessWidget {
//   final String label;
//   final String value;

//   const _CoordinateItem({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//         const SizedBox(height: 4),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Monospace', // Font đơn cách cho số đẹp hơn
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Widget con làm hiệu ứng nảy (Bounce Animation)
// class AnimatedTranslation extends StatelessWidget {
//   final Offset offset;
//   final Widget child;

//   const AnimatedTranslation({
//     super.key,
//     required this.offset,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 150),
//       curve: Curves.easeOut,
//       transform: Matrix4.translationValues(offset.dx, offset.dy, 0),
//       child: child,
//     );
//   }
// }
