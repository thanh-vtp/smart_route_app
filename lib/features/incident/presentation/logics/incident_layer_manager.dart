import 'package:arcgis_maps/arcgis_maps.dart' hide Incident;
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/presentation/extensions/incident_display_extensions.dart';
import 'package:smart_route_app/features/incident/presentation/logics/incident_symbol_factory.dart';
import '../../domain/entities/incident.dart';

/// Quản lý lớp hiển thị sự cố (Kẹt xe, Tai nạn)
class IncidentLayerManager {
  // Overlay chính để hiển thị
  final GraphicsOverlay _overlay = GraphicsOverlay();
  final IncidentSymbolFactory _symbolFactory;

  IncidentLayerManager(this._symbolFactory);

  GraphicsOverlay get overlay => _overlay;

  /// Nhận data và Render lên Map
  Future<void> renderIncidents(List<Incident> incidents) async {
    if (incidents.isEmpty) {
      _overlay.graphics.clear();
      return;
    }

    final List<Graphic> newGraphics = [];

    // Xử lý từng sự cố
    for (final incident in incidents) {
      try {
        // 1. Toạ độ (Geometry)
        final point = ArcGISPoint(
          x: double.parse(incident.longitude),
          y: double.parse(incident.latitude),
          spatialReference: SpatialReference.wgs84,
        );

        // 2. Ký hiệu (Symbol)
        final symbol = await _symbolFactory.getSymbol(incident.type);

        // 3. Đóng gói thành Graphic
        final graphic = Graphic(
          geometry: point,
          symbol: symbol,
          attributes: {
            'incident_id': incident.id, // RẤT QUAN TRỌNG ĐỂ CLICK VÀO LẤY ID
          },
        );

        // Z-Index để icon to nằm trên icon nhỏ
        graphic.zIndex = incident.typeConfig.zIndex;

        newGraphics.add(graphic);
      } catch (e) {
        AppLogger.ui('Error creating graphic for ${incident.id}: $e');
      }
    }

    // 4. Update UI một lần duy nhất để không bị giật lag
    _overlay.graphics.clear();
    _overlay.graphics.addAll(newGraphics);

    AppLogger.ui('Rendered ${newGraphics.length} incidents on map');
  }

  void clear() {
    _overlay.graphics.clear();
  }
}
