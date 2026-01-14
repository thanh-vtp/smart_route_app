import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/network/providers/state/app_connectivity_provider.dart';
import 'package:smart_route_app/core/utils/utils.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/usecases/add_incident_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/delete_incident_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/get_incidents_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/update_incident_usecase.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/map_page_state.dart';
import 'package:smart_route_app/features/incident/presentation/providers/usecases/use_case_providers.dart';

class MapPageNotifier extends Notifier<MapPageState> {
  @override
  MapPageState build() {
    // Lắng nghe thay đổi internet
    ref.listen(appConnectivityProvider, (previous, next) {
      final wasOffline = previous == ConnectivityStatus.offline;
      final isOnline = next == ConnectivityStatus.online;

      if (wasOffline && isOnline) {
        fetchIncidents(isManualRetry: true);
      }
    });

    return const MapPageState.initial();
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
      loaded: (incidents) => incidents,
      submitted: (incidents) => incidents,
      orElse: () => <Incident>[], // List rỗng nếu chưa có gì
    );

    // 2. Chỉ hiện Loading xoay vòng tròn nếu chưa có data
    if (previousIncidents.isEmpty) {
      state = const MapPageState.loading();
    }
    // Nếu đã có data (previousIncidents.isNotEmpty), ta giữ nguyên state cũ
    // để người dùng vẫn nhìn thấy Map trong lúc ngầm load lại.

    final result = await _getIncidentsUsecase.call(
      GetIncidentsParams(source: source, userUid: userUid),
    );

    // check network connection
    // final isConnected = await ref.read(networkInfoProvider).isConnected;

    result.fold(
      (failure) {
        // TRƯỜNG HỢP LỖI (Cả Remote và Cache đều fail/trống)
        AppLogger.ui('Fetch failed: ${failure.technicalMessage}');

        if (previousIncidents.isNotEmpty) {
          // TRƯỜNG HỢP 1: Chưa có data mà lỗi -> Lỗi Fatal
          // Chuyển sang màn hình Error
          state = MapPageState.error(failure: failure);
        } else {
          // TRƯỜNG HỢP 2: Đã có data mà lỗi -> Lỗi Transient
          // KHÔNG chuyển sang state error (để tránh mất Map).
          // Giữ nguyên data cũ.
          state = MapPageState.loaded(incidents: previousIncidents);

          // Tùy chọn: Có thể bắn một sự kiện one-off (như Toast) tại đây
          // thông qua một provider khác hoặc để UI tự handle nếu cần.
        }
      },
      (incidents) {
        // TRƯỜNG HỢP THÀNH CÔNG (lấy list mới)
        AppLogger.ui('Successfully fetched ${incidents.length} incidents');

        state = MapPageState.loaded(incidents: incidents);
      },
    );
  }

  /// Thêm incident mới và cập nhật UI
  /// [incident] - Incident cần thêm
  /// [currentUser] - User hiện tại đang đăng nhập
  Future<Failure?> addIncident(Incident incident, AppUser currentUser) async {
    AppLogger.ui(
      'User ${currentUser.email} attempting to add incident: ${incident.type}',
    );

    // Lấy danh sách incidents hiện tại
    final currentIncidents = state.maybeWhen(
      loaded: (incidents) => incidents,
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
        // LỖI:
        // Tuyệt đối KHÔNG chuyển sang MapPageState.error()
        // Vì làm vậy sẽ biến mất Map và hiện màn hình lỗi to.

        // Quay về trạng thái loaded với data cũ
        state = MapPageState.loaded(incidents: currentIncidents);

        // Trả lỗi về cho UI hiện Snackbar hoặc xử lý tiếp
        return failure;
      },
      (_) async {
        AppLogger.ui('Incident added successfully, refreshing list...');

        // THÀNH CÔNG:
        // Refresh lại list
        await fetchIncidents(userUid: currentUser.uid);

        // Chuyển sang submitted để UI biết đóng form/bottom sheet
        final newIncidents = state.maybeWhen(
          loaded: (i) => i,
          orElse: () => currentIncidents,
        );
        state = MapPageState.submitted(incidents: newIncidents);

        return null; // Không có lỗi
      },
    );
  }

  /// Cập nhật incident
  Future<Failure?> updateIncident(
    Incident incident,
    AppUser currentUser,
  ) async {
    AppLogger.ui('User ${currentUser.email} updating incident: ${incident.id}');

    final currentIncidents = state.maybeWhen(
      loaded: (incidents) => incidents,
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
        // Lỗi: Quay lại loaded, không làm mất map
        state = MapPageState.loaded(incidents: currentIncidents);
        return failure; // Trả lỗi để UI hiện Snackbar
      },
      (_) async {
        AppLogger.ui('Incident updated successfully, refreshing list...');
        await _refreshIncidents(currentUser, currentIncidents);
        return null; // Không có lỗi
      },
    );
  }

  /// Xóa incident
  Future<Failure?> deleteIncident(
    String incidentId,
    AppUser currentUser,
  ) async {
    AppLogger.ui('User ${currentUser.email} deleting incident: $incidentId');

    final currentIncidents = state.maybeWhen(
      loaded: (incidents) => incidents,
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
        // state = MapPageState.loaded(
        //   incidents: currentIncidents,
        //   failure: failure,
        // );

        state = MapPageState.loaded(incidents: currentIncidents);
        return failure;
      },
      (_) async {
        AppLogger.ui('Incident deleted successfully, refreshing list...');
        await _refreshIncidents(currentUser, currentIncidents);
        return null;
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
