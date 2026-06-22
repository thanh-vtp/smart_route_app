import 'package:smart_route_app/features/search/data/models/geocoding_models.dart';

/// Abstract data source for ArcGIS Geocoding services
/// Defines the contract for all ArcGIS geocoding operations
abstract class ArcGISGeocodingRemoteDataSource {
  /// Tìm kiếm địa chỉ từ chuỗi văn bản (thanh Search)
  Future<GeocodeResponse> findAddressCandidates(String address);

  /// Tìm kiếm địa chỉ nâng cao với các trường riêng biệt
  /// Phù hợp cho tìm kiếm cấu trúc địa chỉ Việt Nam
  Future<GeocodeResponse> findAddressCandidatesStructured({
    String? houseNumber, // Số nhà
    String? street, // Tên đường (có thể bao gồm cả tiền tố như "Đường", "Phố")
    String? ward, // Phường/Xã
    String? district, // Quận/Huyện
    String? city, // Thành phố/Thị xã
    String? province, // Tỉnh
    String? postalCode, // Mã bưu chính
  });

  /// Lấy thông tin địa chỉ từ tọa độ (lấy vị trí hiện tại)
  Future<ReverseGeocodeResponse> reverseGeocode(double lat, double lng);
}
