import 'package:smart_route_app/features/incident/data/models/incident_model.dart';

abstract class SupabaseRemoteDataSource {
  /// Lưu incident vào Supabase database
  Future<void> saveIncident(IncidentModel incident);

  /// Lấy incident theo ID (UUID trong Supabase)
  Future<IncidentModel?> getIncidentById(String incidentId);

  /// Lấy incident theo ArcGIS ObjectID
  Future<IncidentModel?> getIncidentByArcgisObjectId(String arcgisObjectId);

  /// Xóa incident khỏi Supabase database
  Future<void> deleteIncident(String incidentId, String userUid);

  /// Lấy danh sách incidents từ Supabase (user report)
  Future<List<IncidentModel>> getIncidents({String? userUid});

  /// Cập nhật incident
  Future<void> updateIncident(IncidentModel incident, String userUid);
}
