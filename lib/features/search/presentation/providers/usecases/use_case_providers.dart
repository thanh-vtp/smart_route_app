import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/search/domain/usecases/geocode_address_usecase.dart';
import 'package:smart_route_app/features/search/domain/usecases/geocode_address_structured_usecase.dart';
import 'package:smart_route_app/features/search/domain/usecases/reverse_geocode_usecase.dart';
import 'package:smart_route_app/features/search/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

/// Chuyển đổi địa chỉ thành tọa độ (geocoding)
@riverpod
GeocodeAddressUseCase geocodeAddressUseCase(Ref ref) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return GeocodeAddressUseCase(repository);
}

/// Chuyển đổi địa chỉ theo cấu trúc thành tọa độ (structured geocoding)
@riverpod
GeocodeAddressStructuredUseCase geocodeAddressStructuredUseCase(Ref ref) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return GeocodeAddressStructuredUseCase(repository);
}

/// Chuyển đổi tọa độ thành địa chỉ (reverse geocoding)
@riverpod
ReverseGeocodeUseCase reverseGeocodeUseCase(Ref ref) {
  final repository = ref.watch(geocodingRepositoryProvider);
  return ReverseGeocodeUseCase(repository);
}
