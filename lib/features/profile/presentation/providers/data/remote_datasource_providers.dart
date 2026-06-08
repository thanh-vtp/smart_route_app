import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:smart_route_app/features/profile/data/datasources/profile_remote_data_source_impl.dart';

part 'remote_datasource_providers.g.dart';

@Riverpod(keepAlive: true)
ProfileRemoteDataSource profileRemoteDataSource(
  ProfileRemoteDataSourceRef ref,
) {
  return ProfileRemoteDataSourceImpl();
}
