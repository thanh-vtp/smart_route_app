import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/network/providers/network_info_providers.dart';
import 'package:smart_route_app/features/navigation/data/repositories/routing_repository_impl.dart';
import 'package:smart_route_app/features/navigation/domain/repositories/routing_repository.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/data/local_datasource_providers.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/data/remote_datasource_providers.dart';
part 'repository_providers.g.dart';

/// Provider cho Geocoding Repository
/// Sử dụng ArcGIS Geocoding Data Source
/// Được dùng cho các use case liên quan đến geocoding, routing, nearby places
@Riverpod(keepAlive: true)
RoutingRepository routingRepository(RoutingRepositoryRef ref) {
  final routingRemoteDataSource = ref.watch(routingRemoteDataSourceProvider);
  final imageRemoteDataSource = ref.watch(imageRemoteDataSourceProvider);
  final placeLocalDataSource = ref.watch(placeLocalDataSourceProvider);
  final routeLocalDataSource = ref.watch(routeLocalDataSourceProvider);
  final imageryLocalDataSource = ref.watch(imageryLocalDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return RoutingRepositoryImpl(
    routingRemoteDataSource,
    imageRemoteDataSource,
    imageryLocalDataSource,
    placeLocalDataSource,
    routeLocalDataSource,
    networkInfo,
  );
}
