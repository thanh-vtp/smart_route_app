import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/utils.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';
import 'package:smart_route_app/features/map/domain/usecases/add_incident_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/delete_incident_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/get_incidents_usecase.dart';
import 'package:smart_route_app/features/map/domain/usecases/update_incident_usecase.dart';
import 'package:smart_route_app/core/providers/cache/network_info_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/map_page_state.dart';
import 'package:smart_route_app/features/map/presentation/providers/usecase/use_case_providers.dart';

class MapPageNotifier extends Notifier<MapPageState> {
  @override
  MapPageState build() {
    // Lắng nghe thay đổi internet ngay trong Notifier
    ref.listen(internetConnectionStreamProvider, (previous, next) {
      final isOnline = next.value ?? true;
      final wasOffline = previous?.value == false;

      if (!isOnline) {
        // TRƯỜNG HỢP: Vừa mất mạng
        _handleInternetLost();
      } else if (wasOffline && isOnline) {
        // TRƯỜNG HỢP: Vừa có mạng lại (Reconnect)
        fetchIncidents(isManualRetry: true);
      }
    });

    return const MapPageState.initial();
  }

  void _handleInternetLost() {
    state.maybeWhen(
      loaded: (incidents, _) {
        // Nếu đang ở màn hình Map, đính kèm Failure để hiện Banner cam
        state = MapPageState.loaded(
          incidents: incidents,
          failure: NetworkFailure.noInternet(),
        );
      },
      orElse: () {},
    );
  }

  GetIncidentsUsecase get _getIncidentsUsecase =>
      ref.read(getIncidentsUsecaseProvider);
  AddIncidentUsecase get _addIncidentUsecase =>
      ref.read(addIncidentUsecaseProvider);
  UpdateIncidentUsecase get _updateIncidentUsecase =>
      ref.read(updateIncidentUsecaseProvider);
  DeleteIncidentUsecase get _deleteIncidentUsecase =>
      ref.read(deleteIncidentUsecaseProvider);

  Future<void> fetchIncidents({
    IncidentDataSourceType source = IncidentDataSourceType.arcGIS,
    String userUid = '',
    bool isManualRetry = false, // Thêm flag để biết là do bấm nút Retry
  }) async {
    AppLogger.ui('User requested to fetch incidents on the map');

    // 1. Lấy danh sách incidents hiện tại (để backup)
    final previousIncidents = state.maybeWhen(
      loaded: (incidents, _) => incidents,
      submitted: (incidents) => incidents,
      orElse: () => <Incident>[], // List rỗng nếu chưa có gì
    );

    // 2. Nếu là manual retry hoặc data trống, đưa về state loading hoàn toàn
    // Khi state là .loading(), UI sẽ tự ẩn Error và hiện Loading
    if (isManualRetry || previousIncidents.isEmpty) {
      state = const MapPageState.loading();
    }

    final result = await _getIncidentsUsecase.call(
      GetIncidentsParams(source: source, userUid: userUid),
    );

    // check network connection
    final isConnected = await ref.read(networkInfoProvider).isConnected;

    result.fold(
      (failure) {
        // TRƯỜNG HỢP LỖI (Cả Remote và Cache đều fail/trống)
        AppLogger.ui('Fetch failed: ${failure.technicalMessage}');

        if (previousIncidents.isNotEmpty) {
          // Nếu vẫn còn data cũ ở UI, giữ lại data và chỉ đính kèm lỗi để hiện banner
          // Sau khi retry vẫn lỗi, hiện lại data kèm banner lỗi
          state = MapPageState.loaded(
            incidents: previousIncidents,
            failure: failure,
          );
        } else {
          // Lỗi fatal khi không có cache
          // Nếu trắng tay hoàn toàn, mới đưa về state error (hiện màn hình lỗi to)
          state = MapPageState.error(failure: failure);
        }
      },
      (incidents) {
        // TRƯỜNG HỢP THÀNH CÔNG (Hoặc lấy được từ Cache thành công)
        AppLogger.ui('Successfully fetched ${incidents.length} incidents');

        state = MapPageState.loaded(
          incidents: incidents,
          failure: isConnected
              ? null
              : NetworkFailure.noInternet(), // Banner sẽ hiện dựa trên cái này
        );
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
          GetIncidentsParams(userUid: currentUser.uid),
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
      GetIncidentsParams(userUid: currentUser.uid),
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
