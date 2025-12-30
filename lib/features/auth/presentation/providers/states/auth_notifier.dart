import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/providers/uscases/use_case_providers.dart';

part 'auth_notifier.g.dart';

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
