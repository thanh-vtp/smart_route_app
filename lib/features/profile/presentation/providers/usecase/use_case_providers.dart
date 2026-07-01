import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/profile/domain/usecases/get_profile_settings_usecase.dart';
import 'package:smart_route_app/features/profile/domain/usecases/update_profile_name_usecase.dart';
import 'package:smart_route_app/features/profile/domain/usecases/update_push_setting_usecase.dart';
import 'package:smart_route_app/features/profile/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

@Riverpod(keepAlive: true)
UpdatePushSettingUseCase updatePushSettingUseCase(Ref ref) {
  return UpdatePushSettingUseCase(ref.watch(profileRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetProfileSettingsUseCase getProfileSettingsUseCase(Ref ref) {
  return GetProfileSettingsUseCase(ref.watch(profileRepositoryProvider));
}

@Riverpod(keepAlive: true)
UpdateProfileNameUseCase updateProfileNameUseCase(Ref ref) {
  return UpdateProfileNameUseCase(ref.watch(profileRepositoryProvider));
}
