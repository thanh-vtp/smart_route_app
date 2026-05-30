import 'package:smart_route_app/core/common/data/models/geocoding_models.dart';

/// Abstract data source for ArcGIS Geocoding services
/// Defines the contract for all ArcGIS geocoding operations
abstract class ArcGISGeocodingRemoteDataSource {
  /// Tìm kiếm địa chỉ từ chuỗi văn bản (thanh Search)
  Future<GeocodeResponse> findAddressCandidates(String address);

  /// Lấy thông tin địa chỉ từ tọa độ (lấy vị trí hiện tại)
  Future<ReverseGeocodeResponse> reverseGeocode(double lat, double lng);
}
