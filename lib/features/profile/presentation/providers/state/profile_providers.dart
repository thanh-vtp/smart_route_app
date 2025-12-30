import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/profile/domain/entities/user_profile.dart';
import 'package:smart_route_app/features/profile/domain/usecases/get_info_usecase.dart';
import 'package:smart_route_app/features/profile/domain/usecases/update_info_usecase.dart';
import 'package:smart_route_app/features/profile/presentation/providers/usecase/use_case_providers.dart';

part 'profile_providers.g.dart';

@Riverpod(keepAlive: true)
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<UserProfile> build() async {
    return _fetchProfile();
  }

  GetInfoUseCase get _getInfoUseCase => ref.read(getInfoUseCaseProvider);
  UpdateInfoUseCase get _updateInfoUseCase =>
      ref.read(updateInfoUseCaseProvider);

  Future<UserProfile> _fetchProfile() async {
    final result = await _getInfoUseCase.call();
    return result.fold((failure) => throw failure, (profile) => profile);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchProfile());
  }

  Future<void> updateProfile(UserProfile profile) async {
    state = const AsyncValue.loading();

    final result = await _updateInfoUseCase.call(profile);
    return result.fold(
      (failure) {
        throw failure;
      },
      (profile) async {
        return profile;
      },
    );
  }
}
