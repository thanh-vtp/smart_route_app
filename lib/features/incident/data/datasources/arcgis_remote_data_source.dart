import 'package:smart_route_app/features/incident/data/models/incident_model.dart';

/// ArcGIS Data Source - Quản lý GET, ADD, DELETE trên ArcGIS Feature Layer
/// Sử dụng cho hiển thị map và visualization
abstract class ArcGISRemoteDataSource {
  /// Lấy danh sách incidents từ ArcGIS Feature Layer
  Future<List<IncidentModel>> getIncidents();

  /// Thêm incident mới vào ArcGIS Feature Layer
  /// Trả về ObjectID (String) để lưu tham chiếu
  Future<String> addIncident(IncidentModel incident);

  /// Xóa incident khỏi ArcGIS Feature Layer dựa trên ObjectID
  Future<void> deleteIncident(String objectId);

  /// Cập nhật incident khỏi ArcGIS Feature Layer dựa trên ObjectID
  Future<void> updateIncident(IncidentModel incident);
}
