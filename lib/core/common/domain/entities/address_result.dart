import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_result.freezed.dart';

@freezed
class AddressResult with _$AddressResult {
  const factory AddressResult({
    required String fullAddress,
    required double lat,
    required double lng,
    required double score,

    // Các trường chi tiết (Có thể null tùy thuộc API trả về)
    String? streetName,
    String? neighborhood,
    String? district,
    String? city,
    String? region,
    String? countryName,
    String? postalCode,
  }) = _AddressResult;
}
