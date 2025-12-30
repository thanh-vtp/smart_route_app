import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/profile/data/models/user_profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserProfileDatasource {
  Future<UserProfileModel> getProfile();
  Future<void> upsertUserProfile(UserProfileModel model);
}

class UserProfileDatasourceImpl implements UserProfileDatasource {
  final SupabaseClient supabase;

  UserProfileDatasourceImpl(this.supabase);
  @override
  Future<UserProfileModel> getProfile() async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final data = await supabase
          .from('users')
          .select()
          .eq('id', userId)
          .single();

      final UserProfileModel userProfile = UserProfileModel.fromJson(data);
      return userProfile;
    } catch (e, st) {
      AppLogger.error(
        'Error fetching user profile: $e',
        name: 'UserProfileDatasourceImpl.getProfile',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  @override
  Future<void> upsertUserProfile(UserProfileModel model) async {
    try {
      await supabase.from('users').upsert(model.toJson());
    } catch (e, st) {
      AppLogger.error(
        'Error upserting user profile: $e',
        name: 'UserProfileDatasourceImpl.upsertUserProfile',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
