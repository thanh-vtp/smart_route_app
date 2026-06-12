import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/network/network_info.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';
import 'package:smart_route_app/features/navigation/data/datasources/routing_remote_data_source.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/domain/repositories/routing_repository.dart';

class RoutingRepositoryImpl implements RoutingRepository {
  final RoutingRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final IncidentRepository _incidentRepository;

  RoutingRepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
    this._incidentRepository,
  );

  @override
  Future<Either<Failure, RouteResult>> calculateRoute({
    required List<RoutePoint> stops,
    bool avoidIncidents = true,
    String? impedanceAttribute,
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

      // 3. Lấy danh sách incidents để né (nếu avoidIncidents = true)
      List<Map<String, double>>? barriers;

      if (avoidIncidents) {
        final incidentsResult = await _incidentRepository.getIncidentsForMap();

        incidentsResult.fold(
          (failure) {
            AppLogger.data(
              '⚠️ Failed to fetch incidents: $failure',
              source: 'RoutingRepository',
            );
            // Không throw error, chỉ log warning và tiếp tục không có barriers
          },
          (incidents) {
            // Lọc chỉ incidents active với severity high/medium
            final activeIncidents = incidents.where((incident) {
              return incident.status == 'active' &&
                  (incident.severity == 'high' ||
                      incident.severity == 'medium');
            }).toList();

            if (activeIncidents.isNotEmpty) {
              barriers = activeIncidents.map((incident) {
                return {'lat': incident.lat, 'lng': incident.lng};
              }).toList();

              AppLogger.data(
                '🚧 Found ${barriers!.length} active high/medium incidents to avoid',
                source: 'RoutingRepository',
              );
            } else {
              AppLogger.data(
                'No active high/medium incidents found',
                source: 'RoutingRepository',
              );
            }
          },
        );
      }

      // 4. Gọi API lấy Model
      final responseModel = await _remoteDataSource.solveRoute(
        stops: stopsParam,
        barriers: barriers,
        impedanceAttribute: impedanceAttribute,
      );

      // 5. Nếu không có tuyến đường nào được trả về
      if (responseModel.routes.features.isEmpty) {
        return left(
          const ServerFailure('Không thể tìm thấy tuyến đường hợp lệ.'),
        );
      }

      // 6. Chuyển Model -> Entity và trả về UI
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

  @override
  Future<Either<Failure, AlternativeRoutesResult>> calculateAlternativeRoutes({
    required List<RoutePoint> stops,
  }) async {
    // 1. Kiểm tra mạng
    if (!await _networkInfo.isConnected) {
      return left(
        const NetworkFailure('Không có kết nối mạng. Không thể tìm đường.'),
      );
    }

    try {
      // 2. Tính toán 3 routes song song với strategies khác nhau
      AppLogger.data(
        '🔄 Calculating alternative routes for ${stops.length} stops...',
        source: 'RoutingRepository',
      );

      final results = await Future.wait([
        // Route 1: Balanced (Default - Tránh sự cố, tối ưu thời gian)
        calculateRoute(
          stops: stops,
          avoidIncidents: true,
          impedanceAttribute: RouteStrategy.balanced.impedanceAttribute,
        ),

        // Route 2: Fastest (Nhanh nhất - Không tránh sự cố)
        calculateRoute(
          stops: stops,
          avoidIncidents: false,
          impedanceAttribute: RouteStrategy.fastest.impedanceAttribute,
        ),

        // Route 3: Shortest (Ngắn nhất - Tối ưu quãng đường)
        // NOTE: Không dùng Kilometers impedance vì API không trả về totalTravelTime
        // Dùng TravelTime nhưng sort theo distance
        calculateRoute(
          stops: stops,
          avoidIncidents: false,
          impedanceAttribute: RouteStrategy.fastest.impedanceAttribute,
        ),
      ]);

      // 3. Xử lý kết quả
      final balancedResult = results[0];
      final fastestResult = results[1];
      final shortestResult = results[2];

      AppLogger.data(
        '✅ Alternative routes API calls completed',
        source: 'RoutingRepository',
      );

      AppLogger.debugRaw(
        'Results: Balanced=${balancedResult.isRight()}, '
        'Fastest=${fastestResult.isRight()}, '
        'Shortest=${shortestResult.isRight()}',
        source: 'RoutingRepository',
      );

      // 4. Nếu route chính (balanced) fail thì return error
      if (balancedResult.isLeft()) {
        return balancedResult.fold(
          (failure) => left(failure),
          (_) => left(const ServerFailure('Unexpected error')),
        );
      }

      final recommendedRoute = balancedResult.getOrElse(
        (_) => throw const ServerFailure('Cannot get recommended route'),
      );

      // 5. Tạo danh sách alternatives
      final alternatives = <RouteAlternative>[];

      AppLogger.debugRaw(
        'Building alternatives list...',
        source: 'RoutingRepository',
      );

      // Thêm fastest route nếu khác biệt đáng kể
      fastestResult.fold(
        (_) {}, // Ignore error
        (route) {
          if (_isDifferentRoute(recommendedRoute, route)) {
            alternatives.add(
              RouteAlternative(strategy: RouteStrategy.fastest, route: route),
            );
            AppLogger.data(
              'Added FASTEST: ${route.formattedTime}, ${route.formattedDistance}',
              source: 'RoutingRepository',
            );
          } else {
            AppLogger.debugRaw(
              'Skipped FASTEST (too similar)',
              source: 'RoutingRepository',
            );
          }
        },
      );

      // Thêm shortest route nếu khác biệt đáng kể
      shortestResult.fold(
        (_) {}, // Ignore error
        (route) {
          if (_isDifferentRoute(recommendedRoute, route)) {
            alternatives.add(
              RouteAlternative(strategy: RouteStrategy.shortest, route: route),
            );
            AppLogger.data(
              'Added SHORTEST: ${route.formattedTime}, ${route.formattedDistance}',
              source: 'RoutingRepository',
            );
          } else {
            AppLogger.debugRaw(
              'Skipped SHORTEST (too similar)',
              source: 'RoutingRepository',
            );
          }
        },
      );

      // 6. Trả về kết quả
      final result = AlternativeRoutesResult(
        recommendedRoute: recommendedRoute,
        alternatives: alternatives,
      );

      AppLogger.data(
        '✅ Alternative routes result: '
        'Recommended(${recommendedRoute.formattedTime}), '
        'Alternatives=${alternatives.length}',
        source: 'RoutingRepository',
      );

      return Right(result);
    } on Failure catch (f) {
      return left(f);
    } catch (e, st) {
      AppLogger.error(
        'Lỗi khi tính alternative routes: $e',
        name: 'RoutingRepositoryImpl',
        error: e,
        stackTrace: st,
      );

      return left(
        const ServerFailure('Lỗi máy chủ khi tính toán các lộ trình thay thế.'),
      );
    }
  }

  // Helper: Kiểm tra 2 route có khác biệt đáng kể không
  bool _isDifferentRoute(RouteResult route1, RouteResult route2) {
    final timeDiff = (route1.totalTimeMinutes - route2.totalTimeMinutes).abs();
    final distDiff = (route1.totalDistanceMeters - route2.totalDistanceMeters)
        .abs();

    // Khác biệt >= 2 phút hoặc >= 500m
    return timeDiff >= 2.0 || distDiff >= 500;
  }
}
