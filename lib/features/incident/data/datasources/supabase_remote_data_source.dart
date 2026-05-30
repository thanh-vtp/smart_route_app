import 'package:smart_route_app/features/incident/data/models/incident_supabase_model.dart';

abstract class SupabaseRemoteDataSource {
  Future<IncidentSupabaseModel> createIncident(IncidentSupabaseModel incident);
  Future<IncidentSupabaseModel?> getIncidentById(String id);
  Future<IncidentSupabaseModel> updateIncident(IncidentSupabaseModel incident);
  Future<void> deleteIncident(String id, String userId);
  Future<List<IncidentSupabaseModel>> getMyIncidents(
    String userId,
  ); // danh sách sự cố do user này tạo
}
