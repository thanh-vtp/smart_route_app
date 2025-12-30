import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/resources/lib/supabase.dart';
import 'package:smart_route_app/features/profile/data/datasources/user_profile_datasource.dart';

part 'remote_datasource_providers.g.dart';

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref

@Riverpod(keepAlive: true)
UserProfileDatasource userProfileDatasource(UserProfileDatasourceRef ref) {
  return UserProfileDatasourceImpl(supabase);
}
