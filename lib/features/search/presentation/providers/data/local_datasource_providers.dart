import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/database/providers/map_database_providers.dart';
import 'package:smart_route_app/features/search/data/local_datasource/geocoding_local_data_source_impl.dart';
import 'package:smart_route_app/features/search/data/local_datasource/imagery_local_data_source.dart';
import 'package:smart_route_app/features/search/data/local_datasource/imagery_local_data_source_impl.dart';
import 'package:smart_route_app/features/search/data/local_datasource/place_local_data_source_impl.dart';

part 'local_datasource_providers.g.dart';

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref

/// Provider cho Geocoding Local Data Source
@Riverpod(keepAlive: true)
GeocodingLocalDataSource geocodingLocalDataSource(
  GeocodingLocalDataSourceRef ref,
) {
  final db = ref.watch(mapDatabaseProvider);
  return GeocodingLocalDataSourceImpl(db);
}

@Riverpod(keepAlive: true)
ReverseGeocodingLocalDataSource reverseGeocodingLocalDataSource(
  ReverseGeocodingLocalDataSourceRef ref,
) {
  final db = ref.watch(mapDatabaseProvider);
  return ReverseGeocodingLocalDataSourceImpl(db);
}

/// Provider cho Imagery Local Data Source
@Riverpod(keepAlive: true)
ImageryLocalDataSource imageryLocalDataSource(ImageryLocalDataSourceRef ref) {
  return ImageryLocalDataSourceImpl();
}

/// Provider cho Place Local Data Source
@Riverpod(keepAlive: true)
PlaceLocalDataSource placeLocalDataSource(PlaceLocalDataSourceRef ref) {
  final db = ref.watch(mapDatabaseProvider);
  return PlaceLocalDataSourceImpl(db);
}
