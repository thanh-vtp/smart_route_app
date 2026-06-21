import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/search/domain/repositories/geocoding_repository.dart';

class GeocodeAddressUseCase {
  final GeocodingRepository _repository;

  GeocodeAddressUseCase(this._repository);

  Future<Either<Failure, List<AddressResult>>> call(String address) async {
    if (address.trim().isEmpty) {
      return left(ServerFailure('Địa chỉ không được để trống'));
    }
    return await _repository.findAddressCandidates(address);
  }
}
