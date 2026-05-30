import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';
import 'package:smart_route_app/features/navigation/domain/repositories/routing_repository.dart';

// Use case cho tính toán lộ trình giữa nhiều điểm dừng
class CalculateRouteUseCase {
  final RoutingRepository _repository;

  CalculateRouteUseCase(this._repository);

  Future<Either<Failure, RouteResult>> call({
    required List<Map<String, double>> stops,
    List<Incident>? incidentsToAvoid,
  }) async {
    if (stops.length < 2) {
      return left(ArcGISFailure.insufficientStops());
    }

    // Validate coordinates
    for (final stop in stops) {
      final lat = stop['lat'];
      final lon = stop['lng'];
      if (lat == null || lon == null) {
        return left(ArcGISFailure.invalidCoordinates());
      }
      if (lat < -90 || lat > 90 || lon < -180 || lon > 180) {
        return left(ArcGISFailure.invalidCoordinates());
      }
    }

    return await _repository.calculateRoute(
      stops: stops,
      incidentsToAvoid: incidentsToAvoid,
    );
  }
}
