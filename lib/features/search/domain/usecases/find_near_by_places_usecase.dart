import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/search/domain/entities/nearby_place.dart';
import 'package:smart_route_app/features/search/domain/repositories/nearby_place_repository.dart';

class FindNearbyParams {
  final double latitude;
  final double longitude;
  final int maxLocations;
  final double radius;

  const FindNearbyParams({
    required this.latitude,
    required this.longitude,
    this.maxLocations = 10,
    this.radius = 1000,
  });
}

/// Use case cho tìm các địa điểm gần vị trí
class FindNearbyPlacesUseCase {
  final NearbyPlaceRepository _repository;

  FindNearbyPlacesUseCase(this._repository);

  Future<Either<Failure, List<NearbyPlace>>> call(
    FindNearbyParams params,
  ) async {
    if (params.latitude < -90 || params.latitude > 90) {
      return Left(ArcGISFailure.invalidCoordinates());
    }
    if (params.longitude < -180 || params.longitude > 180) {
      return Left(ArcGISFailure.invalidCoordinates());
    }
    if (params.maxLocations <= 0) {
      return Left(ValidationFailure.invalidInput('maxLocations'));
    }
    if (params.radius <= 0) {
      return Left(ValidationFailure.invalidInput('searchRadius'));
    }

    final result = await _repository.findNearbyPlaces(
      params.latitude,
      params.longitude,
      maxLocations: params.maxLocations,
      searchRadius: params.radius,
    );
    AppLogger.domain(
      'FindNearbyPlacesUseCase result: $result',
      useCase: 'FindNearbyPlacesUseCase',
    );

    return result;
  }
}
