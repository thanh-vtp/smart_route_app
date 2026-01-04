import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/providers/cache/network_info_providers.dart';
import 'package:smart_route_app/features/map/data/repositories/geocoding_repository_impl.dart';
import 'package:smart_route_app/features/map/domain/repositories/geocoding_repository.dart';
import 'package:smart_route_app/features/map/presentation/providers/data/local_datasource_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/data/remote_datasource_providers.dart';
part 'repository_providers.g.dart';

/// Provider cho Geocoding Repository
/// Sử dụng ArcGIS Geocoding Data Source
/// Được dùng cho các use case liên quan đến geocoding, routing, nearby places
@Riverpod(keepAlive: true)
GeocodingRepository geocodingRepository(GeocodingRepositoryRef ref) {
  final arcgisGeocodingDataSource = ref.watch(
    arcgisGeocodingRemoteDataSourceProvider,
  );
  final geocodingLocalDataSource = ref.watch(geocodingLocalDataSourceProvider);
  final imageryLocalDataSource = ref.watch(imageryLocalDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return GeocodingRepositoryImpl(
    arcgisGeocodingDataSource,
    geocodingLocalDataSource,
    imageryLocalDataSource,
    networkInfo,
  );
}
