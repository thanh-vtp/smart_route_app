import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/navigation/domain/entities/location_imagery.dart'
    as entities;
import 'package:smart_route_app/features/navigation/domain/repositories/geocoding_repository.dart';

/// Use case cho lấy hình ảnh vệ tinh tại vị trí
class GetLocationImageryUseCase {
  final GeocodingRepository _repository;

  GetLocationImageryUseCase(this._repository);

  Future<Either<Failure, entities.LocationImagery>> call(
    double latitude,
    double longitude, {
    int width = 400,
    int height = 400,
    int zoomLevel = 20,
  }) async {
    AppLogger.domain(
      'GetLocationImageryUseCase called with lat: $latitude, lon: $longitude, size: ${width}x$height, zoom: $zoomLevel',
      useCase: 'GetLocationImageryUseCase',
    );

    if (latitude < -90 || latitude > 90) {
      AppLogger.domain(
        'Invalid latitude: $latitude',
        useCase: 'GetLocationImageryUseCase',
      );
      return Left(ArcGISFailure.invalidCoordinates());
    }
    if (longitude < -180 || longitude > 180) {
      AppLogger.domain(
        'Invalid longitude: $longitude',
        useCase: 'GetLocationImageryUseCase',
      );
      return Left(ArcGISFailure.invalidCoordinates());
    }
    if (width <= 0 || height <= 0) {
      AppLogger.domain(
        'Invalid size: ${width}x$height',
        useCase: 'GetLocationImageryUseCase',
      );
      return Left(ValidationFailure.invalidInput('image size'));
    }
    if (zoomLevel < 1 || zoomLevel > 20) {
      AppLogger.domain(
        'Invalid zoom level: $zoomLevel',
        useCase: 'GetLocationImageryUseCase',
      );
      return Left(ValidationFailure.invalidInput('zoom level'));
    }

    AppLogger.domain(
      'Calling repository.getLocationImagery...',
      useCase: 'GetLocationImageryUseCase',
    );
    final result = await _repository.getLocationImagery(
      latitude,
      longitude,
      width: width,
      height: height,
      zoomLevel: zoomLevel,
    );

    // AppLogger.domain(
    //   'GetLocationImageryUseCase result: $result',
    //   useCase: 'GetLocationImageryUseCase',
    // );
    return result;
  }
}
