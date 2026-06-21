import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/search/domain/repositories/geocoding_repository.dart';

class ReverseGeocodeUseCase {
  final GeocodingRepository _repository;

  ReverseGeocodeUseCase(this._repository);

  Future<Either<Failure, AddressResult>> call(double lat, double lng) async {
    // Vĩ độ (lat): Chỉ chạy từ -90 (Cực Nam) đến +90 (Cực Bắc).
    // Kinh độ (lng): Chỉ chạy từ -180 (Cực Tây) đến +180 (Cực Đông).
    if (lat < -90 || lat > 90) {
      return left(ServerFailure('Vĩ độ phải nằm trong khoảng -90 đến 90'));
    }
    if (lng < -180 || lng > 180) {
      return left(ServerFailure('Kinh độ phải nằm trong khoảng -180 đến 180'));
    }
    return await _repository.reverseGeocode(lat, lng);
  }
}
