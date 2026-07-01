import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/analytics/domain/usecases/get_analytics_usecase.dart';
import 'package:smart_route_app/features/analytics/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

@Riverpod(keepAlive: true)
GetAnalyticsUsecase getAnalyticsUsecase(Ref ref) {
  final repository = ref.watch(analyticsRepositoryProvider);
  return GetAnalyticsUsecase(repository);
}
