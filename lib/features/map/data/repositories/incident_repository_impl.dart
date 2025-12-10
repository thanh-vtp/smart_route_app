import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failure_handler.dart';
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
    } catch (e, st) {
      AppLogger.error(
        'GET Failed',
        name: 'IncidentRepository',
        error: e,
        stackTrace: st,
      );
      return left(e.toFailure(st));
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
      return left(
        ValidationFailure(
          code: 'MISSING_USER_INFO',
          technicalMessage: 'Incident.reportedByUid is null or empty',
        ),
      );
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
      AppLogger.repository('ADD to ArcGIS Success (ObjectID: $arcgisObjectId)');
      // Cập nhật ObjectID vào model và thêm vào Supabase
      incidentModel = incidentModel.copyWith(arcgisObjectId: arcgisObjectId);
      await _supabaseDataSource.saveIncident(incidentModel);
      AppLogger.repository('ADD to Supabase Success');

      return right(null);
    } catch (e, st) {
      // Error Handling & Rollback
      AppLogger.error(
        'ADD Failed',
        name: 'IncidentRepository',
        error: e,
        stackTrace: st,
      );

      // ROLLBACK: Nếu ArcGIS thành công nhưng Supabase lỗi, xóa khỏi ArcGIS
      if (arcgisObjectId != null) {
        AppLogger.repository(
          'Rolling back ArcGIS - deleting ObjectID: $arcgisObjectId',
        );
        try {
          await _arcGISDataSource.deleteIncident(arcgisObjectId);
          AppLogger.repository('Rollback completed successfully');
        } catch (rollbackError) {
          AppLogger.error(
            'Rollback failed (Critical Data Inconsistency)',
            name: 'IncidentRepository',
            error: rollbackError,
          );
        }
      }

      // Sử dụng extension đã viết ở để quy hoạch lỗi
      return left(e.toFailure(st));
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
        return left(NetworkFailure.notFound('IncidentId: $incidentId'));
      }

      // Check: Người đang yêu cầu xóa có phải là người tạo ra nó không?
      if (incident.reportedByUid != userUid) {
        AppLogger.warning(
          'User $userUid tried to delete incident of ${incident.reportedByUid}',
        );
        return left(
          PermissionFailure.denied(
            code: 'DELETE_DENIED_NOT_OWNER',
            technicalMessage: 'User $userUid is not the owner of $incidentId',
          ),
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

      // AppLogger.repository('DELETE from dual storage completed');
      return right(null);
    } catch (e, st) {
      AppLogger.error(
        'DELETE Failed',
        name: 'IncidentRepository',
        error: e,
        stackTrace: st,
      );
      return left(e.toFailure(st));
    }
  }

  @override
  Future<Either<Failure, List<Incident>>> getIncidentsFromSupabase({
    String? userUid,
  }) async {
    try {
      AppLogger.repository('GET incidents from Supabase (User: $userUid)');
      final models = await _supabaseDataSource.getIncidents(userUid: userUid);
      final incidents = models.map((m) => m.toEntity()).toList();
      AppLogger.repository('GET Success - ${incidents.length} incidents');
      return right(incidents);
    } catch (e, st) {
      AppLogger.error(
        'GET Supabase Failed',
        name: 'IncidentRepository',
        error: e,
        stackTrace: st,
      );
      return left(e.toFailure(st));
    }
  }

  @override
  Future<Either<Failure, void>> updateIncident(
    Incident incident, {
    required String userUid,
  }) async {
    try {
      AppLogger.repository('UPDATE incident in dual storage: ${incident.id}');

      // BƯỚC 1: Query incident từ Supabase để lấy arcgisObjectId
      final model = IncidentModel.fromEntity(incident);

      // Cần chắc chắn model có arcgisObjectId.
      if (model.arcgisObjectId != null) {
        AppLogger.repository(
          'Updating incident in ArcGIS - ObjectID: ${model.arcgisObjectId}',
        );

        await _arcGISDataSource.updateIncident(model);

        AppLogger.repository('UPDATE in ArcGIS Success');
      } else {
        // Fallback: Nếu không có ObjectID, có thể phải query lại từ Supabase để lấy
        // (Tùy logic app của bạn có lưu ObjectID vào Entity khi get về không)
        AppLogger.repository(
          'No ArcGIS ObjectID in incident model, querying Supabase for it...',
        );
      }

      // BƯỚC 2: Cập nhật Supabase

      // Check: Người đang yêu cầu cập nhật có phải là người tạo ra nó không?
      if (incident.reportedByUid != userUid) {
        AppLogger.warning(
          'User $userUid tried to update incident of ${incident.reportedByUid}',
        );
        return left(
          PermissionFailure.denied(
            code: 'UPDATE_DENIED_NOT_OWNER',
            technicalMessage:
                'User $userUid is not the owner of ${incident.id}',
          ),
        );
      }

      AppLogger.repository('UPDATE in Supabase - Incident ID: ${incident.id}');

      await _supabaseDataSource.updateIncident(model, userUid);

      AppLogger.repository('UPDATE in Supabase Success');

      // AppLogger.repository('UPDATE from dual storage completed');
      return right(null);
    } catch (e, st) {
      AppLogger.error(
        'UPDATE Failed',
        name: 'IncidentRepository',
        error: e,
        stackTrace: st,
      );
      return left(e.toFailure(st));
    }
  }
}
