import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/profile/domain/entities/user_profile.dart';
import 'package:smart_route_app/features/profile/domain/repositories/user_profile_repository.dart';

class GetInfoUseCase {
  final UserProfileRepository repository;

  GetInfoUseCase(this.repository);

  Future<Either<Failure, UserProfile>> call() async {
    final repositoryResult = await repository.getProfile();
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
