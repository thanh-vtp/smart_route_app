import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';

/// Domain Repository Interface
abstract class IncidentRepository {
  /// Lấy danh sách incidents (từ ArcGIS)
  Future<Either<Failure, List<Incident>>> getIncidentsFormArcGis();

  /// Thêm incident mới
  Future<Either<Failure, void>> addIncident(Incident incident);

  /// Xóa incident
  Future<Either<Failure, void>> deleteIncident({
    required String incidentId,
    required String userUid,
  });

  /// Lấy danh sách incidents (supabase)
  Future<Either<Failure, List<Incident>>> getIncidentsFromSupabase({
    String? userUid,
  });

  /// Cập nhật incident
  Future<Either<Failure, void>> updateIncident(
    Incident incident, {
    required String userUid,
  });
}
