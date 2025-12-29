import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/map/domain/entities/address_result.dart'
    as entities;
import 'package:smart_route_app/features/map/domain/repositories/geocoding_repository.dart';

// Use case cho tìm địa chỉ
class GeocodeAddressUseCase {
  final GeocodingRepository _repository;

  GeocodeAddressUseCase(this._repository);

  Future<Either<Failure, List<entities.AddressResult>>> call(
    String address,
  ) async {
    if (address.trim().isEmpty) {
      return left(ValidationFailure.invalidInput('address'));
    }
    return await _repository.geocodeAddress(address);
  }
}
