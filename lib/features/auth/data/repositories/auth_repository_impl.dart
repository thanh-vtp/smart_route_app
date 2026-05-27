import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_route_app/core/app/fcm_token_service.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/resources/lib/supabase.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/data/datasources/google_auth_datasource.dart';
import 'package:smart_route_app/features/auth/data/datasources/supabase_auth_datasource.dart';
import 'package:smart_route_app/features/auth/data/model/app_user_model.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleAuthDatasource _googleAuthDatasource;
  final SupabaseAuthDatasource _supabaseAuthDatasource;
  final FCMTokenService _fcmTokenService;

  AuthRepositoryImpl(
    this._googleAuthDatasource,
    this._supabaseAuthDatasource,
    this._fcmTokenService,
  );

  @override
  Stream<AppUser> get authStateChanges {
    AppLogger.repository('Auth state changes stream started');
    return supabase.auth.onAuthStateChange.asyncMap((data) async {
      final session = data.session;

      if (session == null) {
        return AppUser.empty();
      }

      /// Sync token after login/restore session
      await _fcmTokenService.syncCurrentToken();

      return AppUserModel.fromSupabaseUser(session.user).toDomain();
    });
  }

  @override
  AppUser get currentUser {
    final user = supabase.auth.currentUser;

    if (user == null) {
      return AppUser.empty();
    }

    return AppUserModel.fromSupabaseUser(user).toDomain();
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      final googleUser = await _googleAuthDatasource.signIn();
      final scopes = ['email', 'profile'];

      /// Authorization is required to obtain the access token with the appropriate scopes for Supabase authentication,
      /// while also granting permission to access user information.
      final authorization =
          await googleUser.authorizationClient.authorizationForScopes(scopes) ??
          await googleUser.authorizationClient.authorizeScopes(scopes);

      final idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        return left(
          AuthFailure(technicalMessage: 'Không tìm thấy Google ID Token'),
        );
      }

      await _supabaseAuthDatasource.signInWithGoogleToken(
        idToken: idToken,
        accessToken: authorization.accessToken,
      );

      AppLogger.repository('SignInWithGoogle completed');

      return right(null);
    } catch (e, st) {
      AppLogger.error(
        'SignInWithGoogle error',
        name: 'AuthRepository',
        error: e,
        stackTrace: st,
      );
      return left(
        UnexpectedFailure(e, st),
      ); // return UnexpectedFailure (lỗi chưa xác định)
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      /// Remove current device
      await _fcmTokenService.removeCurrentDevice();

      // sign out khỏi Supabase
      await supabase.auth.signOut();

      // sign out khỏi Google
      await GoogleSignIn.instance.signOut();

      return right(null);
    } catch (e, st) {
      AppLogger.error(
        'SignOut error',
        name: 'AuthRepository',
        error: e,
        stackTrace: st,
      );

      return left(
        UnexpectedFailure(e, st),
      ); // return UnexpectedFailure (lỗi chưa xác định)
    }
  }
}
