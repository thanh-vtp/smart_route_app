import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/analytics/domain/entities/analytics_data.dart';

abstract class AnalyticsRepository {
  /// Lấy thống kê của User và trả về Entity
  Future<Either<Failure, AnalyticsData>> getUserAnalytics({
    required String userId,
    required String timeRange,
  });
}
