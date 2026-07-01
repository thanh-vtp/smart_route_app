import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/database/cache/map_database.dart';

part 'map_database_providers.g.dart';

@Riverpod(keepAlive: true)
MapDatabase mapDatabase(Ref ref) {
  return MapDatabase.instance;
}
