import 'package:smart_route_app/core/database/data/local_data_source.dart';

abstract class PlaceLocalDataSource extends LocalCacheDataSource {}

class PlaceLocalDataSourceImpl extends BaseSQLiteCache
    implements PlaceLocalDataSource {
  PlaceLocalDataSourceImpl(super.dbHelper);

  @override
  String get tableName => 'place_cache';
}
