import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/search/domain/usecases/geocode_address_usecase.dart';
import 'package:smart_route_app/features/search/domain/usecases/get_location_imagery_usecase.dart';
import 'package:smart_route_app/features/search/domain/usecases/reverse_geocode_usecase.dart';
import 'package:smart_route_app/features/search/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

@riverpod
GeocodeAddressUseCase geocodeAddressUseCase(GeocodeAddressUseCaseRef ref) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return GeocodeAddressUseCase(repository);
}

@riverpod
ReverseGeocodeUseCase reverseGeocodeUseCase(ReverseGeocodeUseCaseRef ref) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return ReverseGeocodeUseCase(repository);
}

@riverpod
GetLocationImageryUseCase getLocationImageryUseCase(
  GetLocationImageryUseCaseRef ref,
) {
  final repository = ref.watch(imageryRepositoryProvider);
  return GetLocationImageryUseCase(repository);
}
