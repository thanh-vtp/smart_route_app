import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/features/incident/data/models/cluster_response_model.dart';
import 'package:smart_route_app/features/incident/data/models/incident_model.dart';

/// ArcGIS Data Source - Quản lý GET, ADD, DELETE trên ArcGIS Feature Layer
/// Sử dụng cho hiển thị map và visualization
abstract class ArcGISRemoteDataSource {
  /// Lấy danh sách incidents từ ArcGIS Feature Layer
  Future<List<IncidentModel>> getIncidents({Geometry? visibleExtent});

  /// Thêm incident mới vào ArcGIS Feature Layer
  /// Trả về ObjectID (String) để lưu tham chiếu
  Future<String> addIncident(IncidentModel incident);

  /// Xóa incident khỏi ArcGIS Feature Layer dựa trên ObjectID
  Future<void> deleteIncident(String objectId);

  /// Cập nhật incident khỏi ArcGIS Feature Layer dựa trên ObjectID
  Future<void> updateIncident(IncidentModel incident);

  /// Fetch and apply clustering data từ API
  Future<List<ClusterItemModel>> fetchAndApplyClusters();
}
