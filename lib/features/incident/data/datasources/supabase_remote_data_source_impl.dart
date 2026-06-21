import 'package:smart_route_app/common/app_logger.dart';
import 'package:smart_route_app/features/incident/data/datasources/supabase_remote_data_source.dart';
import 'package:smart_route_app/features/incident/data/models/incident_supabase_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRemoteDataSourceImpl implements SupabaseRemoteDataSource {
  final SupabaseClient _supabase;
  final String _tableName = 'incidents';

  SupabaseRemoteDataSourceImpl(this._supabase);

  @override
  Future<IncidentSupabaseModel> createIncident(
    IncidentSupabaseModel incident,
  ) async {
    try {
      final data = incident.toJson();

      data.removeWhere((key, value) => value == null);

      final currentUid = _supabase.auth.currentUser?.id;
      AppLogger.data(
        '1. UID của hệ thống Auth: $currentUid',
        source: 'DEBUG RLS',
      );
      AppLogger.data('2. JSON chuẩn bị gửi đi: $data', source: 'DEBUG RLS');

      final response = await _supabase
          .from(_tableName)
          .insert(data)
          .select()
          .single();
      // AppLogger.debug("$response");
      return IncidentSupabaseModel.fromJson(response);
    } catch (e, st) {
      AppLogger.error('Create Incident Failed', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deleteIncident(String id, String userId) async {
    if (userId.isEmpty) {
      throw Exception('Không tìm thấy người dùng');
    }

    if (id.isEmpty) {
      throw Exception('Không tìm thấy sự cố');
    }

    try {
      final response = await _supabase
          .from(_tableName)
          .delete()
          .eq('id', id)
          .eq('reported_by', userId)
          .select();

      if (response.isEmpty) {
        throw Exception('Respnse rỗng: Lỗi khác');
      }
      // AppLogger.debug("$response");
    } catch (e, st) {
      AppLogger.error('Delete Incident Failed', error: e, stackTrace: st);
      // throw UnimplementedError();
      // rethrow;
      throw Exception("Lỗi khi xóa sự cố");
    }
  }

  @override
  Future<IncidentSupabaseModel?> getIncidentById(String id) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('id', id)
          .maybeSingle();

      if (response == null) return null;

      return IncidentSupabaseModel.fromJson(response);
    } catch (e, st) {
      // AppLogger.error('Get Incident Failed', error: e, stackTrace: st);
      throw UnimplementedError();
    }
  }

  @override
  Future<List<IncidentSupabaseModel>> getMyIncidents(String userId) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('reported_by', userId)
          .order('created_at', ascending: false);

      return response
          .map((json) => IncidentSupabaseModel.fromJson(json))
          .toList();
    } catch (e, st) {
      // AppLogger.error('Get My Incidents Failed', error: e, stackTrace: st);
      throw UnimplementedError();
    }
  }

  @override
  Future<IncidentSupabaseModel> updateIncident(
    IncidentSupabaseModel incident,
  ) async {
    try {
      final updateData = {
        'type': incident.type,
        'severity': incident.severity,
        'description': incident.description,
        'status': incident.status,
        'expires_at': incident.expiresAt?.toUtc().toIso8601String(),
        'lat': incident.lat,
        'lng': incident.lng,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      };

      // Loại bỏ các trường có giá trị null để tránh ghi đè dữ liệu không mong muốn
      updateData.removeWhere((key, value) => value == null);

      final response = await _supabase
          .from(_tableName)
          .update(updateData)
          .eq('id', incident.id)
          .select()
          .single();
      // AppLogger.debug("$response");
      return IncidentSupabaseModel.fromJson(response);
    } catch (e, st) {
      AppLogger.error('Update Incident Failed', error: e, stackTrace: st);
      rethrow;
    }
  }
}
