import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/navigation/domain/usecases/calculate_route_usecase.dart';
import 'package:smart_route_app/features/navigation/domain/usecases/find_near_by_places_usecase.dart';
import 'package:smart_route_app/features/navigation/domain/usecases/get_location_imagery_usecase.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

@riverpod
FindNearbyPlacesUseCase findNearbyPlacesUseCase(
  FindNearbyPlacesUseCaseRef ref,
) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return FindNearbyPlacesUseCase(repository);
}

@riverpod
CalculateRouteUseCase calculateRouteUseCase(CalculateRouteUseCaseRef ref) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return CalculateRouteUseCase(repository);
}

@riverpod
GetLocationImageryUseCase getLocationImageryUseCase(
  GetLocationImageryUseCaseRef ref,
) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return GetLocationImageryUseCase(repository);
}
