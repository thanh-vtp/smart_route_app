import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/map/domain/usecases/add_incident_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/get_incidents_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/update_incident_usecase.dart';
import 'package:smart_route_app/features/map/presentation/providers/repository_providers.dart';

part 'use_case_providers.g.dart';

@Riverpod(keepAlive: true)
GetIncidentsUsecase getIncidentsUsecase(GetIncidentsUsecaseRef ref) {
  // Cung cấp usecase, lấy repository từ provider trên
  final repository = ref.watch(incidentRepositoryProvider);
  return GetIncidentsUsecase(repository);
}

@Riverpod(keepAlive: true)
AddIncidentUsecase addIncidentUsecase(AddIncidentUsecaseRef ref) {
  // Cung cấp usecase để thêm incident mới
  final repository = ref.watch(incidentRepositoryProvider);
  return AddIncidentUsecase(repository);
}

@Riverpod(keepAlive: true)
UpdateIncidentUsecase updateIncidentUsecase(UpdateIncidentUsecaseRef ref) {
  // Cung cấp usecase để cập nhật incident
  final repository = ref.watch(incidentRepositoryProvider);
  return UpdateIncidentUsecase(repository);
}
