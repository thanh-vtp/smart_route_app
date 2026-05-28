import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/usecases/get_incidents_usecase.dart';
import 'package:smart_route_app/features/incident/presentation/providers/usecases/use_case_providers.dart';

final incidentsProvider = NotifierProvider<IncidentsNotifier, IncidentsState>(
  IncidentsNotifier.new,
);

class IncidentsNotifier extends Notifier<IncidentsState> {
  late final GetIncidentsUsecase _getIncidentsUsecase;

  @override
  IncidentsState build() {
    _getIncidentsUsecase = ref.read(getIncidentsUsecaseProvider);

    return IncidentsState.initial();
  }

  Future<void> fetchIncidents() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final incidents =
          await _getIncidentsUsecase(
            const GetIncidentsParams(
              source: IncidentDataSourceType.arcGIS,
              userUid: '',
            ),
          ).then(
            (result) => result.fold(
              (failure) => throw failure,
              (incidents) => incidents,
            ),
          );

      state = state.copyWith(isLoading: false, incidents: incidents);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void upsertIncident(Incident incident) {
    final list = [...state.incidents];

    final index = list.indexWhere((e) => e.id == incident.id);

    if (index >= 0) {
      list[index] = incident;
    } else {
      list.add(incident);
    }

    state = state.copyWith(incidents: list);
  }

  void removeIncident(String id) {
    state = state.copyWith(
      incidents: state.incidents.where((e) => e.id != id).toList(),
    );
  }
}

class IncidentsState {
  final bool isLoading;

  final List<Incident> incidents;

  final String? error;

  const IncidentsState({
    required this.isLoading,
    required this.incidents,
    this.error,
  });

  factory IncidentsState.initial() {
    return const IncidentsState(isLoading: false, incidents: []);
  }

  IncidentsState copyWith({
    bool? isLoading,
    List<Incident>? incidents,
    String? error,
  }) {
    return IncidentsState(
      isLoading: isLoading ?? this.isLoading,
      incidents: incidents ?? this.incidents,
      error: error,
    );
  }
}
