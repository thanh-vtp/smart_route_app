import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/common/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository _repository;

  SignOutUsecase(this._repository);

  Future<Either<Failure, void>> call() async {
    AppLogger.domain('SignOut started', useCase: 'SignOut');
    final repositoryResult = await _repository.signOut();

    return repositoryResult.fold(
      (failure) {
        AppLogger.domain(
          'SignOut failed: ${failure.message}',
          useCase: 'SignOut',
        );
        return left(failure);
      },
      (result) {
        AppLogger.domain('SignOut succeeded', useCase: 'SignOut');
        return right(result);
      },
    );
  }
}
