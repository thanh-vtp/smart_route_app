import '../models/cluster_model.dart';

abstract class ClusterRemoteDataSource {
  Future<ClusterResponseModel> fetchClusters();
}
