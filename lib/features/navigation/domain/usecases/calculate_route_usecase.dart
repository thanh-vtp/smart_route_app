import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/domain/repositories/routing_repository.dart';

// Use case cho tính toán lộ trình giữa nhiều điểm dừng
class CalculateRouteUseCase {
  final RoutingRepository _repository;

  CalculateRouteUseCase(this._repository);

  /// Gọi hàm để tính toán tuyến đường
  /// [stops]: Danh sách các điểm cần đi qua (ít nhất 2 điểm: Bắt đầu và Kết thúc)
  /// [avoidIncidents]: Mặc định = true. Tự động bẻ lái né các sự cố đang diễn ra.
  /// [impedanceAttribute]: Thuộc tính tối ưu ('TravelTime' hoặc 'Kilometers')
  Future<Either<Failure, RouteResult>> call({
    required List<RoutePoint> stops,
    bool avoidIncidents = true,
    String? impedanceAttribute,
  }) async {
    // 1. Kiểm tra số lượng điểm dừng (Bắt buộc phải có điểm Đi và điểm Đến)
    if (stops.length < 2) {
      return left(
        const ServerFailure(
          'Cần ít nhất 2 điểm (Bắt đầu và Kết thúc) để tìm đường.',
        ),
      );
    }

    // 2. Validate tính hợp lệ của hệ tọa độ WGS84
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

    // 3. Nếu dữ liệu chuẩn, chuyển xuống Tầng Repository để gọi API
    return await _repository.calculateRoute(
      stops: stops,
      avoidIncidents: avoidIncidents,
      impedanceAttribute: impedanceAttribute,
    );
  }
}
