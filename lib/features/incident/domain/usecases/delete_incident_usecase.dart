import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';

class DeleteIncidentUsecase {
  final IncidentRepository repository;

  DeleteIncidentUsecase(this.repository);

  // Truyền cả id sự cố và id user để check bảo mật
  Future<Either<Failure, void>> call(String incidentId, String userId) async {
    return await repository.deleteIncident(incidentId, userId);
  }
}
