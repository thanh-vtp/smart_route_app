import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/database/map_database.dart';

part 'map_database_providers.g.dart';

@Riverpod(keepAlive: true)
MapDatabase mapDatabase(MapDatabaseRef ref) {
  return MapDatabase.instance;
}
