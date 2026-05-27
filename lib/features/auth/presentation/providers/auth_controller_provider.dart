import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/auth/presentation/auth_state.dart';
import 'package:smart_route_app/features/auth/presentation/providers/uscases/use_case_providers.dart';

part 'auth_controller_provider.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> signInWithGoogle() async {
    state = const AuthState.loading();

    final useCase = ref.read(signInWithGoogleUsecaseProvider);

    final result = await useCase.call();

    result.fold(
      (failure) {
        state = AuthState.error(failure.technicalMessage);
      },
      (_) {
        state = const AuthState.initial();
      },
    );
  }

  Future<void> signOut() async {
    state = const AuthState.loading();

    final useCase = ref.read(signOutUsecaseProvider);

    final result = await useCase.call();

    result.fold(
      (failure) {
        state = AuthState.error(failure.technicalMessage);
      },
      (_) {
        state = const AuthState.initial();
      },
    );
  }
}
