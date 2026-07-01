import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/app/fcm_token_service.dart';
import 'package:smart_route_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:smart_route_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_route_app/features/auth/presentation/providers/data/remote_datasource_providers.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final googleAuth = ref.watch(googleAuthDatasourceProvider);
  final supabaseAuth = ref.watch(supabaseAuthDatasourceProvider);
  final tokenService = ref.watch(fcmTokenServiceProvider);
  return AuthRepositoryImpl(googleAuth, supabaseAuth, tokenService);
}
