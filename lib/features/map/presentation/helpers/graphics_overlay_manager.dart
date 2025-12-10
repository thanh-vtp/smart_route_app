// import 'package:arcgis_maps/arcgis_maps.dart';
// import 'package:smart_route_app/core/utils/app_logger.dart';
// import 'package:smart_route_app/features/map/data/models/incident_model.dart';
// import 'package:smart_route_app/features/map/domain/entities/incident.dart'
//     as domain;
// import 'package:smart_route_app/features/map/presentation/models/incident_symbol_factory.dart';
// import 'package:smart_route_app/features/map/presentation/models/incident_type_config.dart';

// /// Helper class để quản lý Graphics Overlay (vẽ incidents lên map)
// class GraphicsOverlayManager {
//   final GraphicsOverlay _overlay;
//   final IncidentSymbolFactory _symbolFactory = IncidentSymbolFactory();

//   GraphicsOverlayManager(this._overlay);

//   /// Update GraphicsOverlay với danh sách incidents mới
//   Future<void> updateIncidents(List<domain.Incident> incidents) async {
//     // Tạo danh sách graphics tạm thời để add một lần (tốt hơn add từng cái)
//     final List<Graphic> newGraphics = [];

//     // Convert từ Incident entities sang Graphics và thêm vào overlay
//     for (final incident in incidents) {
//       try {
//         final incidentModel = IncidentModel.fromEntity(incident);
//         final graphic = incidentModel.toGraphic();

//         // Lấy config type để tạo symbol
//         final config = IncidentTypes.getByDisplayName(incident.type);

//         // Tạo và gán symbol tương ứng
//         graphic.symbol = await _symbolFactory.getSymbol(config.id);

//         // Gán zIndex từ config để kiểm soát thứ tự hiển thị
//         // zIndex cao hơn sẽ hiển thị trên cùng
//         graphic.zIndex = config.zIndex;

//         // Lưu thông tin incident vào attributes để dùng khi tap
//         graphic.attributes['incident_id'] = incident.id;

//         newGraphics.add(graphic);
//       } catch (e) {
//         AppLogger.ui(
//           'Error creating graphic for incident ${incident.id}: $e',
//           error: e,
//         );
//       }
//     }

//     // Update overlay
//     _overlay.graphics.clear();
//     _overlay.graphics.addAll(newGraphics);

//     AppLogger.ui(
//       'Updated graphics overlay with ${_overlay.graphics.length} incidents',
//     );
//   }

//   /// Clear tất cả graphics
//   void clear() {
//     _overlay.graphics.clear();
//   }

//   /// Lấy số lượng graphics hiện tại
//   int get graphicsCount => _overlay.graphics.length;
// }
