import 'package:smart_route_app/features/search/data/models/geocoding_models.dart';

/// Abstract data source for ArcGIS Geocoding services
/// Defines the contract for all ArcGIS geocoding operations
abstract class ArcGISGeocodingRemoteDataSource {
  /// Mã hóa địa lý địa chỉ : Chuyển đổi văn bản địa chỉ hoặc tên địa điểm thành địa chỉ đầy đủ kèm theo vị trí.
  Future<GeocodeResponse> findAddressCandidates(String address);

  /// Chuyển đổi tọa độ ngược : Chuyển đổi một điểm thành địa chỉ hoặc vị trí đầy đủ
  Future<ReverseGeocodeResponse> reverseGeocode(
    double latitude,
    double longitude,
  );
}
