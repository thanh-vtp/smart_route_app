import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import '../../../../core/errors/failures.dart';

abstract class GeocodingRepository {
  /// Tìm kiếm địa chỉ dựa trên văn bản
  Future<Either<Failure, List<AddressResult>>> findAddressCandidates(
    String address,
  );

  /// Lấy địa chỉ dựa trên tọa độ (Nhấn trên map / Vị trí hiện tại)
  Future<Either<Failure, AddressResult>> reverseGeocode(double lat, double lng);
}
