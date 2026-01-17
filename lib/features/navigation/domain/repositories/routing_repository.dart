import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';
import '../../../../core/errors/failures.dart';
// import '../entities/geocoding_entities.dart';

abstract class RoutingRepository {
  /// Tính toán đường đi giữa các điểm
  Future<Either<Failure, RouteResult>> calculateRoute({
    required List<Map<String, double>> stops,
    List<Incident>? incidentsToAvoid,
  });

  /// Xóa tất cả cache (geocoding, route, nearby, imagery)
  Future<void> clearAllCache();

  /// Lấy thống kê cache (route, nearby)
  Future<Map<String, int>> getCacheStats();
}
