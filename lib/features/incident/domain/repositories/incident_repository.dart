import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/entities/cluster_item.dart';

/// Domain Repository Interface
abstract class IncidentRepository {
  /// Fetch and apply clustering data từ API
  Future<Either<Failure, List<ClusterItem>>> fetchClusters();

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
    required String userUid,
  });

  /// Cập nhật incident
  Future<Either<Failure, void>> updateIncident(
    Incident incident, {
    required String userUid,
  });

  // ============ Cache Management ============

  /// Lấy số lượng incidents trong cache
  Future<int> getCachedIncidentCount();

  /// Xóa tất cả cache incidents
  Future<void> clearIncidentCache();
}
