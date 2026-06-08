import 'package:smart_route_app/core/resources/lib/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<Map<String, dynamic>> getProfileSettings(String userId) async {
    final response = await supabase
        .from('users')
        .select('is_push_enabled, do_not_disturb, reputation_score')
        .eq('id', userId)
        .single();
    return response;
  }

  @override
  Future<void> updatePushSetting(String userId, bool isEnabled) async {
    await supabase
        .from('users')
        .update({'is_push_enabled': isEnabled})
        .eq('id', userId);
  }

  @override
  Future<void> updateProfileName(String userId, String newName) async {
    try {
      // 1. Cập nhật tên vào bảng public.users để cộng đồng nhìn thấy
      await supabase
          .from('users')
          .update({'display_name': newName})
          .eq('id', userId);

      // 2. Cập nhật tên vào Metadata của Supabase Auth để lưu Session trên máy
      await supabase.auth.updateUser(
        UserAttributes(
          data: {'full_name': newName},
        ), // Dùng 'full_name' khớp với trigger lúc trước
      );
    } catch (e) {
      throw Exception('Lỗi cập nhật hồ sơ: $e');
    }
  }
}
