import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/search/domain/repositories/geocoding_repository.dart';

class ReverseGeocodeUseCase {
  final GeocodingRepository _repository;

  ReverseGeocodeUseCase(this._repository);

  Future<Either<Failure, AddressResult>> call(
    double latitude,
    double longitude,
  ) async {
    if (latitude < -90 || latitude > 90) {
      return left(ArcGISFailure.invalidCoordinates());
    }
    if (longitude < -180 || longitude > 180) {
      return left(ArcGISFailure.invalidCoordinates());
    }
    return await _repository.reverseGeocode(latitude, longitude);
  }
}
