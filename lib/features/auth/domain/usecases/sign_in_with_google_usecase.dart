import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogleUsecase {
  final AuthRepository _repository;

  SignInWithGoogleUsecase(this._repository);

  // Gọi hàm này để thực hiện đăng nhập
  Future<Either<Failure, void>> call() async {
    AppLogger.domain('SignInWithGoogle started', useCase: 'SignInWithGoogle');
    final repositoryResult = await _repository.signInWithGoogle();

    return repositoryResult.fold(
      (failure) {
        AppLogger.domain(
          'SignInWithGoogle failed: ${failure.technicalMessage}',
          useCase: 'SignInWithGoogle',
        );
        return left(failure);
      },
      (result) {
        AppLogger.domain(
          'SignInWithGoogle succeeded',
          useCase: 'SignInWithGoogle',
        );
        return right(result);
      },
    );
  }
}
