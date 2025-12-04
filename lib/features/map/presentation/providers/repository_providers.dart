import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/map/data/repositories/incident_repository_impl.dart';
import 'package:smart_route_app/features/map/domain/repositories/incident_repository.dart';
import 'package:smart_route_app/features/map/presentation/providers/remote_datasource_providers.dart';

part 'repository_providers.g.dart';

/// Provider cho Incident Repository
/// Điều phối giữa ArcGIS (GET) và Supabase (ADD/DELETE)
@Riverpod(keepAlive: true)
IncidentRepository incidentRepository(IncidentRepositoryRef ref) {
  final arcgisDataSource = ref.watch(arcgisRemoteDataSourceProvider);
  final supabaseDataSource = ref.watch(supabaseRemoteDataSourceProvider);
  return IncidentRepositoryImpl(arcgisDataSource, supabaseDataSource);
}
