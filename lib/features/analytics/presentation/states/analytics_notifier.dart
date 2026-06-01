import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/common/presentation/providers/usecases/use_case_providers.dart';
import 'package:smart_route_app/features/analytics/domain/entities/analytics_data.dart';
import 'package:smart_route_app/features/analytics/presentation/providers/usecases/use_case_providers.dart';
import 'package:smart_route_app/features/analytics/presentation/states/analytics_state.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/providers/uscases/use_case_providers.dart';

part 'analytics_notifier.g.dart';

@riverpod
class AnalyticsNotifier extends _$AnalyticsNotifier {
  @override
  AnalyticsState build() {
    Future.microtask(() => fetchAnalytics());
    return const AnalyticsState();
  }

  Future<void> fetchAnalytics([TimeRange? newRange]) async {
    final range = newRange ?? state.selectedRange;
    state = state.copyWith(
      isLoading: true,
      selectedRange: range,
      errorMessage: null,
    );

    // Lấy UID user hiện tại
    final user = ref.read(getCurrentUserUsecaseProvider).call();
    if (user.isEmpty) return;

    final usecase = ref.read(getAnalyticsUsecaseProvider);
    final result = await usecase(user.id, range.name);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (data) {
        state = state.copyWith(isLoading: false, data: data);

        //  Chạy hàm lấy địa chỉ ngầm
        _fetchAddressesInBackground(data.recentActivities);
      },
    );
  }

  /// Hàm chạy ngầm lấy địa chỉ cho 10 item
  Future<void> _fetchAddressesInBackground(
    List<ActivityItem> activities,
  ) async {
    final reverseGeocode = ref.read(reverseGeocodeUseCaseProvider);

    // Tạo 1 bản copy của list hiện tại để update dần
    List<ActivityItem> updatedActivities = List.from(activities);

    for (int i = 0; i < updatedActivities.length; i++) {
      final act = updatedActivities[i];

      try {
        final result = await reverseGeocode(act.lat, act.lng);

        result.fold(
          (l) => null, // Nếu lỗi dịch địa chỉ thì bỏ qua
          (addressResult) {
            // Cập nhật lại item với địa chỉ đã dịch
            updatedActivities[i] = act.copyWith(
              address: addressResult.fullAddress,
            );

            // Cập nhật lại State để UI render lại dòng này
            if (state.data != null) {
              state = state.copyWith(
                data: state.data!.copyWith(recentActivities: updatedActivities),
              );
            }
          },
        );
      } catch (_) {}
    }
  }
}
