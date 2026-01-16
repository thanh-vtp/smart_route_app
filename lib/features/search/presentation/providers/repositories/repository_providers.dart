import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/network/providers/network_info_providers.dart';
import 'package:smart_route_app/features/search/data/repositories/geocoding_repository_impl.dart';
import 'package:smart_route_app/features/search/data/repositories/imagery_repository_impl.dart';
import 'package:smart_route_app/features/search/data/repositories/nearby_place_repository_impl.dart';
import 'package:smart_route_app/features/search/domain/repositories/geocoding_repository.dart';
import 'package:smart_route_app/features/search/domain/repositories/imagery_repository.dart';
import 'package:smart_route_app/features/search/domain/repositories/nearby_place_repository.dart';
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
  final reverseGeocodingLocalDataSource = ref.watch(
    reverseGeocodingLocalDataSourceProvider,
  );
  final networkInfo = ref.watch(networkInfoProvider);
  return GeocodingRepositoryImpl(
    arcgisGeocodingDataSource,
    geocodingLocalDataSource,
    reverseGeocodingLocalDataSource,
    networkInfo,
  );
}

@Riverpod(keepAlive: true)
ImageryRepository imageryRepository(ImageryRepositoryRef ref) {
  final arcgisImageDataSource = ref.watch(arcgisImageRemoteDataSourceProvider);
  final imageryLocalDataSource = ref.watch(imageryLocalDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return ImageryRepositoryImpl(
    arcgisImageDataSource,
    imageryLocalDataSource,
    networkInfo,
  );
}

@Riverpod(keepAlive: true)
NearbyPlaceRepository nearbyPlaceRepository(NearbyPlaceRepositoryRef ref) {
  final arcGISGeocodingRemoteDataSource = ref.watch(
    arcgisGeocodingRemoteDataSourceProvider,
  );
  final placeLocalDataSource = ref.watch(placeLocalDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return NearbyPlaceRepositoryImpl(
    arcGISGeocodingRemoteDataSource,
    placeLocalDataSource,
    networkInfo,
  );
}
