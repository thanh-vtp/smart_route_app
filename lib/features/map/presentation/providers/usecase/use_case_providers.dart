import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/incident/domain/usecases/add_incident_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/calculate_route_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/delete_incident_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/find_near_by_places_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/get_incidents_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/get_location_imagery_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/update_incident_usecase.dart';
import 'package:smart_route_app/features/map/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';


@riverpod
FindNearbyPlacesUseCase findNearbyPlacesUseCase(
  FindNearbyPlacesUseCaseRef ref,
) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return FindNearbyPlacesUseCase(repository);
}

// @riverpod
// GeocodeAddressUseCase geocodeAddressUseCase(GeocodeAddressUseCaseRef ref) {
//   final repository = ref.watch(geocodingRepositoryProvider);
//   return GeocodeAddressUseCase(repository);
// }

// @riverpod
// ReverseGeocodeUseCase reverseGeocodeUseCase(ReverseGeocodeUseCaseRef ref) {
//   final repository = ref.watch(geocodingRepositoryProvider);
//   return ReverseGeocodeUseCase(repository);
// }

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
