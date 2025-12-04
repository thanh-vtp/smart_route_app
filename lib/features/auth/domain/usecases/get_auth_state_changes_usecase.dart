import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/domain/repositories/auth_repository.dart';

class GetAuthStateChangesUsecase {
  final AuthRepository _repository;

  GetAuthStateChangesUsecase(this._repository);

  Stream<AppUser> call() {
    return _repository.authStateChanges;
  }
}
