import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/network/network_info.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/search/data/datasources/arcgis_exception_handler.dart';
import 'package:smart_route_app/features/search/data/datasources/arcgis_image_remote_data_source_impl.dart';
import 'package:smart_route_app/features/search/data/local_datasource/imagery_local_data_source.dart';
import 'package:smart_route_app/features/search/data/models/imagery_models.dart';
import 'package:smart_route_app/features/search/domain/entities/location_imagery.dart';
import 'package:smart_route_app/features/search/domain/repositories/imagery_repository.dart';

class ImageryRepositoryImpl implements ImageryRepository {
  final ArcGISImageRemoteDataSource _arcGISImageRemoteDataSource;

  final ImageryLocalDataSource _imageryLocalSource; // File System

  final NetworkInfo _networkInfo;

  ImageryRepositoryImpl(
    this._arcGISImageRemoteDataSource,
    this._imageryLocalSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, LocationImagery>> getLocationImagery(
    double latitude,
    double longitude, {
    int width = 400,
    int height = 400,
    int zoomLevel = 15,
  }) async {
    AppLogger.repository(
      'Repository.getLocationImagery called with lat: $latitude, lon: $longitude',
    );
    final key =
        'img_${latitude.toStringAsFixed(4)}_${longitude.toStringAsFixed(4)}_$zoomLevel';

    final bool isConnected = await _networkInfo.isConnected;

    // 1. Ưu tiên đọc từ ROM (File System) - Không cần check mạng
    final cachedBytes = await _imageryLocalSource.getImage(
      key,
      const Duration(days: 30),
    );
    if (cachedBytes != null) {
      AppLogger.repository('CACHE HIT: Satellite Image from ROM');
      return right(
        LocationImagery(
          imageData: cachedBytes,
          latitude: latitude,
          longitude: longitude,
          description: "Cached Imagery",
        ),
      );
    }

    if (!isConnected) {
      return left(NetworkFailure.noInternet());
    }

    try {
      AppLogger.repository('Calling dataSource.getSatelliteImage...');
      final imageData = await _arcGISImageRemoteDataSource.getSatelliteImage(
        latitude,
        longitude,
        width: width,
        height: height,
        level: zoomLevel,
      );
      AppLogger.repository('Got image data: ${imageData.length} bytes');

      // Lấy thêm metadata nếu cần (optional - không block nếu fail)
      AppLogger.repository('Getting imagery metadata...');

      ImageryMetadataResponse metadata;
      try {
        metadata = await _arcGISImageRemoteDataSource.getImageryMetadata(
          latitude,
          longitude,
        );
        AppLogger.repository('Got metadata: ${metadata.description}');
      } catch (metadataError) {
        AppLogger.error(
          'Failed to get metadata (continuing without): $metadataError',
          name: 'RoutingRepositoryImpl',
        );
        metadata = const ImageryMetadataResponse();
      }

      // Cache ảnh vào ROM
      await _imageryLocalSource.saveImage(key, imageData);

      final result = LocationImagery(
        imageData: imageData,
        description: metadata.description,
        copyrightText: metadata.copyrightText,
        latitude: latitude,
        longitude: longitude,
      );

      AppLogger.repository('Repository returning success');
      return right(result);
    } catch (e, st) {
      AppLogger.error(
        'Repository error: $e',
        name: 'RoutingRepositoryImpl',
        error: e,
        stackTrace: st,
      );
      final failure = ArcGISExceptionHandler.handleException(e, st);
      return left(failure);
    }
  }
}
