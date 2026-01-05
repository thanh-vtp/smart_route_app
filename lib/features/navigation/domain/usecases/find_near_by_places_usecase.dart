import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/navigation/domain/entities/nearby_place.dart'
    as entities;
import 'package:smart_route_app/features/navigation/domain/repositories/geocoding_repository.dart';

/// Use case cho tìm các địa điểm gần vị trí
class FindNearbyPlacesUseCase {
  final GeocodingRepository _repository;

  FindNearbyPlacesUseCase(this._repository);

  Future<Either<Failure, List<entities.NearbyPlace>>> call(
    double latitude,
    double longitude, {
    String category = '',
    int maxLocations = 10,
    double searchRadius = 1000,
  }) async {
    if (latitude < -90 || latitude > 90) {
      return Left(ArcGISFailure.invalidCoordinates());
    }
    if (longitude < -180 || longitude > 180) {
      return Left(ArcGISFailure.invalidCoordinates());
    }
    if (maxLocations <= 0) {
      return Left(ValidationFailure.invalidInput('maxLocations'));
    }
    if (searchRadius <= 0) {
      return Left(ValidationFailure.invalidInput('searchRadius'));
    }

    final result = await _repository.findNearbyPlaces(
      latitude,
      longitude,
      category: category,
      maxLocations: maxLocations,
      searchRadius: searchRadius,
    );
    AppLogger.domain(
      'FindNearbyPlacesUseCase result: $result',
      useCase: 'FindNearbyPlacesUseCase',
    );
    return result;
  }
}
