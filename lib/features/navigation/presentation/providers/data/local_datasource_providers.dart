import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/providers/cache/map_database_providers.dart';
import 'package:smart_route_app/features/navigation/data/local_datasource/geocoding_local_data_source.dart';
import 'package:smart_route_app/features/navigation/data/local_datasource/geocoding_local_data_source_impl.dart';
import 'package:smart_route_app/features/navigation/data/local_datasource/imagery_local_data_source.dart';
import 'package:smart_route_app/features/navigation/data/local_datasource/imagery_local_data_source_impl.dart';

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

/// Provider cho Imagery Local Data Source
@Riverpod(keepAlive: true)
ImageryLocalDataSource imageryLocalDataSource(ImageryLocalDataSourceRef ref) {
  return ImageryLocalDataSourceImpl();
}
