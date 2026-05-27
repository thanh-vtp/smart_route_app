import 'package:arcgis_maps/arcgis_maps.dart' hide Incident;
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/presentation/extensions/incident_display_extensions.dart';
import 'package:smart_route_app/core/common/incident_symbol_factory.dart';
import '../../features/incident/domain/entities/incident.dart';

/// Quản lý lớp hiển thị sự cố (Kẹt xe, Tai nạn)
class IncidentLayerManager {
  // Overlay chính để hiển thị
  final GraphicsOverlay _overlay = GraphicsOverlay();
  final IncidentSymbolFactory _symbolFactory;

  // Cache graphic theo incident id
  final Map<String, Graphic> _graphicsById = {};

  IncidentLayerManager(this._symbolFactory);

  GraphicsOverlay get overlay => _overlay;

  /// Nhận data và Render lên Map
  Future<void> renderIncidents(List<Incident> incidents) async {
    final incomingIds = incidents.map((e) => e.id).toSet();

    // Remove deleted graphics
    final removedIds = _graphicsById.keys
        .where((id) => !incomingIds.contains(id))
        .toList();

    for (final id in removedIds) {
      final graphic = _graphicsById.remove(id);

      if (graphic != null) {
        _overlay.graphics.remove(graphic);
      }
    }

    // Add or update graphics
    // Xử lý từng sự cố
    for (final incident in incidents) {
      await _upsertIncident(incident);
    }

    if (incidents.isEmpty) {
      _overlay.graphics.clear();
      return;
    }

    AppLogger.ui('Rendered ${_graphicsById.length} incidents on map');
  }

  Future<void> _upsertIncident(Incident incident) async {
    final existing = _graphicsById[incident.id];

    // 1. Toạ độ (Geometry)
    final point = ArcGISPoint(
      x: double.parse(incident.longitude),
      y: double.parse(incident.latitude),
      spatialReference: SpatialReference.wgs84,
    );

    // Update
    if (existing != null) {
      existing.geometry = point;
      return;
    }

    // Create
    // 2. Ký hiệu (Symbol)
    final symbol = await _symbolFactory.getSymbol(incident.type);

    // 3. Đóng gói thành Graphic
    final graphic = Graphic(
      geometry: point,
      symbol: symbol,
      attributes: {
        GraphicAttributes.incidentId:
            incident.id, // RẤT QUAN TRỌNG ĐỂ CLICK VÀO LẤY ID
      },
    );

    // Z-Index để icon to nằm trên icon nhỏ
    graphic.zIndex = incident.typeConfig.zIndex;

    _graphicsById[incident.id] = graphic;

    _overlay.graphics.add(graphic);
  }

  // Xóa toàn bộ sự cố khỏi map
  void clear() {
    _graphicsById.clear();
    _overlay.graphics.clear();
  }

  void dispose() {
    clear();
  }
}
