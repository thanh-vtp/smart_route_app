import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/providers/uscases/use_case_providers.dart';
import 'package:smart_route_app/features/profile/presentation/state/profile_state.dart';
import 'package:smart_route_app/features/profile/presentation/providers/usecase/use_case_providers.dart';

part 'profile_notifier.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  ProfileState build() {
    // Tự động tải cài đặt khi mở màn hình
    Future.microtask(() => loadSettings());
    return const ProfileState();
  }

  Future<void> loadSettings() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final currentUser = ref.read(getCurrentUserUsecaseProvider).call();
    if (currentUser.isEmpty) {
      state = state.copyWith(isLoading: false);
      return;
    }

    // Lấy cài đặt từ DB
    final getSettingsUseCase = ref.read(getProfileSettingsUseCaseProvider);
    final result = await getSettingsUseCase(currentUser.id);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (data) {
        state = state.copyWith(
          isLoading: false,
          isPushEnabled: data['is_push_enabled'] ?? true,
        );
      },
    );
  }

  Future<void> updateName(String newName) async {
    state = state.copyWith(
      isUpdatingProfile: true,
      errorMessage: null,
      successMessage: null,
    );

    final currentUser = ref.read(getCurrentUserUsecaseProvider).call();
    if (currentUser.isEmpty) return;

    final usecase = ref.read(updateProfileNameUseCaseProvider);
    final result = await usecase(currentUser.id, newName);

    result.fold(
      (failure) {
        state = state.copyWith(
          isUpdatingProfile: false,
          errorMessage: failure.message,
        );
      },
      (_) {
        state = state.copyWith(
          isUpdatingProfile: false,
          successMessage: 'Cập nhật tên thành công!',
        );
      },
    );
  }

  Future<void> togglePushNotification(bool value) async {
    final previousValue = state.isPushEnabled;
    // Optimistic Update
    state = state.copyWith(isPushEnabled: value, errorMessage: null);

    // 2. Lấy ID user
    final currentUser = ref.read(getCurrentUserUsecaseProvider).call();
    if (currentUser.isEmpty) return;

    // 3. Gọi UseCase cập nhật DB
    final usecase = ref.read(updatePushSettingUseCaseProvider);

    final result = await usecase(currentUser.id, value);

    // 4. Bắt lỗi nếu gọi API thất bại
    result.fold(
      (failure) {
        // Rollback lại trạng thái cũ nếu lỗi
        state = state.copyWith(
          isPushEnabled: previousValue,
          errorMessage: failure.message,
        );
      },
      (_) {
        null;
      },
    );
  }

  void toggleDarkMode(bool value) {
    state = state.copyWith(isDarkMode: value);
    // TODO: Tích hợp đổi Theme toàn app
  }
}
