import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/network/providers/network_info_providers.dart';
import 'package:smart_route_app/features/search/data/repositories/geocoding_repository_impl.dart';
import 'package:smart_route_app/features/search/domain/repositories/geocoding_repository.dart';
import 'package:smart_route_app/features/search/presentation/providers/data/local_datasource_providers.dart';
import 'package:smart_route_app/features/search/presentation/providers/data/remote_datasource_providers.dart';

part 'repository_providers.g.dart';

/// Provider cho Geocoding Repository
/// Sử dụng ArcGIS Geocoding Data Source
/// Được dùng cho các use case liên quan đến geocoding
@Riverpod(keepAlive: true)
GeocodingRepository geocodingRepository(GeocodingRepositoryRef ref) {
  final arcgisGeocodingDataSource = ref.watch(
    arcgisGeocodingRemoteDataSourceProvider,
  );
  final geocodingLocalDataSource = ref.watch(geocodingLocalDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return GeocodingRepositoryImpl(
    arcgisGeocodingDataSource,
    geocodingLocalDataSource,
    networkInfo,
  );
}
