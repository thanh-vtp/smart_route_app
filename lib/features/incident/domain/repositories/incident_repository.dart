import 'package:arcgis_maps/arcgis_maps.dart' as arcgis;
import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/entities/cluster_item.dart';

/// Domain Repository Interface
abstract class IncidentRepository {
  /// Lấy danh sách incidents (từ ArcGIS)
  Future<Either<Failure, List<Incident>>> getIncidentsForMap({
    arcgis.Geometry? visibleExtent,
  });

  Future<Either<Failure, Incident>> getIncidentDetail(String id);
  Future<Either<Failure, Incident>> createIncident(Incident incident);
  Future<Either<Failure, Incident>> updateIncident(Incident incident);
  Future<Either<Failure, void>> deleteIncident(String id, String userId);

  /// Lấy lịch sử báo cáo của User
  Future<Either<Failure, List<Incident>>> getMyIncidents(String userId);

  /// Fetch and apply clustering data từ API
  Future<Either<Failure, List<ClusterItem>>> fetchClusters();

  // ============ Cache Management ============

  // /// Lấy số lượng incidents trong cache
  // Future<int> getCachedIncidentCount();

  // /// Xóa tất cả cache incidents
  // Future<void> clearIncidentCache();

  // Future<Either<Failure, List<Incident>>> getIncidentsFromSupabase({
  //   required String userUid,
  // });
}
