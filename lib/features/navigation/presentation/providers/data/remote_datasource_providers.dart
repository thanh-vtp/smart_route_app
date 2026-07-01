import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/navigation/data/datasources/routing_remote_data_source.dart';
import 'package:smart_route_app/features/navigation/data/datasources/routing_remote_data_source_impl.dart';

part 'remote_datasource_providers.g.dart';

@Riverpod(keepAlive: true)
RoutingRemoteDataSource routingRemoteDataSource(Ref ref) {
  return RoutingRemoteDataSourceImpl();
}
