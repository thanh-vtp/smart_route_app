import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/profile/data/repositories/user_profile_repository_impl.dart';
import 'package:smart_route_app/features/profile/domain/repositories/user_profile_repository.dart';
import 'package:smart_route_app/features/profile/presentation/providers/data/remote_datasource_providers.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
UserProfileRepository userProfileRepository(UserProfileRepositoryRef ref) {
  final userProfileDatasource = ref.watch(userProfileDatasourceProvider);
  return UserProfileRepositoryImpl(userProfileDatasource);
}
