import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/analytics/domain/entities/analytics_data.dart';
import 'package:smart_route_app/features/analytics/domain/repositories/analytics_repository.dart';

class GetAnalyticsUsecase {
  final AnalyticsRepository repository;
  GetAnalyticsUsecase(this.repository);

  Future<Either<Failure, AnalyticsData>> call(String userId, String timeRange) {
    return repository.getUserAnalytics(userId: userId, timeRange: timeRange);
  }
}
