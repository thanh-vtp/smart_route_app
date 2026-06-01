import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/network/network_info.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/navigation/data/datasources/routing_remote_data_source.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/domain/repositories/routing_repository.dart';

class RoutingRepositoryImpl implements RoutingRepository {
  final RoutingRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RoutingRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, RouteResult>> calculateRoute({
    required List<RoutePoint> stops,
    bool avoidIncidents = true,
  }) async {
    // 1. Kiểm tra mạng
    if (!await _networkInfo.isConnected) {
      return left(
        const NetworkFailure('Không có kết nối mạng. Không thể tìm đường.'),
      );
    }

    try {
      // 2. Chuyển List<RoutePoint> sang định dạng Map mà DataSource cần
      final List<Map<String, double>> stopsParam = stops.map((point) {
        return {'lat': point.lat, 'lng': point.lng};
      }).toList();

      // 3. Gọi API lấy Model
      final responseModel = await _remoteDataSource.solveRoute(
        stops: stopsParam,
        avoidIncidents: avoidIncidents,
      );

      // 4. Nếu không có tuyến đường nào được trả về
      if (responseModel.routes.features.isEmpty) {
        return left(
          const ServerFailure('Không thể tìm thấy tuyến đường hợp lệ.'),
        );
      }

      // 5. Chuyển Model -> Entity và trả về UI
      final resultEntity = responseModel.toEntity();

      return Right(resultEntity);
    } on Failure catch (f) {
      return left(f);
    } catch (e, st) {
      AppLogger.error(
        'Lỗi không xác định trong RoutingRepositoryImpl: $e',
        name: 'RoutingRepositoryImpl',
        error: e,
        stackTrace: st,
      );

      return left(const ServerFailure('Lỗi máy chủ khi tính toán đường đi.'));
    }
  }
}
