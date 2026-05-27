import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/providers/uscases/use_case_providers.dart';

part 'auth_session_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthSession extends _$AuthSession {
  @override
  Stream<AppUser> build() {
    final usecase = ref.watch(getAuthStateChangesUsecaseProvider);

    return usecase.call();
  }
}
