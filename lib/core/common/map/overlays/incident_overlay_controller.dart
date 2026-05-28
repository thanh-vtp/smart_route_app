import 'package:arcgis_maps/arcgis_maps.dart' hide Incident;
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/presentation/extensions/incident_display_extensions.dart';
import 'package:smart_route_app/core/common/map/symbols/incident_symbol_factory.dart';
import '../../../../features/incident/domain/entities/incident.dart';

class IncidentOverlayController {
  final GraphicsOverlay overlay;

  final IncidentSymbolFactory symbolFactory;

  // Cache graphic theo incident id
  final Map<String, Graphic> _graphicsById = {};

  IncidentOverlayController({
    required this.overlay,
    required this.symbolFactory,
  });

  /// Nhận data và Render lên Map
  Future<void> renderIncidents(List<Incident> incidents) async {
    final incomingIds = incidents.map((e) => e.id).toSet();

    final removedIds = _graphicsById.keys
        .where((id) => !incomingIds.contains(id))
        .toList();

    for (final id in removedIds) {
      final graphic = _graphicsById.remove(id);

      if (graphic != null) {
        overlay.graphics.remove(graphic);
      }
    }
    // Add or update graphics
    // Xử lý từng sự cố
    for (final incident in incidents) {
      await _upsertIncident(incident);
    }

    AppLogger.ui('Rendered ${_graphicsById.length} incidents on map');
  }

  Future<void> _upsertIncident(Incident incident) async {
    final existing = _graphicsById[incident.id];

    final point = ArcGISPoint(
      x: incident.longitude,
      y: incident.latitude,
      spatialReference: SpatialReference.wgs84,
    );

    // Update
    if (existing != null) {
      existing.geometry = point;
      return;
    }

    // Create
    // 2. Ký hiệu (Symbol)
    final symbol = await symbolFactory.getSymbol(incident.type);

    // 3. Đóng gói thành Graphic
    final graphic = Graphic(
      geometry: point,
      symbol: symbol,
      attributes: {'incident_id': incident.id},
    );

    // Z-Index để icon to nằm trên icon nhỏ
    graphic.zIndex = incident.typeConfig.zIndex;

    _graphicsById[incident.id] = graphic;

    overlay.graphics.add(graphic);
  }

  // Xóa toàn bộ sự cố khỏi map
  void clear() {
    _graphicsById.clear();

    overlay.graphics.clear();
  }
}
