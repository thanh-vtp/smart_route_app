import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';

class UpdateIncidentUsecase {
  final IncidentRepository repository;

  UpdateIncidentUsecase(this.repository);

  Future<Either<Failure, Incident>> call(Incident incident) async {
    return await repository.updateIncident(incident);
  }
}
