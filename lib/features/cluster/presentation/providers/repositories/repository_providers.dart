import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/network/providers/network_info_providers.dart';
import 'package:smart_route_app/features/cluster/data/repositories/cluster_repository_impl.dart';
import 'package:smart_route_app/features/cluster/domain/repositories/cluster_repository.dart';
import 'package:smart_route_app/features/cluster/presentation/providers/data/remote_datasource_providers.dart';

part 'repository_providers.g.dart';

@riverpod
ClusterRepository clusterRepository(ClusterRepositoryRef ref) {
  final remoteDataSource = ref.watch(clusterRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return ClusterRepositoryImpl(remoteDataSource, networkInfo);
}
