import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/network/providers/network_info_providers.dart';
import 'package:smart_route_app/core/common/data/repositories/geocoding_repository_impl.dart';
import 'package:smart_route_app/core/common/domain/repositories/geocoding_repository.dart';
import 'package:smart_route_app/core/common/presentation/providers/data/remote_datasource_providers.dart';

part 'repository_providers.g.dart';

/// Provider cho Geocoding Repository
/// Sử dụng ArcGIS Geocoding Data Source
/// Được dùng cho các use case liên quan đến geocoding
@Riverpod(keepAlive: true)
GeocodingRepository geocodingRepository(GeocodingRepositoryRef ref) {
  final arcgisGeocodingDataSource = ref.watch(
    arcgisGeocodingRemoteDataSourceProvider,
  );

  final networkInfo = ref.watch(networkInfoProvider);
  return GeocodingRepositoryImpl(arcgisGeocodingDataSource, networkInfo);
}
