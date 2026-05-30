import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/resources/lib/supabase.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/usecases/get_incidents_for_map_usecase.dart';
import 'package:smart_route_app/features/incident/presentation/providers/usecases/use_case_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final incidentsProvider = NotifierProvider<IncidentsNotifier, IncidentsState>(
  IncidentsNotifier.new,
);

class IncidentsNotifier extends Notifier<IncidentsState> {
  late final GetIncidentsForMapUsecase _getIncidentsUsecase;
  RealtimeChannel? _channel;

  @override
  IncidentsState build() {
    _getIncidentsUsecase = ref.read(getIncidentsForMapUsecaseProvider);

    ref.onDispose(() {
      if (_channel != null) {
        supabase.removeChannel(_channel!);
      }
    });

    return IncidentsState.initial();
  }

  Future<void> fetchIncidents() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final incidents = await _getIncidentsUsecase().then(
        (result) =>
            result.fold((failure) => throw failure, (incidents) => incidents),
      );

      // Lấy incidents đang active và fake để render trên map, tránh render quá nhiều
      final activeIncidents = incidents
          .where((i) => i.status == 'active' || i.status == 'fake')
          .toList();

      state = state.copyWith(isLoading: false, incidents: activeIncidents);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void upsertIncident(Incident incident) {
    if (incident.status != 'active') {
      removeIncident(incident.id);
      return;
    }

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

  void listenToRealtimeUpdates() {
    // Tránh subscribe nhiều lần
    if (_channel != null) return;

    _channel = supabase
        .channel('public:incidents')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'incidents',
          callback: (payload) async {
            AppLogger.data(
              'Realtime received: ${payload.eventType}',
              source: 'IncidentsNotifier',
            );

            // Chờ ArcGIS sync xong
            await Future.delayed(const Duration(seconds: 2));

            await fetchIncidents();
          },
        )
        .subscribe();
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
