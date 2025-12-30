import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/profile/domain/usecases/get_info_usecase.dart';
import 'package:smart_route_app/features/profile/domain/usecases/update_info_usecase.dart';
import 'package:smart_route_app/features/profile/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

@riverpod
GetInfoUseCase getInfoUseCase(GetInfoUseCaseRef ref) {
  final repository = ref.watch(userProfileRepositoryProvider);
  return GetInfoUseCase(repository);
}

@riverpod
UpdateInfoUseCase updateInfoUseCase(UpdateInfoUseCaseRef ref) {
  final repository = ref.watch(userProfileRepositoryProvider);
  return UpdateInfoUseCase(repository);
}
