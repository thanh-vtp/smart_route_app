// import 'package:arcgis_maps/arcgis_maps.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:smart_route_app/core/utils/app_logger.dart';
// import 'package:smart_route_app/features/map/domain/entities/incident.dart'
//     as domain;
// import 'package:smart_route_app/features/map/presentation/helpers/incident_highlighter.dart';
// import 'package:smart_route_app/features/map/presentation/helpers/location_marker_helper.dart';
// import 'package:smart_route_app/features/map/presentation/helpers/map_camera_controller.dart';
// import 'package:smart_route_app/features/map/presentation/providers/states/map_page_notifier.dart';
// import 'package:smart_route_app/features/map/presentation/widgets/add_incident_bottom_sheet.dart';
// import 'package:smart_route_app/features/map/presentation/widgets/incident_detail_bottom_sheet.dart';
// import 'package:smart_route_app/features/map/presentation/widgets/location_info_bottom_sheet.dart';
// import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';

// /// Helper class để xử lý các sự kiện tap/longPress trên map
// class MapInteractionHandler {
//   final ArcGISMapViewController _mapViewController;
//   final ArcGISSceneViewController _sceneViewController;
//   final GraphicsOverlay _graphicsOverlay;
//   final WidgetRef _ref;
//   final BuildContext _context;
//   final IncidentHighlighter _highlighter;
//   final MapCameraController _cameraController;
//   final LocationMarkerHelper _locationMarkerHelper;

//   MapInteractionHandler({
//     required ArcGISMapViewController mapViewController,
//     required ArcGISSceneViewController sceneViewController,
//     required GraphicsOverlay graphicsOverlay,
//     required WidgetRef ref,
//     required BuildContext context,
//     required IncidentHighlighter highlighter,
//     required MapCameraController cameraController,
//     required LocationMarkerHelper locationMarkerHelper,
//   }) : _mapViewController = mapViewController,
//        _sceneViewController = sceneViewController,
//        _graphicsOverlay = graphicsOverlay,
//        _ref = ref,
//        _context = context,
//        _highlighter = highlighter,
//        _cameraController = cameraController,
//        _locationMarkerHelper = locationMarkerHelper;

//   /// Xử lý sự kiện tap trên bản đồ 2D
//   Future<void> handleMapTap(Offset screenPoint) async {
//     try {
//       // Thực hiện identify operation để tìm graphic tại vị trí tap
//       final identifyResult = await _mapViewController.identifyGraphicsOverlay(
//         _graphicsOverlay,
//         screenPoint: screenPoint,
//         tolerance: 12,
//       );

//       // Nếu có graphic được identify, lấy incident từ state và hiển thị
//       if (identifyResult.graphics.isNotEmpty && _context.mounted) {
//         final identifiedGraphic = identifyResult.graphics.first;
//         final incidentId =
//             identifiedGraphic.attributes['incident_id'] as String?;

//         if (incidentId != null) {
//           // Lấy incident details từ state
//           final mapState = _ref.read(mapPageNotifierProvider);
//           mapState.whenOrNull(
//             loaded: (incidents) {
//               final incident = incidents.firstWhere(
//                 (inc) => inc.id == incidentId,
//                 orElse: () => incidents.first,
//               );

//               // Zoom to incident và highlight
//               _cameraController.zoomToIncident(identifiedGraphic);
//               _highlighter.highlight(identifiedGraphic);

//               // Hiển thị bottom sheet
//               _showIncidentBottomSheet(incident);
//             },
//           );
//         }
//       } else if (_context.mounted) {
//         // Tap vào chỗ trống - clear highlight
//         _highlighter.clear();
//         return;
//       }
//     } catch (e) {
//       AppLogger.ui('Error identifying graphic: $e', error: e);
//     }
//   }

//   /// Xử lý sự kiện long press end trên bản đồ 2D
//   Future<void> handleMapLongPress(Offset screenPoint) async {
//     try {
//       if (_context.mounted) {
//         // Lấy thông tin vị trí tap
//         final mapPoint = _mapViewController.screenToLocation(
//           screen: screenPoint,
//         );

//         if (mapPoint != null) {
//           // Chuyển tọa độ sang WGS84
//           final wgs84Point =
//               GeometryEngine.project(
//                     mapPoint,
//                     outputSpatialReference: SpatialReference.wgs84,
//                   )
//                   as ArcGISPoint?;

