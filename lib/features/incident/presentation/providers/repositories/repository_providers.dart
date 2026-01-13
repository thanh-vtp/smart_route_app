import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/network/providers/network_info_providers.dart';
import 'package:smart_route_app/features/incident/data/repositories/incident_repository_impl.dart';
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';
import 'package:smart_route_app/features/incident/presentation/providers/data/local_datasource_providers.dart';
import 'package:smart_route_app/features/incident/presentation/providers/data/remote_datasource_providers.dart';
part 'repository_providers.g.dart';

/// Provider cho Incident Repository
/// Điều phối giữa ArcGIS (GET) và Supabase (ADD/DELETE)
@Riverpod(keepAlive: true)
IncidentRepository incidentRepository(IncidentRepositoryRef ref) {
  final arcgisDataSource = ref.watch(arcgisRemoteDataSourceProvider);
  final supabaseDataSource = ref.watch(supabaseRemoteDataSourceProvider);
  final incidentLocalDataSource = ref.watch(incidentLocalDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return IncidentRepositoryImpl(
    arcgisDataSource,
    supabaseDataSource,
    incidentLocalDataSource,
    networkInfo,
  );
}
