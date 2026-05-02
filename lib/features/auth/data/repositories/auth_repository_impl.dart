import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/auth/data/datasources/google_auth_datasource.dart';
import 'package:smart_route_app/features/auth/data/datasources/supabase_auth_datasource.dart';
import 'package:smart_route_app/features/auth/data/maper/user_mapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleAuthDatasource _googleAuthDatasource;
  final SupabaseAuthDatasource _supabaseAuthDatasource;
  final SupabaseClient _supabase;

  AuthRepositoryImpl(
    this._googleAuthDatasource,
    this._supabaseAuthDatasource,
    this._supabase,
  );

  @override
  Stream<AppUser> get authStateChanges {
    AppLogger.repository('Auth state changes stream started');
    return _supabase.auth.onAuthStateChange.map((data) {
      final session = data.session;
      final user = session.toDomain();
      AppLogger.repository(
        'Auth state changed: ${user.isEmpty ? "Logged out" : "Logged in as ${user.email}"}',
      );

      // Nếu có seseion mới (user đăng nhập), cập nhật FCM token
      if (session != null && session.user.id.isNotEmpty) {
        _updateFCMToken(session.user.id);
      }
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
        // throw AuthException('No ID Token found.');
        return left(AuthFailure('No ID Token found.')); //  (lỗi xác thực)
      }

      await _supabaseAuthDatasource.signInWithGoogleToken(
        idToken: idToken,
        accessToken: authorization.accessToken,
      );

      // Tạo/cập nhật user profile trong database sau khi auth thành công
      await _createUserProfileIfNotExists();

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

  /// Tạo user profile nếu chưa tồn tại trong database
  Future<void> _createUserProfileIfNotExists() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) return;

      // Kiểm tra user đã tồn tại chưa
      final existingUser = await _supabase
          .from('users')
          .select('id')
          .eq('id', user.id)
          .maybeSingle();

      if (existingUser == null) {
        // Tạo user profile mới
        await _supabase.from('users').insert({
          'id': user.id,
          'email': user.email,
          'display_name':
              user.userMetadata?['full_name'] ??
              user.userMetadata?['name'] ??
              user.email?.split('@').first,
          'avatar_url':
              user.userMetadata?['avatar_url'] ?? user.userMetadata?['picture'],
          'created_at': DateTime.now().toIso8601String(),
        });

        AppLogger.repository('Created new user profile for ${user.email}');
      } else {
        AppLogger.repository('User profile already exists for ${user.email}');
      }
    } catch (e, st) {
      // Log lỗi nhưng không throw - auth vẫn thành công
      AppLogger.error(
        'Error creating user profile',
        name: 'AuthRepository._createUserProfileIfNotExists',
        error: e,
        stackTrace: st,
      );
    }
  }

  // Update FCM Token lên database
  Future<void> _updateFCMToken(String userId) async {
    try {
      // fix: JsonUnsupportedObjectError (Converting object to an encodable object failed: Instance of 'Future<String?>')
      // bắt buột phải chờ token mới được cấp trước khi cập nhật lên database
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        await _supabase
            .from("users")
            .update({'fcm_token': token})
            .eq('id', userId);
      }
    } catch (e, st) {
      AppLogger.error(
        'Error updating FCM token',
        name: 'AuthRepository._updateFCMToken',
        error: e,
        stackTrace: st,
      );
    }
  }

  // Remove FCM Token khi sign out
  Future<void> _removeFCMToken(String userId) async {
    try {
      await _supabase
          .from("users")
          .update({'fcm_token': null})
          .eq('id', userId);
    } catch (e, st) {
      AppLogger.error(
        'Error removing FCM token',
        name: 'AuthRepository._removeFCMToken',
        error: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      AppLogger.repository('SignOut started');
      // Remove FCM token trước khi sign out
      final currenUser = _supabase.auth.currentUser;
      if (currenUser != null) {
        await _removeFCMToken(currenUser.id);
      }

      // sign out khỏi Supabase
      await _supabase.auth.signOut();
      AppLogger.repository('SignOut completed');

      await GoogleSignIn.instance.signOut();

      AppLogger.repository('SignOut completed');

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
