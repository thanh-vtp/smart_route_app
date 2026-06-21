import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/common/constants/supabase.dart';
import 'package:smart_route_app/features/analytics/data/datasources/analytics_remote_data_source.dart';
import 'package:smart_route_app/features/analytics/data/datasources/analytics_remote_data_source_impl.dart';

part 'remote_datasource_providers.g.dart';

@Riverpod(keepAlive: true)
AnalyticsRemoteDataSource analyticsRemoteDataSource(
  AnalyticsRemoteDataSourceRef ref,
) {
  return AnalyticsRemoteDataSourceImpl(supabase);
}
