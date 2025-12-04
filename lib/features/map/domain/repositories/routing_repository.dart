import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/map/domain/entities/route_info.dart';

abstract class RoutingRepository {
  // tìm đường đi (ESRI)
  Future<Either<Failure, RouteInfo>> findRoute(
    ArcGISPoint startPoint,
    ArcGISPoint endPoint,
  );
}
