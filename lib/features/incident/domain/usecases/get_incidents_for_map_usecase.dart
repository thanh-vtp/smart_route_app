import 'package:arcgis_maps/arcgis_maps.dart' as arcgis;
import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';

class GetIncidentsForMapUsecase {
  final IncidentRepository repository;

  GetIncidentsForMapUsecase(this.repository);

  // visibleExtent dùng để tối ưu: chỉ lấy các điểm trong màn hình đang hiển thị
  Future<Either<Failure, List<Incident>>> call({
    arcgis.Geometry? visibleExtent,
  }) async {
    return await repository.getIncidentsForMap(visibleExtent: visibleExtent);
  }
}
