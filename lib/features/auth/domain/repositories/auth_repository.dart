import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  // Lắng nghe thay đổi trạng thái xác thực
  Stream<AppUser> get authStateChanges;

  // Lấy user hiện tại
  AppUser get currentUser;

  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
}
