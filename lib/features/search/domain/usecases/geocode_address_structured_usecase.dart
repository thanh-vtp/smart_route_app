import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/search/domain/repositories/geocoding_repository.dart';

/// UseCase cho tìm kiếm địa chỉ theo cấu trúc Việt Nam
/// Hỗ trợ tìm kiếm theo các trường riêng biệt: số nhà, đường, phường, quận, tỉnh
///
/// Ví dụ:
/// ```dart
/// final usecase = GeocodeAddressStructuredUseCase(repository);
///
/// final result = await usecase(
///   houseNumber: '123',
///   street: 'Nguyễn Huệ',
///   ward: 'Bến Nghé',
///   district: 'Quận 1',
///   city: 'TP. Hồ Chí Minh',
/// );
/// ```
class GeocodeAddressStructuredUseCase {
  final GeocodingRepository _repository;

  GeocodeAddressStructuredUseCase(this._repository);

  /// Tìm kiếm địa chỉ với các trường cấu trúc
  ///
  /// Parameters:
  /// - [houseNumber]: Số nhà (ví dụ: "123", "45A")
  /// - [street]: Tên đường (ví dụ: "Nguyễn Huệ", "Đường Lê Lợi")
  /// - [ward]: Phường/Xã (ví dụ: "Bến Nghé", "Phường 1")
  /// - [district]: Quận/Huyện (ví dụ: "Quận 1", "Huyện Cam Lâm")
  /// - [city]: Thành phố/Thị xã (ví dụ: "TP. Hồ Chí Minh", "Nha Trang")
  /// - [province]: Tỉnh (ví dụ: "Khánh Hòa", "TP. Hồ Chí Minh")
  /// - [postalCode]: Mã bưu chính (ví dụ: "700000", "57000")
  ///
  /// Ít nhất một trong các trường phải được cung cấp
  Future<Either<Failure, List<AddressResult>>> call({
    String? houseNumber,
    String? street,
    String? ward,
    String? district,
    String? city,
    String? province,
    String? postalCode,
  }) async {
    return await _repository.findAddressCandidatesStructured(
      houseNumber: houseNumber,
      street: street,
      ward: ward,
      district: district,
      city: city,
      province: province,
      postalCode: postalCode,
    );
  }
}
