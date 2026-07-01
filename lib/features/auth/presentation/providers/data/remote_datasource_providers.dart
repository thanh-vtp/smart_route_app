import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/common/constants/supabase.dart';
import 'package:smart_route_app/features/auth/data/datasources/google_auth_datasource.dart';
import 'package:smart_route_app/features/auth/data/datasources/supabase_auth_datasource.dart';
import 'package:smart_route_app/features/auth/data/datasources/user_device_datasource.dart';
part 'remote_datasource_providers.g.dart';

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref

/// Provider cho Google Auth Data Source
@Riverpod(keepAlive: true)
GoogleAuthDatasource googleAuthDatasource(Ref ref) {
  return GoogleAuthDatasourceImpl();
}

/// Provider cho Supabase Auth Data Source
@Riverpod(keepAlive: true)
SupabaseAuthDatasource supabaseAuthDatasource(Ref ref) {
  return SupabaseAuthDatasourceImpl(supabase);
}

/// Provider cho User Device Data Source
@Riverpod(keepAlive: true)
UserDeviceDatasource userDeviceDatasource(Ref ref) {
  return UserDeviceDatasourceImpl();
}
