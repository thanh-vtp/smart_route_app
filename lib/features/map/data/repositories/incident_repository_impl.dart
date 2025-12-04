import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/map/data/datasources/arcgis_remote_data_source.dart';

import 'package:smart_route_app/features/map/data/datasources/supabase_remote_data_source.dart';
import 'package:smart_route_app/features/map/data/models/incident_model.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';
import 'package:smart_route_app/features/map/domain/repositories/incident_repository.dart';
import 'package:uuid/uuid.dart';

/// Repository Implementation - Điều phối giữa ArcGIS và Supabase
///
/// Chiến lược:
/// - GET: Lấy từ ArcGIS (visualization)
/// - ADD: Lưu vào CẢ ArcGIS và Supabase (dual storage)
/// - DELETE: Xóa từ CẢ ArcGIS và Supabase (dual storage)
class IncidentRepositoryImpl implements IncidentRepository {
  final ArcGISRemoteDataSource _arcGISDataSource; // GET, ADD, DELETE
  final SupabaseRemoteDataSource _supabaseDataSource; // ADD, DELETE, GET

  IncidentRepositoryImpl(this._arcGISDataSource, this._supabaseDataSource);

  @override
  Future<Either<Failure, List<Incident>>> getIncidentsFormArcGis() async {
    try {
      AppLogger.repository('GET incidents from ArcGIS');

      // Lấy từ ArcGIS Feature Layer (để hiển thị map)
      final List<IncidentModel> incidentModels = await _arcGISDataSource
          .getIncidents();

      // Map Model -> Entity
      final List<Incident> incidents = incidentModels
          .map((model) => model.toEntity())
          .toList();

      AppLogger.repository('GET Success - ${incidents.length} incidents');
      return right(incidents);
    } catch (e) {
      AppLogger.error('GET Failed', name: 'IncidentRepository', error: e);
      return left(NetworkFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addIncident(Incident incident) async {
    String? arcgisObjectId;
    // Validation
    if (incident.reportedByUid == null || incident.reportedByUid!.isEmpty) {
      AppLogger.error(
        'ADD Failed - missing reportedByUid',
        name: 'IncidentRepository',
      );
      return left(NetworkFailure.badRequest('User information required'));
    }

    AppLogger.repository(
      'ADD incident to dual storage by user: ${incident.reportedBy}',
    );
    try {
      // Tạo UUID
      final newUuid = const Uuid().v4();

      // Map Entity -> Model
      var incidentModel = IncidentModel.fromEntity(
        incident,
      ).copyWith(id: newUuid);

      // Thêm vào ArcGIS trước để lấy ObjectID
      arcgisObjectId = await _arcGISDataSource.addIncident(incidentModel);
      AppLogger.repository('ADD to ArcGIS Success');
      // Cập nhật ObjectID vào model và thêm vào Supabase
      incidentModel = incidentModel.copyWith(arcgisObjectId: arcgisObjectId);
      await _supabaseDataSource.saveIncident(incidentModel);
      AppLogger.repository('ADD to Supabase Success');

      return right(null);
    } catch (e) {
      AppLogger.error('ADD Failed', name: 'IncidentRepository', error: e);

      // ROLLBACK: Nếu ArcGIS thành công nhưng Supabase lỗi, xóa khỏi ArcGIS
      if (arcgisObjectId != null) {
        AppLogger.repository(
          'Rolling back ArcGIS - deleting ObjectID: $arcgisObjectId',
        );
        try {
          await _arcGISDataSource.deleteIncident(arcgisObjectId);
          AppLogger.repository('Rollback completed');
        } catch (rollbackError) {
          AppLogger.error(
            'Rollback failed',
            name: 'IncidentRepository',
            error: rollbackError,
          );
        }
      }

      return left(NetworkFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteIncident({
    required String incidentId,
    required String userUid,
  }) async {
    try {
      AppLogger.repository('DELETE incident from dual storage: $incidentId');

      // BƯỚC 1: Query incident từ Supabase để lấy arcgisObjectId
      AppLogger.repository('Query incident from Supabase...');
      final incident = await _supabaseDataSource.getIncidentById(incidentId);

      if (incident == null) {
        AppLogger.error(
          'Incident not found in Supabase: $incidentId',
          name: 'IncidentRepository',
        );
        return left(NetworkFailure.notFound('Incident not found'));
      }

      // Check: Người đang yêu cầu xóa có phải là người tạo ra nó không?
      if (incident.reportedByUid != userUid) {
        AppLogger.warning(
          'User $userUid tried to delete incident of ${incident.reportedByUid}',
        );
        return left(
          NetworkFailure.unauthorized('Bạn không có quyền xóa báo cáo này'),
        );
      }

      final arcgisObjectId = incident.arcgisObjectId;
      AppLogger.repository('Found incident - ObjectID: $arcgisObjectId');

      // BƯỚC 2: Xóa từ Supabase trước
      AppLogger.repository('DELETE from Supabase...');
      await _supabaseDataSource.deleteIncident(
        incidentId,
        incident.reportedByUid!,
      );
      AppLogger.repository('DELETE from Supabase Success');

      // BƯỚC 3: Xóa từ ArcGIS nếu có ObjectID
      if (arcgisObjectId != null && arcgisObjectId.isNotEmpty) {
        AppLogger.repository('DELETE from ArcGIS - ObjectID: $arcgisObjectId');
        await _arcGISDataSource.deleteIncident(arcgisObjectId);
        AppLogger.repository('DELETE from ArcGIS Success');
      } else {
        AppLogger.repository('Skip DELETE from ArcGIS - no ObjectID found');
      }

      AppLogger.repository('DELETE from dual storage completed');
      return right(null);
    } catch (e) {
      AppLogger.error('DELETE Failed', name: 'IncidentRepository', error: e);
      return left(NetworkFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Incident>>> getIncidentsFromSupabase({
    String? userUid,
  }) async {
    try {
      final models = await _supabaseDataSource.getIncidents(userUid: userUid);
      return right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return left(NetworkFailure.serverError(e.toString()));
    }
  }
}
