import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';

part 'geocoding_models.freezed.dart';
part 'geocoding_models.g.dart';

// Model dùng chung
@freezed
abstract class LocationPoint with _$LocationPoint {
  const factory LocationPoint({
    @Default(0.0) @JsonKey(name: 'x') double lng, // Kinh độ
    @Default(0.0) @JsonKey(name: 'y') double lat, // Vĩ độ
  }) = _LocationPoint;

  factory LocationPoint.fromJson(Map<String, dynamic> json) =>
      _$LocationPointFromJson(json);
}

// Model Tìm kiếm địa điểm (Geocoding)
@freezed
abstract class GeocodeResponse with _$GeocodeResponse {
  const factory GeocodeResponse({
    @Default([]) @JsonKey(name: 'candidates') List<GeocodeCandidate> candidates,
  }) = _GeocodeResponse;

  factory GeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodeResponseFromJson(json);
}

@freezed
abstract class GeocodeCandidate with _$GeocodeCandidate {
  const GeocodeCandidate._(); // using private constructor for custom getters
  const factory GeocodeCandidate({
    @Default('') @JsonKey(name: 'address') String address,
    @JsonKey(name: 'location') required LocationPoint location,
    @Default(0.0) @JsonKey(name: 'score') double score,
    @Default({}) @JsonKey(name: 'attributes') Map<String, dynamic> attributes,
    @JsonKey(name: 'extent') Map<String, dynamic>? extent, // zoom extent map
  }) = _GeocodeCandidate;

  factory GeocodeCandidate.fromJson(Map<String, dynamic> json) =>
      _$GeocodeCandidateFromJson(json);

  AddressResult toEntity() {
    // Parse đầy đủ các trường từ ArcGIS attributes theo cấu trúc địa chỉ Việt Nam
    final attrs = attributes;

    return AddressResult(
      // Thông tin cơ bản
      fullAddress: (attrs['LongLabel'] as String?) ?? address,
      lat: location.lat,
      lng: location.lng,
      score: score,

      // Chi tiết địa chỉ Việt Nam
      houseNumber: attrs['AddNum'] as String?, // Số nhà
      streetPrefix: attrs['StPreType'] as String?, // Đường/Phố/...
      streetName: attrs['StName'] as String?, // Tên đường
      ward: attrs['Nbrhd'] as String?, // Phường/Xã
      district: attrs['District'] as String?, // Quận/Huyện
      city: attrs['City'] as String?, // Thành phố
      province: attrs['Region'] as String?, // Tỉnh
      countryName: attrs['CntryName'] as String?, // Quốc gia
      postalCode: attrs['Postal'] as String?, // Mã bưu chính
      // Thông tin bổ sung
      placeName: attrs['PlaceName'] as String?, // Tên địa điểm
      placeType: attrs['Type'] as String?, // Loại địa điểm
      phoneNumber: attrs['Phone'] as String?, // Số điện thoại
      longLabel: attrs['LongLabel'] as String?, // Nhãn đầy đủ
      shortLabel: attrs['ShortLabel'] as String?, // Nhãn ngắn
    );
  }
}

// Model lấy thông tin địa chỉ từ tọa độ (Reverse Geocoding)
@freezed
abstract class ReverseGeocodeResponse with _$ReverseGeocodeResponse {
  const ReverseGeocodeResponse._();

  const factory ReverseGeocodeResponse({
    @JsonKey(name: 'address') required AddressInfo address,
    @JsonKey(name: 'location') required LocationPoint location,
  }) = _ReverseGeocodeResponse;

  factory ReverseGeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodeResponseFromJson(json);

  AddressResult toEntity() {
    return AddressResult(
      fullAddress: address.longLabel ?? address.fullAddress ?? 'Không xác định',
      lat: location.lat,
      lng: location.lng,
      score: 100.0, // Reverse geocode độ chính xác mặc định là 100
      // Chi tiết địa chỉ Việt Nam
      houseNumber: address.houseNumber,
      streetPrefix: address.streetPrefix,
      streetName: address.streetName,
      ward: address.ward,
      district: address.district,
      city: address.city,
      province: address.province,
      countryName: address.countryName,
      postalCode: address.postalCode,

      // Thông tin bổ sung
      placeName: address.placeName,
      longLabel: address.longLabel,
      shortLabel: address.shortLabel,
    );
  }
}

@freezed
abstract class AddressInfo with _$AddressInfo {
  const factory AddressInfo({
    // Thông tin cơ bản
    @JsonKey(name: 'Match_addr') String? fullAddress,
    @JsonKey(name: 'LongLabel') String? longLabel,
    @JsonKey(name: 'ShortLabel') String? shortLabel,

    // Chi tiết địa chỉ Việt Nam
    @JsonKey(name: 'AddNum') String? houseNumber, // Số nhà
    @JsonKey(name: 'StPreType') String? streetPrefix, // Đường/Phố
    @JsonKey(name: 'StName') String? streetName, // Tên đường
    @JsonKey(name: 'Nbrhd') String? ward, // Phường/Xã
    @JsonKey(name: 'District') String? district, // Quận/Huyện
    @JsonKey(name: 'City') String? city, // Thành phố
    @JsonKey(name: 'Region') String? province, // Tỉnh
    @JsonKey(name: 'CntryName') String? countryName, // Quốc gia
    @JsonKey(name: 'Postal') String? postalCode, // Mã bưu chính
    // Thông tin bổ sung
    @JsonKey(name: 'PlaceName') String? placeName, // Tên địa điểm
    @JsonKey(name: 'Type') String? placeType, // Loại địa điểm
  }) = _AddressInfo;

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);
}
