import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/domain/repositories/routing_repository.dart';

/// UseCase để tính toán nhiều lộ trình thay thế
/// Trả về 1 route được đề xuất + các alternative routes
class CalculateAlternativeRoutesUseCase {
  final RoutingRepository _repository;

  CalculateAlternativeRoutesUseCase(this._repository);

  /// Tính toán nhiều lộ trình thay thế
  /// [stops]: Danh sách điểm đi qua (tối thiểu 2: bắt đầu và kết thúc)
  ///
  /// Trả về:
  /// - recommendedRoute: Lộ trình được đề xuất (cân bằng, tránh sự cố)
  /// - alternatives: Các lộ trình thay thế (nhanh nhất, ngắn nhất)
  Future<Either<Failure, AlternativeRoutesResult>> call({
    required List<RoutePoint> stops,
  }) async {
    // 1. Kiểm tra số lượng điểm dừng
    if (stops.length < 2) {
      return left(
        const ServerFailure(
          'Cần ít nhất 2 điểm (Bắt đầu và Kết thúc) để tìm đường.',
        ),
      );
    }

    // 2. Validate tọa độ WGS84
    for (int i = 0; i < stops.length; i++) {
      final point = stops[i];
      if (point.lat < -90 ||
          point.lat > 90 ||
          point.lng < -180 ||
          point.lng > 180) {
        return left(
          ServerFailure('Tọa độ điểm thứ ${i + 1} không hợp lệ trên bản đồ.'),
        );
      }
    }

    // 3. Gọi Repository để tính toán
    return await _repository.calculateAlternativeRoutes(stops: stops);
  }
}
