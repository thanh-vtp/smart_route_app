import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_route_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:smart_route_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:smart_route_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:smart_route_app/features/auth/domain/usecases/get_auth_state_changes_usecase.dart';
import 'package:smart_route_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_provider.g.dart';

// 1. Repository Provider
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(Supabase.instance.client);
}

// --- CÁC USECASE PROVIDERS ---

@Riverpod(keepAlive: true)
SignInWithGoogleUsecase signInWithGoogleUsecase(Ref ref) {
  return SignInWithGoogleUsecase(ref.watch(authRepositoryProvider));
}

@Riverpod(keepAlive: true)
SignOutUsecase signOutUsecase(Ref ref) {
  return SignOutUsecase(ref.watch(authRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetAuthStateChangesUsecase getAuthStateChangesUsecase(Ref ref) {
  return GetAuthStateChangesUsecase(ref.watch(authRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetCurrentUserUsecase getCurrentUserUsecase(Ref ref) {
  return GetCurrentUserUsecase(ref.watch(authRepositoryProvider));
}

// --- CONTROLLER & STATE PROVIDERS ---

// 2. Auth State Stream (UI lắng nghe cái này)
// Cập nhật: Sử dụng UseCase thay vì gọi trực tiếp Repository
@Riverpod(keepAlive: true)
Stream<AppUser> authState(Ref ref) {
  final useCase = ref.watch(getAuthStateChangesUsecaseProvider);
  return useCase.call();
}

// Auth Controller với các actions
@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    // Initial state
  }

  // Đăng nhập bằng Google
  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(signInWithGoogleUsecaseProvider);
      await useCase.call();
    });
  }

  // Đăng xuất
  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(signOutUsecaseProvider);
      await useCase.call();
    });
  }
}
