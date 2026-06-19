import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/common/domain/usecases/geocode_address_usecase.dart';
import 'package:smart_route_app/core/common/domain/usecases/reverse_geocode_usecase.dart';
import 'package:smart_route_app/core/common/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

/// Chuyển đổi địa chỉ thành tọa độ (geocoding)
@riverpod
GeocodeAddressUseCase geocodeAddressUseCase(GeocodeAddressUseCaseRef ref) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return GeocodeAddressUseCase(repository);
}

/// Chuyển đổi tọa độ thành địa chỉ (reverse geocoding)
@riverpod
ReverseGeocodeUseCase reverseGeocodeUseCase(ReverseGeocodeUseCaseRef ref) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return ReverseGeocodeUseCase(repository);
}
