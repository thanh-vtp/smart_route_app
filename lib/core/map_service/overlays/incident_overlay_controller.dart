import 'package:arcgis_maps/arcgis_maps.dart' hide Incident;
import 'package:smart_route_app/core/map_service/incident_type_config.dart';
import 'package:smart_route_app/common/app_logger.dart';
import 'package:smart_route_app/core/map_service/symbols/incident_symbol_factory.dart';
import '../../../features/incident/domain/entities/incident.dart';

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
      try {
        await _upsertIncident(incident);
      } catch (e, st) {
        AppLogger.error(
          '[LỖI] Failed to render incident ${incident.id}',
          error: e,
          stackTrace: st,
        );
      }
    }

    AppLogger.ui('Rendered ${_graphicsById.length} incidents on map');
  }

  Future<void> _upsertIncident(Incident incident) async {
    // AppLogger.debug(
    //   '[DEBUG] Render incident: '
    //   'id=${incident.id}, '
    //   'type=${incident.type}, '
    //   'lat=${incident.lat}, '
    //   'lng=${incident.lng}',
    // );

    final existing = _graphicsById[incident.id];

    final point = ArcGISPoint(
      x: incident.lng,
      y: incident.lat,
      spatialReference: SpatialReference.wgs84,
    );

    // Update
    if (existing != null) {
      existing.geometry = point;
      return;
    }

    // Create
    // 2. Ký hiệu (Symbol)
    // AppLogger.debug('Step 1');

    final symbol = await symbolFactory.getSymbol(incident.type);

    // AppLogger.debug('Symbol loaded');
    // AppLogger.debug('Step 2');

    // 3. Đóng gói thành Graphic
    final graphic = Graphic(
      geometry: point,
      symbol: symbol,
      attributes: {'incident_id': incident.id},
    );

    // AppLogger.debug('Step 3');

    // Z-Index để icon to nằm trên icon nhỏ
    graphic.zIndex = IncidentTypes.getById(incident.type).zIndex;

    // AppLogger.debug('Step 4');

    _graphicsById[incident.id] = graphic;

    overlay.graphics.add(graphic);

    // AppLogger.debug('Step 5');
  }

  Graphic? getGraphicByIncidentId(String incidentId) {
    return _graphicsById[incidentId];
  }

  // Xóa toàn bộ sự cố khỏi map
  void clear() {
    _graphicsById.clear();

    overlay.graphics.clear();
  }
}
