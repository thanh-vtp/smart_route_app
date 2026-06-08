import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:smart_route_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:smart_route_app/features/profile/presentation/providers/data/remote_datasource_providers.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final remoteDataSource = ref.watch(profileRemoteDataSourceProvider);
  return ProfileRepositoryImpl(remoteDataSource);
}
