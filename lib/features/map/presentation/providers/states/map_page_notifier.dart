import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/utils/utils.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';
import 'package:smart_route_app/features/map/domain/usecases/add_incident_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/delete_incident_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/get_incidents_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/update_incident_usecase.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/map_page_state.dart';
import 'package:smart_route_app/features/map/presentation/providers/use_case_providers.dart';

class MapPageNotifier extends Notifier<MapPageState> {
  late final GetIncidentsUsecase _getIncidentsUsecase;
  late final AddIncidentUsecase _addIncidentUsecase;
  late final UpdateIncidentUsecase _updateIncidentUsecase;
  late final DeleteIncidentUsecase _deleteIncidentUsecase;

  @override
  MapPageState build() {
    _getIncidentsUsecase = ref.read(getIncidentsUsecaseProvider);
    _addIncidentUsecase = ref.read(addIncidentUsecaseProvider);
    _updateIncidentUsecase = ref.read(updateIncidentUsecaseProvider);
    _deleteIncidentUsecase = ref.read(deleteIncidentUsecaseProvider);
    return const MapPageState.initial();
  }

  Future<void> fetchIncidents() async {
    AppLogger.ui('User requested to fetch incidents on the map');

    // 1. Lấy danh sách incidents hiện tại (để backup)
    final currentIncidents = state.maybeWhen(
      loaded: (incidents, _) => incidents,
      submitted: (incidents) => incidents,
      orElse: () => <Incident>[], // List rỗng nếu chưa có gì
    );

    // Chỉ show loading lần đầu tiên. Nếu đã có data thì không show loading che map
    if (currentIncidents.isEmpty) {
      state = const MapPageState.loading();
    }

    final result = await _getIncidentsUsecase.call(userUid: '');

    result.fold(
      (failure) {
        AppLogger.ui('Failed to fetch incidents', error: failure);
        state = MapPageState.loaded(
          incidents: currentIncidents,
          failure: failure,
        ); // State chỉ chứa Failure object
      },
      (incidents) {
        AppLogger.ui('Successfully fetched ${incidents.length} incidents');
        state = MapPageState.loaded(incidents: incidents, failure: null);
      },
    );
  }

  /// Thêm incident mới và cập nhật UI
  /// [incident] - Incident cần thêm
  /// [currentUser] - User hiện tại đang đăng nhập
  Future<bool> addIncident(Incident incident, AppUser currentUser) async {
    AppLogger.ui(
      'User ${currentUser.email} attempting to add incident: ${incident.type}',
    );

    // Lấy danh sách incidents hiện tại
    final currentIncidents = state.maybeWhen(
      loaded: (incidents, _) => incidents,
      submitted: (incidents) => incidents,
      orElse: () => <Incident>[],
    );

    // Set state submitting với danh sách hiện tại
    state = MapPageState.submitting(incidents: currentIncidents);

    // Gọi usecase để thêm incident
    final result = await _addIncidentUsecase.call(incident, currentUser);

    return result.fold(
      (failure) {
        AppLogger.ui('Failed to add incident', error: failure);
        // Trả về state error
        state = MapPageState.error(failure: failure);
        return false;
      },
      (_) async {
        AppLogger.ui('Incident added successfully, refreshing list...');

        // Refresh danh sách incidents sau khi thêm thành công
        final refreshResult = await _getIncidentsUsecase.call(
          userUid: currentUser.uid,
        );

        refreshResult.fold(
          (failure) {
            AppLogger.ui(
              'Failed to refresh incidents after adding',
              error: failure,
            );
            // Vẫn giữ state submitted với danh sách cũ + incident mới
            state = MapPageState.submitted(
              incidents: [...currentIncidents, incident],
            );
          },
          (incidents) {
            AppLogger.ui('Refreshed incidents: ${incidents.length} total');
            // Cập nhật với danh sách mới từ server
            state = MapPageState.submitted(incidents: incidents);
          },
        );

        return true;
      },
    );
  }

  /// Cập nhật incident
  Future<bool> updateIncident(Incident incident, AppUser currentUser) async {
    AppLogger.ui('User ${currentUser.email} updating incident: ${incident.id}');

    final currentIncidents = state.maybeWhen(
      loaded: (incidents, _) => incidents,
      submitted: (incidents) => incidents,
      orElse: () => <Incident>[],
    );

    state = MapPageState.submitting(incidents: currentIncidents);

    final result = await _updateIncidentUsecase.call(
      incident: incident,
      currentUser: currentUser,
    );

    return result.fold(
      (failure) {
        AppLogger.ui('Failed to update incident', error: failure);
        state = MapPageState.loaded(
          incidents: currentIncidents,
          failure: failure,
        );
        return false;
      },
      (_) async {
        AppLogger.ui('Incident updated successfully, refreshing list...');
        await _refreshIncidents(currentUser, currentIncidents);
        return true;
      },
    );
  }

  /// Xóa incident
  Future<bool> deleteIncident(String incidentId, AppUser currentUser) async {
    AppLogger.ui('User ${currentUser.email} deleting incident: $incidentId');

    final currentIncidents = state.maybeWhen(
      loaded: (incidents, _) => incidents,
      submitted: (incidents) => incidents,
      orElse: () => <Incident>[],
    );

    state = MapPageState.submitting(incidents: currentIncidents);

    final result = await _deleteIncidentUsecase.call(
      incidentId: incidentId,
      currentUser: currentUser,
    );

    return result.fold(
      (failure) {
        AppLogger.ui('Failed to delete incident', error: failure);
        state = MapPageState.loaded(
          incidents: currentIncidents,
          failure: failure,
        );
        return false;
      },
      (_) async {
        AppLogger.ui('Incident deleted successfully, refreshing list...');
        await _refreshIncidents(currentUser, currentIncidents);
        return true;
      },
    );
  }

  /// Helper để refresh danh sách incidents
  Future<void> _refreshIncidents(
    AppUser currentUser,
    List<Incident> fallbackIncidents,
  ) async {
    final refreshResult = await _getIncidentsUsecase.call(
      userUid: currentUser.uid,
    );
    refreshResult.fold(
      (failure) {
        state = MapPageState.submitted(incidents: fallbackIncidents);
      },
      (incidents) {
        state = MapPageState.submitted(incidents: incidents);
      },
    );
  }

  /// Reset state về loaded sau khi submitted
  void resetToLoaded() {
    state.maybeWhen(
      submitted: (incidents) {
        state = MapPageState.loaded(incidents: incidents);
      },
      orElse: () {},
    );
  }
}

final mapPageNotifierProvider = NotifierProvider<MapPageNotifier, MapPageState>(
  MapPageNotifier.new,
);
