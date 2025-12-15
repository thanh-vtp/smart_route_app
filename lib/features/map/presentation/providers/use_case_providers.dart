import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/map/domain/usecases/add_incident_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/delete_incident_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/get_incidents_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/update_incident_usecase.dart';
import 'package:smart_route_app/features/map/presentation/providers/repository_providers.dart';

part 'use_case_providers.g.dart';

@Riverpod(keepAlive: true)
GetIncidentsUsecase getIncidentsUsecase(GetIncidentsUsecaseRef ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return GetIncidentsUsecase(repository);
}

@Riverpod(keepAlive: true)
AddIncidentUsecase addIncidentUsecase(AddIncidentUsecaseRef ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return AddIncidentUsecase(repository);
}

@Riverpod(keepAlive: true)
UpdateIncidentUsecase updateIncidentUsecase(UpdateIncidentUsecaseRef ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return UpdateIncidentUsecase(repository);
}

@Riverpod(keepAlive: true)
DeleteIncidentUsecase deleteIncidentUsecase(DeleteIncidentUsecaseRef ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return DeleteIncidentUsecase(repository);
}
