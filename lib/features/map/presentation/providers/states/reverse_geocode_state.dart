import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/map/domain/entities/address_result.dart';
import 'package:smart_route_app/features/map/presentation/providers/usecase/use_case_providers.dart';

part 'reverse_geocode_state.g.dart';

@riverpod
class ReverseGeocodingState extends _$ReverseGeocodingState {
  @override
  AsyncValue<AddressResult?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> reverseGeocode(double latitude, double longitude) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(reverseGeocodeUseCaseProvider);

    final result = await useCase(latitude, longitude);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (address) => state = AsyncValue.data(address),
    );
  }
}
