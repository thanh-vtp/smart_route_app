import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import '../entities/cluster_entities.dart';
import '../repositories/cluster_repository.dart';

class FetchClusterUseCase {
  final ClusterRepository _repository;

  FetchClusterUseCase(this._repository);

  Future<Either<Failure, ClusterResult>> call() async {
    return await _repository.fetchClusters();
  }
}
