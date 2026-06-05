import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import '../entities/cluster_entities.dart';

abstract class ClusterRepository {
  Future<Either<Failure, ClusterResult>> fetchClusters();
}