//           if (wgs84Point != null) {
//             // Vẽ marker tại vị trí gốc (mapPoint) để hiển thị đúng trên map
//             await _locationMarkerHelper.addMarker(mapPoint);

//             // Nhưng hiển thị thông tin tọa độ thì dùng điểm WGS84 (wgs84Point)
//             _showLocationInfo(wgs84Point.y, wgs84Point.x);
//           }
//         }
//       }
//     } catch (e) {
//       AppLogger.ui('Error identifying graphic: $e', error: e);
//     }
//   }

//   /// Xử lý sự kiện tap trên scene 3D
//   Future<void> handleSceneTap(Offset screenPoint) async {
//     try {
//       // Thực hiện identify operation để tìm graphic tại vị trí tap trong 3D scene
//       final identifyResult = await _sceneViewController.identifyGraphicsOverlay(
//         _graphicsOverlay,
//         screenPoint: screenPoint,
//         tolerance: 12,
//       );

//       // Nếu có graphic được identify, lấy incident từ state và hiển thị
//       if (identifyResult.graphics.isNotEmpty && _context.mounted) {
//         final identifiedGraphic = identifyResult.graphics.first;
//         final incidentId =
//             identifiedGraphic.attributes['incident_id'] as String?;

//         if (incidentId != null) {
//           // Lấy incident details từ state
//           final mapState = _ref.read(mapPageNotifierProvider);
//           mapState.whenOrNull(
//             loaded: (incidents) {
//               final incident = incidents.firstWhere(
//                 (inc) => inc.id == incidentId,
//                 orElse: () => incidents.first,
//               );
//               _showIncidentBottomSheet(incident);
//             },
//           );
//         }
//       } else if (_context.mounted) {
//         // Không có graphic, lấy thông tin vị trí tap
//         final scenePoint = _sceneViewController.screenToBaseSurface(
//           screen: screenPoint,
//         );

//         if (scenePoint != null) {
//           // Chuyển tọa độ sang WGS84
//           final wgs84Point =
//               GeometryEngine.project(
//                     scenePoint,
//                     outputSpatialReference: SpatialReference.wgs84,
//                   )
//                   as ArcGISPoint?;
//           if (wgs84Point != null) {
//             await _locationMarkerHelper.addMarker(scenePoint);
//             _showLocationInfo(wgs84Point.y, wgs84Point.x);
//           }
//         }
//       }
//     } catch (e) {
//       AppLogger.ui('Error identifying graphic in 3D scene: $e', error: e);
//     }
//   }

//   /// Hiển thị modal bottom sheet với chi tiết sự cố
//   void _showIncidentBottomSheet(domain.Incident incident) {
//     showModalBottomSheet(
//       context: _context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => IncidentDetailBottomSheet(incident: incident),
//     ).then((_) {
//       // Clear highlight khi đóng bottom sheet
//       _highlighter.clear();
//     });
//   }

//   /// Hiển thị thông tin vị trí khi tap vào map (không phải incident)
//   void _showLocationInfo(double latitude, double longitude) {
//     final mapMode = _ref.read(mapModeProviderProvider);

//     showModalBottomSheet(
//       context: _context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => LocationInfoBottomSheet(
//         initialLatitude: latitude,
//         initialLongitude: longitude,
//         mapViewController: mapMode == MapMode.map2D ? _mapViewController : null,
//         sceneViewController: mapMode == MapMode.scene3D
//             ? _sceneViewController
//             : null,
//         title: 'Thông tin vị trí',
//         description: 'Tọa độ của điểm bạn chạm vào',
//         onReport: () {
//           // Hiển thị form báo cáo với tọa độ cố định tại vị trí marker
//           showModalBottomSheet(
//             context: _context,
//             isScrollControlled: true,
//             backgroundColor: Colors.transparent,
//             builder: (context) => AddIncidentBottomSheet(
//               latitude: latitude,
//               longitude: longitude,
//             ),
//           );
//         },
//       ),
//     ).then((_) {
//       // Xóa marker khi đóng bottom sheet
//       _locationMarkerHelper.removeMarker();
//     });
//   }
// }
