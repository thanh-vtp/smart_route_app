
import 'package:smart_route_app/common/app_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseAuthDatasource {
  Future<void> signInWithGoogleToken({
    required String idToken,
    required String accessToken,
  });
}

class SupabaseAuthDatasourceImpl implements SupabaseAuthDatasource {
  final SupabaseClient supabase;

  SupabaseAuthDatasourceImpl(this.supabase);

  @override
  Future<void> signInWithGoogleToken({
    required String idToken,
    required String accessToken,
  }) async {
    try {
      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e, st) {
      AppLogger.error(
        '[LOI] Supabase sign in with Google Token: $e',
        error: e,
        stackTrace: st,
        name: 'SupabaseAuthDatasourceImpl',
      );
      throw Exception('[Exception] Supabase sign in with Google Token $e');
    }
  }
}
