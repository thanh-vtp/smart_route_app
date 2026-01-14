import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/database/providers/map_database_providers.dart';
import 'package:smart_route_app/features/navigation/data/local_datasource/place_local_data_source_impl.dart';
import 'package:smart_route_app/features/navigation/data/local_datasource/route_local_data_source_impl.dart';

part 'local_datasource_providers.g.dart';

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref

/// Provider cho Place Local Data Source
@Riverpod(keepAlive: true)
PlaceLocalDataSource placeLocalDataSource(PlaceLocalDataSourceRef ref) {
  final db = ref.watch(mapDatabaseProvider);
  return PlaceLocalDataSourceImpl(db);
}

/// Provider cho Route Local Data Source
@Riverpod(keepAlive: true)
RouteLocalDataSource routeLocalDataSource(RouteLocalDataSourceRef ref) {
  final db = ref.watch(mapDatabaseProvider);
  return RouteLocalDataSourceImpl(db);
}
