import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/incident/domain/usecases/add_incident_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/delete_incident_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/get_incident_detail_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/get_incidents_for_map_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/get_my_incidents_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/update_incident_usecase.dart';
import 'package:smart_route_app/features/incident/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

@Riverpod(keepAlive: true)
GetIncidentsForMapUsecase getIncidentsForMapUsecase(Ref ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return GetIncidentsForMapUsecase(repository);
}

@Riverpod(keepAlive: true)
GetIncidentDetailUsecase getIncidentDetailUsecase(Ref ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return GetIncidentDetailUsecase(repository);
}

@Riverpod(keepAlive: true)
GetMyIncidentsUsecase getMyIncidentsUsecase(Ref ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return GetMyIncidentsUsecase(repository);
}

@Riverpod(keepAlive: true)
AddIncidentUsecase addIncidentUsecase(Ref ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return AddIncidentUsecase(repository);
}

@Riverpod(keepAlive: true)
UpdateIncidentUsecase updateIncidentUsecase(Ref ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return UpdateIncidentUsecase(repository);
}

@Riverpod(keepAlive: true)
DeleteIncidentUsecase deleteIncidentUsecase(Ref ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return DeleteIncidentUsecase(repository);
}
