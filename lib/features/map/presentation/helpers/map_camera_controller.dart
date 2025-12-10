// import 'package:arcgis_maps/arcgis_maps.dart';
// import 'package:smart_route_app/core/utils/app_logger.dart';

// /// Helper class để điều khiển camera và zoom của map
// class MapCameraController {
//   final ArcGISMapViewController _mapViewController;

//   MapCameraController(this._mapViewController);

//   /// Zoom map đến vị trí incident với offset tránh bottom sheet
//   Future<void> zoomToIncident(Graphic graphic) async {
//     try {
//       final geometry = graphic.geometry;
//       if (geometry is ArcGISPoint) {
//         // --- LOGIC TÍNH TOÁN OFFSET ---
//         // Tại scale 5000, 1 độ vĩ độ ~ 111km.
//         // Chúng ta cần dịch chuyển tâm bản đồ xuống dưới khoảng 300-400 mét
//         // để marker nhảy lên trên khoảng 1/4 màn hình (tránh Bottom Sheet).

//         // 0.003 độ ~ 330 mét
//         // Ước lượng hoạt động tốt cho mức scale: 5000
//         const double latitudeOffset = 0.0015; // Giảm số để đẩy marker xuống

//         // Tạo điểm tâm mới nằm thấp hơn vị trí thật của incident
//         // (Giữ nguyên kinh độ x, giảm vĩ độ y)
//         final offsetPoint = ArcGISPoint(
//           x: geometry.x,
//           y: geometry.y - latitudeOffset,
//           spatialReference: geometry.spatialReference,
//         );

//         // Tạo viewpoint với tâm đã dịch chuyển
//         final viewpoint = Viewpoint.fromCenter(
//           offsetPoint, // Dùng điểm tâm ảo
//           scale: 8000, // Zoom level mong muốn
//         );

//         // Animate mượt mà
//         await _mapViewController.setViewpointAnimated(
//           viewpoint,
//           duration: 0.8, // 0.8 giây là chuẩn Google Maps
//           // curve: AnimationCurve.easeInOut, // Hiệu ứng tăng giảm tốc
//         );

//         AppLogger.ui(
//           'Zoomed & Offset to incident: ${geometry.y}, ${geometry.x}',
//         );
//       }
//     } catch (e) {
//       AppLogger.ui('Error zooming to incident: $e', error: e);
//     }
//   }

//   /// Zoom đến một điểm bất kỳ
//   Future<void> zoomToPoint(ArcGISPoint point, {double scale = 5000}) async {
//     try {
//       final viewpoint = Viewpoint.fromCenter(point, scale: scale);
//       await _mapViewController.setViewpointAnimated(viewpoint, duration: 0.8);
//       AppLogger.ui('Zoomed to point: ${point.y}, ${point.x}');
//     } catch (e) {
//       AppLogger.ui('Error zooming to point: $e', error: e);
//     }
//   }
// }
