import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogleUsecase {
  final AuthRepository _repository;

  SignInWithGoogleUsecase(this._repository);

  // Gọi hàm này để thực hiện đăng nhập
  Future<void> call() async {
    try {
      AppLogger.domain('SignInWithGoogle started', useCase: 'SignInWithGoogle');
      await _repository.signInWithGoogle();
      AppLogger.domain(
        'SignInWithGoogle completed',
        useCase: 'SignInWithGoogle',
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'SignInWithGoogle error',
        name: 'SignInWithGoogleUseCase',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
