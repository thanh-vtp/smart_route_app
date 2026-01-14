import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/usecases/get_incidents_usecase.dart';
import 'package:smart_route_app/features/incident/domain/usecases/update_incident_usecase.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/report_page_state.dart';
import 'package:smart_route_app/features/incident/presentation/providers/usecases/use_case_providers.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/usecase/use_case_providers.dart';

class ReportPageNotifier extends Notifier<ReportPageState> {
  late final GetIncidentsUsecase _getIncidentsUsecase;
  late final UpdateIncidentUsecase _updateIncidentUsecase;
  @override
  ReportPageState build() {
    _getIncidentsUsecase = ref.watch(getIncidentsUsecaseProvider);
    _updateIncidentUsecase = ref.watch(updateIncidentUsecaseProvider);
    return const ReportPageState.initial();
  }

  Future<void> fetchIncidents({
    IncidentDataSourceType source = IncidentDataSourceType.supabase,
    required AppUser currentUser,
  }) async {
    // Chỉ set loading nếu là lần đầu hoặc user muốn full refresh
    // Nếu đang có data rồi thì có thể không cần set .loading() để tránh nháy màn hình
    bool hasData = state.maybeWhen(
      loaded: (_) => true,
      submitted: (_) => true,
      orElse: () => false,
    );

    if (!hasData) {
      state = const ReportPageState.loading();
    }

    final result = await _getIncidentsUsecase.call(
      GetIncidentsParams(source: source, userUid: currentUser.uid),
    );

    result.fold(
      (failure) {
        AppLogger.ui('Failed to fetch incidents', error: failure);
        state = ReportPageState.error(failure: failure);
      },
      (incidents) {
        AppLogger.ui('Successfully fetched ${incidents.length} incidents');
        state = ReportPageState.loaded(incidents: incidents);
      },
    );
  }

  /// Thêm incident mới và cập nhật UI
  /// [incident] - Incident cần thêm
  /// [currentUser] - User hiện tại đang đăng nhập
  Future<bool> editIncident(Incident incident, AppUser currentUser) async {
    AppLogger.ui(
      'User ${currentUser.email} attempting to edit incident: ${incident.type}',
    );

    // Lấy danh sách hiện tại để giữ UI không bị mất
    // Nếu state hiện tại không có list (ví dụ đang error), dùng list rỗng
    final List<Incident> currentList = state.maybeWhen(
      loaded: (list) => list,
      submitted: (list) => list,
      error: (_, list) => list ?? [],
      orElse: () => [],
    );

    // Chuyển sang state Submitting (nhưng vẫn truyền list cũ vào)
    // UI lúc này có thể hiện Loading Overlay đè lên danh sách
    state = ReportPageState.submitting(incidents: currentList);

    // Gọi usecase để cập nhật incident
    final updateResult = await _updateIncidentUsecase.call(
      incident: incident,
      currentUser: currentUser,
    );

    return updateResult.fold(
      (failure) {
        AppLogger.ui('Failed to update incident', error: failure);
        // Trả về state error, giữ nguyên danh sách cũ để thử lại
        state = ReportPageState.error(failure: failure, incidents: currentList);
        return false;
      },
      (_) async {
        AppLogger.ui('Incident updated successfully, refreshing list...');

        // Update thành công -> Gọi Refresh lại toàn bộ list
        // Lưu ý: Gọi usecase trực tiếp để lấy data mới, không gọi hàm fetchIncidents
        // để tránh việc hàm đó set state .loading() đè lên logic của mình.
        // Vẫn giữ state submitted với danh sách cũ + incident mới
        final refreshResult = await _getIncidentsUsecase.call(
          GetIncidentsParams(
            source: IncidentDataSourceType.supabase,
            userUid: currentUser.uid,
          ),
        );

        refreshResult.fold(
          (failure) async {
            AppLogger.ui(
              'Failed to refresh incidents after updating',
              error: failure,
            );

            // Update thành công nhưng fetch lại list thất bại
            // -> Vẫn coi là thành công (Submitted) nhưng dùng list cũ (hoặc edit local)
            state = ReportPageState.submitted(incidents: currentList);
          },
          (incidents) {
            AppLogger.ui('Refreshed incidents: ${incidents.length} total');
            // Cập nhật với danh sách mới từ server
            state = ReportPageState.submitted(incidents: incidents);
          },
        );

        return true;
      },
    );
  }

  /// Reset state về loaded sau khi submitted
  void resetToLoaded() {
    state.maybeWhen(
      submitted: (incidents) {
        state = ReportPageState.loaded(incidents: incidents);
      },
      error: (_, incidents) {
        if (incidents != null) {
          state = ReportPageState.loaded(incidents: incidents);
        }
      },
      orElse: () {},
    );
  }
}

final reportPageNotifierProvider =
    NotifierProvider<ReportPageNotifier, ReportPageState>(
      ReportPageNotifier.new,
    );
