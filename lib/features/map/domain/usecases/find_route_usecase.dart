import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/map/domain/entities/route_info.dart';
import 'package:smart_route_app/features/map/domain/repositories/routing_repository.dart';

class FindRouteUsecase {
  final RoutingRepository repository;

  FindRouteUsecase(this.repository);

  Future<Either<Failure, RouteInfo>> call(
    ArcGISPoint startPoint,
    ArcGISPoint endPoint,
  ) async {
    final repositoryResult = await repository.findRoute(startPoint, endPoint);
    return repositoryResult.fold(
      (failure) => left(failure),
      (routeInfo) => right(routeInfo),
    );
  }
}
