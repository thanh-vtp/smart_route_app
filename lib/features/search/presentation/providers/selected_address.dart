import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_info_provider.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';

part 'selected_address.g.dart';

@riverpod
class SelectedAddress extends _$SelectedAddress {
  @override
  AddressResult? build() {
    return null;
  }

  void setAddress({
    AddressResult? address,
    double? latitude,
    double? longitude,
  }) {
    if (address != null) {
      state = address;
    } else if (latitude != null && longitude != null) {
      // Tạo AddressResult từ tọa độ (sẽ được update sau khi reverse geocode)
      state = AddressResult(
        fullAddress:
            '${latitude.toStringAsFixed(6)}, ${longitude.toStringAsFixed(6)}',
        latitude: latitude,
        longitude: longitude,
        score: 0, // Score tạm (sẽ update sau khi reverse geocode)
      );
    }
  }

  // clear
  void clear() {
    state = null;
    ref
        .read(mapBottomSheetProvider.notifier)
        .hide(); // Ẩn bottom sheet khi xóa địa chỉ (LocationInfoDraggableSheet)
  }
}
