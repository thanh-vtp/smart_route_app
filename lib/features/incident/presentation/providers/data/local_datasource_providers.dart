import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/database/providers/map_database_providers.dart';
import 'package:smart_route_app/features/incident/data/local_datasource/incident_local_datasourece.dart';

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
