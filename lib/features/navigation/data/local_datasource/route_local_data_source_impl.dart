import 'package:smart_route_app/core/database/data/local_data_source.dart';

abstract class RouteLocalDataSource extends LocalCacheDataSource {}

class RouteLocalDataSourceImpl extends BaseSQLiteCache
    implements RouteLocalDataSource {
  RouteLocalDataSourceImpl(super.dbHelper);

  @override
  String get tableName => 'route_cache';
}
