// State providers for geocoding results
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/map/domain/entities/address_result.dart';
import 'package:smart_route_app/features/map/presentation/providers/usecase/use_case_providers.dart';

part 'geocode_address_state.g.dart';

@riverpod
class GeocodeAddressState extends _$GeocodeAddressState {
  @override
  AsyncValue<List<AddressResult>?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> geocodeAddress(String address) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(geocodeAddressUseCaseProvider);

    final result = await useCase(address);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (addresses) => state = AsyncValue.data(addresses),
    );
  }
}
