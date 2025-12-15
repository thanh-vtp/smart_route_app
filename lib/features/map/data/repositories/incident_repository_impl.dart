import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/exceptions.dart';
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
    } on NetworkException catch (_) {
      return left(NetworkFailure.noInternet());
    } catch (e, st) {
      AppLogger.error(
        'GET Failed',
        name: 'IncidentRepository',
        error: e,
        stackTrace: st,
      );

      return left(
        UnexpectedFailure(e, st),
      ); // return UnexpectedFailure (lỗi chưa xác định)
    }
  }

  @override
  Future<Either<Failure, void>> addIncident(Incident incident) async {
    String? arcgisObjectId;
    // Validation
    if (incident.reportedByUid == null || incident.reportedByUid!.isEmpty) {
      return left(ValidationFailure.missingUserInfo());
    }
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
    } on NetworkException catch (_) {
      return left(NetworkFailure.noInternet());
    } on PermissionFailure catch (e, st) {
      return left(
        PermissionFailure(
          code: e.code,
          technicalMessage: e.technicalMessage,
          stackTrace: st,
        ),
      );
    } on ValidationFailure catch (e, _) {
      return left(
        ValidationFailure(code: e.code, technicalMessage: e.technicalMessage),
      );
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

      return left(
        UnexpectedFailure(e, st),
      ); // return UnexpectedFailure (lỗi chưa xác định)
    }
  }

  @override
  Future<Either<Failure, void>> deleteIncident({
    required String incidentId, // Đây là ArcGIS OBJECTID
    required String userUid,
  }) async {
    try {
      // BƯỚC 1: Query incident từ Supabase bằng ArcGIS ObjectID
      final incident = await _supabaseDataSource.getIncidentByArcgisObjectId(
        incidentId,
      );

      if (incident == null) {
        return left(
          SupabaseFailure.apiError(
            'Incident not found in Supabase with ArcGIS ObjectID: $incidentId',
            'NOT_FOUND',
          ),
        );
      }

      // Check: Người đang yêu cầu xóa có phải là người tạo ra nó không?
      if (incident.reportedByUid != userUid) {
        return left(
          PermissionFailure.denied(
            code: 'DELETE_DENIED_NOT_OWNER',
            technicalMessage: 'User $userUid is not the owner of $incidentId',
          ),
        );
      }

      final arcgisObjectId = incident.arcgisObjectId;
      final supabaseId = incident.id; // UUID trong Supabase
      AppLogger.repository(
        'Found incident - UUID: $supabaseId, ObjectID: $arcgisObjectId',
      );

      // BƯỚC 2: Xóa từ Supabase trước (dùng UUID)
      AppLogger.repository('DELETE from Supabase...');
      await _supabaseDataSource.deleteIncident(
        supabaseId,
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
    } on NetworkException catch (_) {
      return left(NetworkFailure.noInternet());
    } on PermissionFailure catch (e, st) {
      return left(
        PermissionFailure(
          code: e.code,
          technicalMessage: e.technicalMessage,
          stackTrace: st,
        ),
      );
    } on ValidationFailure catch (e, _) {
      return left(
        ValidationFailure(code: e.code, technicalMessage: e.technicalMessage),
      );
    } catch (e, st) {
      AppLogger.error(
        'DELETE Failed',
        name: 'IncidentRepository',
        error: e,
        stackTrace: st,
      );

      return left(
        UnexpectedFailure(e, st),
      ); // return UnexpectedFailure (lỗi chưa xác định)
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
    } on NetworkException catch (_) {
      return left(NetworkFailure.noInternet());
    } on PermissionFailure catch (e, st) {
      return left(
        PermissionFailure(
          code: e.code,
          technicalMessage: e.technicalMessage,
          stackTrace: st,
        ),
      );
    } on ValidationFailure catch (e, _) {
      return left(
        ValidationFailure(code: e.code, technicalMessage: e.technicalMessage),
      );
    } catch (e, st) {
      AppLogger.error(
        'GET Supabase Failed',
        name: 'IncidentRepository',
        error: e,
        stackTrace: st,
      );
      return left(
        UnexpectedFailure(e, st),
      ); // return UnexpectedFailure (lỗi chưa xác định)
    }
  }

  @override
  Future<Either<Failure, void>> updateIncident(
    Incident incident, {
    required String userUid,
  }) async {
    try {
      // BƯỚC 1: Query incident từ Supabase bằng ArcGIS ObjectID
      // incident.id từ ArcGIS chính là OBJECTID
      final existingIncident = await _supabaseDataSource
          .getIncidentByArcgisObjectId(incident.id);

      if (existingIncident == null) {
        return left(
          SupabaseFailure.apiError(
            'Incident not found in Supabase with ArcGIS ObjectID: ${incident.id}',
            'NOT_FOUND',
          ),
        );
      }

      final arcgisObjectId = existingIncident.arcgisObjectId;
      // Dùng UUID từ Supabase làm id cho model
      final model = IncidentModel.fromEntity(
        incident,
        arcgisObjectId: arcgisObjectId,
      ).copyWith(id: existingIncident.id);

      // BƯỚC 2: Cập nhật ArcGIS nếu có ObjectID
      if (arcgisObjectId != null && arcgisObjectId.isNotEmpty) {
        AppLogger.repository(
          'Updating incident in ArcGIS - ObjectID: $arcgisObjectId',
        );
        await _arcGISDataSource.updateIncident(model);
        AppLogger.repository('UPDATE in ArcGIS Success');
      } else {
        AppLogger.repository('Skip UPDATE ArcGIS - no ObjectID found');
      }

      // BƯỚC 3: Cập nhật Supabase
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
    } on NetworkException catch (_) {
      return left(NetworkFailure.noInternet());
    } on PermissionFailure catch (e, st) {
      return left(
        PermissionFailure(
          code: e.code,
          technicalMessage: e.technicalMessage,
          stackTrace: st,
        ),
      );
    } on ValidationFailure catch (e, _) {
      return left(
        ValidationFailure(code: e.code, technicalMessage: e.technicalMessage),
      );
    } catch (e, st) {
      AppLogger.error(
        'UPDATE Failed',
        name: 'IncidentRepository',
        error: e,
        stackTrace: st,
      );
      return left(
        UnexpectedFailure(e, st),
      ); // return UnexpectedFailure (lỗi chưa xác định)
    }
  }
}
