// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:smart_route_app/core/resources/lib/supabase.dart';
// import 'package:smart_route_app/features/profile/data/datasources/user_profile_datasource.dart';
// import 'package:smart_route_app/features/profile/data/repositories/user_profile_repository_impl.dart';
// import 'package:smart_route_app/features/profile/domain/entities/user_profile.dart';
// import 'package:smart_route_app/features/profile/domain/repositories/user_profile_repository.dart';
// import 'package:smart_route_app/features/profile/domain/usecases/get_info_usecase.dart';
// import 'package:smart_route_app/features/profile/domain/usecases/update_info_usecase.dart';
// import 'package:smart_route_app/features/profile/presentation/providers/usecase/use_case_providers.dart';

// part 'profile_providers.g.dart';

// @riverpod
// class ProfileNotifier extends _$ProfileNotifier {
//   @override
//   Future<UserProfile> build() async {
//     return _fetchProfile();
//   }

//   Future<UserProfile> _fetchProfile() async {
//     final useCase = ref.read(getInfoUseCaseProvider);
//     final result = await useCase.call(UserProfile.empty);
//     return result.fold((failure) => UserProfile.empty, (profile) => profile);
//   }

//   Future<void> refresh() async {
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() => _fetchProfile());
//   }

//   Future<void> updateProfile(UserProfile profile) async {
//     state = const AsyncValue.loading();
//     final useCase = ref.read(updateInfoUseCaseProvider);
//     await useCase.call(profile);
//     state = await AsyncValue.guard(() => _fetchProfile());
//   }
// }
