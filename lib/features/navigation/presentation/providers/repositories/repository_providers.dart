import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/network/providers/network_info_providers.dart';
import 'package:smart_route_app/features/navigation/data/repositories/routing_repository_impl.dart';
import 'package:smart_route_app/features/navigation/domain/repositories/routing_repository.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/data/remote_datasource_providers.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
RoutingRepository routingRepository(RoutingRepositoryRef ref) {
  final routingRemoteDataSource = ref.watch(routingRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return RoutingRepositoryImpl(routingRemoteDataSource, networkInfo);
}
