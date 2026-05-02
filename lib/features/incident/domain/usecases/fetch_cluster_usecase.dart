import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/entities/cluster_item.dart';
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';

class FetchClusterUseCase {
  final IncidentRepository repository;

  FetchClusterUseCase(this.repository);

  Future<Either<Failure, List<ClusterItem>>> call() async {
    final repositoryResult = await repository.fetchClusters();

    return repositoryResult.fold(
      (failure) {
        return left(failure);
      },
      (result) {
        return right(result);
      },
    );
  }
}
