import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/analytics/data/repositories/analytics_repository_impl.dart';
import 'package:smart_route_app/features/analytics/domain/repositories/analytics_repository.dart';
import 'package:smart_route_app/features/analytics/presentation/providers/data/remote_datasource_providers.dart';
part 'repository_providers.g.dart';


@Riverpod(keepAlive: true)
AnalyticsRepository analyticsRepository(AnalyticsRepositoryRef ref) {
  final remoteDataSource = ref.watch(analyticsRemoteDataSourceProvider);
  return AnalyticsRepositoryImpl(remoteDataSource);
}
