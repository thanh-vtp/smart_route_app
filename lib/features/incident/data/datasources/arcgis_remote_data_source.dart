import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/features/map_drawing/model/incident_arcgis_model.dart';

/// ArcGIS Data Source - Quản lý GET, ADD, DELETE trên ArcGIS Feature Layer
/// Sử dụng cho hiển thị map và visualization
abstract class ArcGISRemoteDataSource {
  /// Lấy danh sách incidents từ ArcGIS Feature Layer
  Future<List<IncidentArcgisModel>> getIncidents({Geometry? visibleExtent});
}
