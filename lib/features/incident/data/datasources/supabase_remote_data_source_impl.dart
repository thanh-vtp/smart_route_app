import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/data/datasources/supabase_remote_data_source.dart';
import 'package:smart_route_app/features/incident/data/models/incident_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRemoteDataSourceImpl implements SupabaseRemoteDataSource {
  final SupabaseClient _supabase;
  final String _tableName = 'incidents';

  SupabaseRemoteDataSourceImpl(this._supabase);

  @override
  Future<void> saveIncident(IncidentModel incident) async {
    // Đảm bảo table tồn tại trước khi lưu
    // Validation: Kiểm tra user info trước khi lưu vào Supabase (validate required fields)
    // incident.reportedByUid == null || incident.reportedByUid!.isEmpty // code tường minh
    if (incident.reportedByUid?.isEmpty ?? true) {
      // AppLogger.error(
      //   'Cannot save incident to Supabase - missing reportedByUid',
      //   name: 'SupabaseRemoteDataSource',
      // );
      throw Exception('reportedByUid is required for Supabase storage');
    }
    try {
      AppLogger.data(
        'Saving incident to Supabase: ${incident.id} by user ${incident.reportedByUid}',
        source: 'SupabaseRemoteDataSource',
      );

      final data = {
        'id': incident.id,
        'latitude': incident.latitude,
        'longitude': incident.longitude,
        'type': incident.type,
        'severity': incident.severity,
        'description': incident.description,
        'reported_time': incident.reportedTime.toIso8601String(),
        'reported_by': incident.reportedBy,
        'reported_by_uid': incident.reportedByUid,
        'arcgis_object_id': incident.arcgisObjectId, // Lưu ArcGIS ObjectID
        'created_at': DateTime.now().toIso8601String(),
      };

      final response = await _supabase.from(_tableName).insert(data);

      AppLogger.data(
        'Supabase Add Success: $response',
        source: 'SupabaseRemoteDataSource',
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save incident to Supabase',
        name: 'SupabaseRemoteDataSource',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow; //Tầng Data Source → chỉ ném error thô
    }
  }

  @override
  Future<IncidentModel?> getIncidentById(String incidentId) async {
    try {
      AppLogger.data(
        'GET incident by ID: $incidentId',
        source: 'SupabaseRemoteDataSource',
      );

      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('id', incidentId)
          .maybeSingle();

      if (response == null) {
        AppLogger.data(
          'Incident not found: $incidentId',
          source: 'SupabaseRemoteDataSource',
        );
        return null;
      }

      final incident = IncidentModel.fromSupabaseJson(response);

      AppLogger.data(
        'GET incident Success - ObjectID: ${incident.arcgisObjectId}',
        source: 'SupabaseRemoteDataSource',
      );

      return incident;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get incident by ID from Supabase',
        name: 'SupabaseRemoteDataSource',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<IncidentModel?> getIncidentByArcgisObjectId(
    String arcgisObjectId,
  ) async {
    try {
      AppLogger.data(
        'GET incident by ArcGIS ObjectID: $arcgisObjectId',
        source: 'SupabaseRemoteDataSource',
      );

      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('arcgis_object_id', arcgisObjectId)
          .maybeSingle();

      if (response == null) {
        AppLogger.data(
          'Incident not found with ArcGIS ObjectID: $arcgisObjectId',
          source: 'SupabaseRemoteDataSource',
        );
        return null;
      }

      final incident = IncidentModel.fromSupabaseJson(response);

      AppLogger.data(
        'GET incident Success - UUID: ${incident.id}, ObjectID: ${incident.arcgisObjectId}',
        source: 'SupabaseRemoteDataSource',
      );

      return incident;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get incident by ArcGIS ObjectID from Supabase',
        name: 'SupabaseRemoteDataSource',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> deleteIncident(String incidentId, String userUid) async {
    if (userUid.isEmpty) {
      throw Exception(
        'reportedByUid is required to delete incident from Supabase',
      );
    }
    try {
      AppLogger.data(
        'Deleting incident from Supabase: $incidentId by user $userUid',
        source: 'SupabaseRemoteDataSource',
      );

      final response = await _supabase
          .from(_tableName)
          .delete()
          .eq('id', incidentId);
      AppLogger.data(
        'Supabase delete completed: $response',
        source: 'SupabaseRemoteDataSource',
      );
    } catch (e, st) {
      AppLogger.error(
        'Failed to delete incident from Supabase',
        name: 'SupabaseRemoteDataSource',
        error: e,
        stackTrace: st,
      );
      rethrow; // Tầng Data Source → chỉ ném error thô
    }
  }

  @override
  Future<List<IncidentModel>> getIncidents({String? userUid}) async {
    if (userUid!.isEmpty) {
      throw Exception(
        'reportedByUid is required to delete incident from Supabase',
      );
    }
    try {
      AppLogger.data(
        'GET from Supabase (Report View)',
        source: 'SupabaseRemoteDataSource',
      );

      // Lấy incident theo user
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('reported_by_uid', userUid);

      final incidentModels = response
          .map((json) => IncidentModel.fromSupabaseJson(json))
          .toList();

      return incidentModels;
    } catch (e, st) {
      AppLogger.error('Supabase GET Failed', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> updateIncident(IncidentModel incident, String userUid) async {
    if (userUid.isEmpty) {
      throw Exception(
        'reportedByUid is required to delete incident from Supabase',
      );
    }
    try {
      AppLogger.data(
        'Updating incident in Supabase: ${incident.id} by user $userUid',
        source: 'SupabaseRemoteDataSource',
      );

      final data = {
        'latitude': incident.latitude,
        'longitude': incident.longitude,
        'type': incident.type,
        'severity': incident.severity,
        'description': incident.description,
        // Không update reported_by, reported_time
        // Supabase có thể tự update cột updated_at nếu có trigger, hoặc gửi lên:
        'updated_at': DateTime.now().toIso8601String(),
      };

      final response = await _supabase
          .from(_tableName)
          .update(data)
          .eq('id', incident.id);
      AppLogger.data(
        'Supabase update completed: $response',
        source: 'SupabaseRemoteDataSource',
      );
    } catch (e, st) {
      AppLogger.error(
        'Failed to update incident in Supabase',
        name: 'SupabaseRemoteDataSource',
        error: e,
        stackTrace: st,
      );
      rethrow; // Tầng Data Source → chỉ ném error thô
    }
  }
}
