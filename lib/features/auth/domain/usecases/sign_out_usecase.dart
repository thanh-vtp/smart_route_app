import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository _repository;

  SignOutUsecase(this._repository);

  Future<void> call() async {
    try {
      AppLogger.domain('SignOut started', useCase: 'SignOut');
      await _repository.signOut();
      AppLogger.domain('SignOut completed', useCase: 'SignOut');
    } catch (e, stackTrace) {
      AppLogger.error(
        'SignOut error',
        name: 'SignOutUseCase',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
