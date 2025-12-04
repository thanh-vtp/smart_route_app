import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  Stream<AppUser> get authStateChanges;

  // Lấy user hiện tại
  AppUser get currentUser;

  Future<void> signInWithGoogle();
  Future<void> signOut();
}
