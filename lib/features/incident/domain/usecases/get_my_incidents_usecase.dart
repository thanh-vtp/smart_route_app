import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';

class GetMyIncidentsUsecase {
  final IncidentRepository repository;

  GetMyIncidentsUsecase(this.repository);

  Future<Either<Failure, List<Incident>>> call(String userId) async {
    return await repository.getMyIncidents(userId);
  }
}
