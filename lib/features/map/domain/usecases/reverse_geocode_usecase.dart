// import 'package:fpdart/fpdart.dart';
// import 'package:smart_route_app/core/errors/failures.dart';
// import 'package:smart_route_app/features/map/domain/entities/address_result.dart'
//     as entities;
// import 'package:smart_route_app/features/map/domain/repositories/geocoding_repository.dart';

// // Use case cho thông tin vị trí
// class ReverseGeocodeUseCase {
//   final GeocodingRepository _repository;

//   ReverseGeocodeUseCase(this._repository);

//   Future<Either<Failure, entities.AddressResult>> call(
//     double latitude,
//     double longitude,
//   ) async {
//     if (latitude < -90 || latitude > 90) {
//       return left(ArcGISFailure.invalidCoordinates());
//     }
//     if (longitude < -180 || longitude > 180) {
//       return left(ArcGISFailure.invalidCoordinates());
//     }
//     return await _repository.reverseGeocode(latitude, longitude);
//   }
// }
