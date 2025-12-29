import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/map/data/local_datasource/geocoding_local_data_source.dart';
import 'package:smart_route_app/features/map/data/local_datasource/geocoding_local_data_source_impl.dart';
import 'package:smart_route_app/features/map/data/local_datasource/imagery_local_data_source.dart';
import 'package:smart_route_app/features/map/data/local_datasource/incident_local_datasourece.dart';
import 'package:smart_route_app/features/map/presentation/providers/cache/map_database_providers.dart';

part 'local_datasource_providers.g.dart';

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref

/// Provider cho ArcGIS Local Data Source
@Riverpod(keepAlive: true)
IncidentLocalDataSource incidentLocalDataSource(
  IncidentLocalDataSourceRef ref,
) {
  final db = ref.watch(mapDatabaseProvider);
  return IncidentLocalDataSourceImpl(db);
}

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
