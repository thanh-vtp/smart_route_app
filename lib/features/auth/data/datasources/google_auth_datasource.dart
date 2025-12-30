import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class GoogleAuthDatasource {
  Future<GoogleSignInAccount> signIn();
}

class GoogleAuthDatasourceImpl implements GoogleAuthDatasource {
  @override
  Future<GoogleSignInAccount> signIn() async {
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

      final googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize(
        serverClientId: webClientId,
        clientId: androidClientId,
      );

      final googleUser = await googleSignIn.attemptLightweightAuthentication();
      // or await googleSignIn.authenticate(); which will return a GoogleSignInAccount or throw an exception
      if (googleUser == null) {
        throw AuthException('Google sign-in failed');
      }

      return googleUser;
    } catch (e, st) {
      AppLogger.error(
        'Google sign-in error: $e',
        error: e,
        stackTrace: st,
        name: 'GoogleAuthDatasourceImpl',
      );
      rethrow;
    }
  }
}
