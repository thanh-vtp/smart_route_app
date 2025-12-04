import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/map/domain/usecases/get_incidents_usecase.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/report_page_state.dart';
import 'package:smart_route_app/features/map/presentation/providers/use_case_providers.dart';

class ReportPageNotifier extends Notifier<ReportPageState> {
  late final GetIncidentsUsecase _getIncidentsUsecase;
  @override
  ReportPageState build() {
    _getIncidentsUsecase = ref.read(getIncidentsUsecaseProvider);
    return const ReportPageState.initial();
  }

  Future<void> fetchIncidents({
    IncidentDataSourceType source = IncidentDataSourceType.supabase,
    AppUser? currentUser,
  }) async {
    state = const ReportPageState.loading();

    final result = await _getIncidentsUsecase.call(
      source: source,
      userUid: currentUser?.uid,
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
}

final reportPageNotifierProvider =
    NotifierProvider<ReportPageNotifier, ReportPageState>(
      ReportPageNotifier.new,
    );
