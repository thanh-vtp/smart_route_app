import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';

abstract class RoutingRepository {
  /// Hàm tìm đường đi giữa 2 hoặc nhiều điểm
  Future<Either<Failure, RouteResult>> calculateRoute({
    required List<RoutePoint> stops, // Dùng thẳng Entity của Domain
    bool avoidIncidents = true,
  });
}
