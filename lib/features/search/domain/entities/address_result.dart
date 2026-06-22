import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_result.freezed.dart';

@freezed
abstract class AddressResult with _$AddressResult {
  const AddressResult._(); // Private constructor for custom getters

  const factory AddressResult({
    required String fullAddress,
    required double lat,
    required double lng,
    required double score,

    // Các trường chi tiết địa chỉ Việt Nam
    String? houseNumber, // Số nhà (AddNum)
    String? streetPrefix, // Tiền tố đường: Đường, Phố (StPreType)
    String? streetName, // Tên đường (StName)
    String? ward, // Phường/Xã (Nbrhd hoặc District cấp thấp)
    String? district, // Quận/Huyện (District)
    String? city, // Thành phố/Thị xã (City)
    String? province, // Tỉnh (Region)
    String? countryName, // Tên quốc gia (CntryName)
    String? postalCode, // Mã bưu chính (Postal)
    // Thông tin bổ sung
    String? placeName, // Tên địa điểm (PlaceName)
    String? placeType, // Loại địa điểm (Type)
    String? phoneNumber, // Số điện thoại (Phone)
    String? longLabel, // Nhãn đầy đủ (LongLabel)
    String? shortLabel, // Nhãn ngắn (ShortLabel)
  }) = _AddressResult;

  /// Format địa chỉ đầy đủ theo cấu trúc Việt Nam
  /// Ví dụ: "123 Đường Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh"
  String get formattedAddress {
    final parts = <String>[];

    // Số nhà + Tên đường
    if (houseNumber != null && houseNumber!.isNotEmpty) {
      if (streetPrefix != null && streetName != null) {
        parts.add('$houseNumber $streetPrefix $streetName');
      } else if (streetName != null) {
        parts.add('$houseNumber $streetName');
      } else {
        parts.add(houseNumber!);
      }
    } else if (streetPrefix != null && streetName != null) {
      parts.add('$streetPrefix $streetName');
    } else if (streetName != null) {
      parts.add(streetName!);
    }

    // Phường/Xã
    if (ward != null && ward!.isNotEmpty) {
      parts.add(ward!);
    }

    // Quận/Huyện
    if (district != null && district!.isNotEmpty) {
      parts.add(district!);
    }

    // Thành phố
    if (city != null && city!.isNotEmpty) {
      parts.add(city!);
    }

    // Tỉnh (nếu khác với thành phố)
    if (province != null && province!.isNotEmpty && province != city) {
      parts.add(province!);
    }

    return parts.isEmpty ? fullAddress : parts.join(', ');
  }

  /// Địa chỉ ngắn gọn (không bao gồm tỉnh/thành phố)
  String get shortAddress {
    final parts = <String>[];

    if (houseNumber != null && streetName != null) {
      if (streetPrefix != null) {
        parts.add('$houseNumber $streetPrefix $streetName');
      } else {
        parts.add('$houseNumber $streetName');
      }
    }

    if (ward != null) parts.add(ward!);
    if (district != null) parts.add(district!);

    return parts.isEmpty ? fullAddress : parts.join(', ');
  }
}
