import 'package:smart_route_app/core/resources/lib/supabase.dart';
import 'package:smart_route_app/core/utils/constants.dart';
import 'package:smart_route_app/features/auth/data/maper/user_mapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient _supabase;

  AuthRepositoryImpl(this._supabase);

  @override
  Stream<AppUser> get authStateChanges {
    AppLogger.repository('Auth state changes stream started');
    return _supabase.auth.onAuthStateChange.map((data) {
      final user = data.session.toDomain();
      AppLogger.repository(
        'Auth state changed: ${user.isEmpty ? "Logged out" : "Logged in as ${user.email}"}',
      );
      return user;
    });
  }

  @override
  AppUser get currentUser {
    final user = _supabase.auth.currentSession.toDomain();
    AppLogger.repository(
      'getCurrentUser: ${user.isEmpty ? "No user" : user.email}',
    );
    return user;
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      /// TODO: update the Web client ID with your own.
      ///
      /// Web Client ID that you registered with Google Cloud.
      final webClientId = Constants.googleClientIdWeb;

      /// TODO: update the iOS client ID with your own.
      ///
      /// iOS Client ID that you registered with Google Cloud.
      // const iosClientId = 'my-ios.apps.googleusercontent.com';

      final androidClientId = Constants.androidClientId;
      final scopes = ['email', 'profile'];
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(
        serverClientId: webClientId,
        clientId: androidClientId,
      );
      final googleUser = await googleSignIn.attemptLightweightAuthentication();
      // or await googleSignIn.authenticate(); which will return a GoogleSignInAccount or throw an exception
      if (googleUser == null) {
        throw AuthException('Failed to sign in with Google.');
      }

      /// Authorization is required to obtain the access token with the appropriate scopes for Supabase authentication,
      /// while also granting permission to access user information.
      final authorization =
          await googleUser.authorizationClient.authorizationForScopes(scopes) ??
          await googleUser.authorizationClient.authorizeScopes(scopes);
      final idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        throw AuthException('No ID Token found.');
      }
      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: authorization.accessToken,
      );
      AppLogger.repository('SignInWithGoogle completed');
    } catch (error) {
      AppLogger.error(
        'SignInWithGoogle error',
        name: 'AuthRepository',
        error: error,
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      AppLogger.repository('SignOut started');
      await _supabase.auth.signOut();
      AppLogger.repository('SignOut completed');
    } catch (e, stackTrace) {
      AppLogger.error(
        'SignOut error',
        name: 'AuthRepository',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
