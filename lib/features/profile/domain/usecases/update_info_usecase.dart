import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/profile/domain/entities/user_profile.dart';
import 'package:smart_route_app/features/profile/domain/repositories/user_profile_repository.dart';

class UpdateInfoUseCase {
  final UserProfileRepository repository;

  UpdateInfoUseCase(this.repository);

  Future<Either<Failure, void>> call(UserProfile profile) async {
    final repositoryResult = await repository.updateProfile(profile);

    return repositoryResult.fold(
      (failure) {
        return left(failure);
      },
      (result) {
        return right(result);
      },
    );
  }
}
