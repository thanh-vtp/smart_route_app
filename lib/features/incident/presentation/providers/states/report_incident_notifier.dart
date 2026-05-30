import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/common/presentation/providers/usecases/use_case_providers.dart';
import 'package:smart_route_app/core/common/screens/state/incidents_provider.dart';
import 'package:smart_route_app/core/common/screens/state/location_ui_notifier.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/providers/uscases/use_case_providers.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/presentation/providers/usecases/use_case_providers.dart';
import 'package:uuid/uuid.dart';
import 'report_incident_state.dart';

part 'report_incident_notifier.g.dart';

@riverpod
class ReportIncidentNotifier extends _$ReportIncidentNotifier {
  @override
  ReportIncidentState build() {
    // Tự động lấy tọa độ và dịch địa chỉ ngay khi Notifier được khởi tạo
    Future.microtask(() => _fetchAddressFromCurrentLocation());
    return const ReportIncidentState();
  }

  /// BƯỚC 1: Lấy tọa độ và dịch ra địa chỉ
  Future<void> _fetchAddressFromCurrentLocation() async {
    state = state.copyWith(isLoadingAddress: true, errorMessage: null);

    try {
      // 1. Đọc tọa độ hiện tại từ LocationUiNotifier
      final locationState = ref.read(locationUiProvider);
      final position = locationState.location?.position;

      if (position == null) {
        state = state.copyWith(
          isLoadingAddress: false,
          address: 'Không thể xác định vị trí hiện tại.',
        );
        return;
      }

      // 2. Gọi UseCase Reverse Geocode
      final reverseGeocodeUsecase = ref.read(reverseGeocodeUseCaseProvider);
      final result = await reverseGeocodeUsecase(position.y, position.x);

      // 3. Xử lý kết quả Either
      result.fold(
        (failure) {
          state = state.copyWith(
            isLoadingAddress: false,
            address:
                'Tọa độ: ${position.y.toStringAsFixed(4)}, ${position.x.toStringAsFixed(4)}', // Fallback nếu lỗi mạng
          );
        },
        (addressResult) {
          state = state.copyWith(
            isLoadingAddress: false,
            address: addressResult.fullAddress,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(isLoadingAddress: false, address: 'Lỗi định vị');
    }
  }

  /// BƯỚC 2: Submit Báo cáo
  Future<void> submitReport({
    required String type,
    required int severityIndex,
    required String description,
    DateTime? expiresAt,
  }) async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);

    // 1. Lấy tọa độ
    final locationState = ref.read(locationUiProvider);
    final position = locationState.location?.position;

    if (position == null) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Vui lòng chờ lấy tọa độ trước khi gửi báo cáo.',
      );
      return;
    }

    // 2. Lấy thông tin User Auth
    final getCurrentUserUsecase = ref.read(getCurrentUserUsecaseProvider);
    // Giả sử usecase này có hàm call() hoặc property currentUser
    final currentUser = getCurrentUserUsecase.call();

    if (currentUser.isEmpty) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Bạn cần đăng nhập để thực hiện báo cáo.',
      );
      return;
    }

    // 3. Chuẩn hóa Mức độ (Severity)
    String severityStr;
    switch (severityIndex) {
      case 0:
        severityStr = 'low';
        break;
      case 1:
        severityStr = 'medium';
        break;
      case 2:
        severityStr = 'high';
        break;
      default:
        severityStr = 'low';
    }

    // 4. Khởi tạo Entity
    final incident = Incident(
      id: const Uuid().v4(),
      lat: position.y,
      lng: position.x,
      type: type,
      severity: severityStr,
      description: description.trim().isEmpty ? null : description.trim(),
      status: 'active',
      reportedBy: currentUser.id, // UID từ Auth
      createdAt: DateTime.now(),
      expiresAt: expiresAt,
    );

    // 5. Gọi UseCase AddIncident
    final addIncidentUsecase = ref.read(addIncidentUsecaseProvider);
    final result = await addIncidentUsecase(incident);

    // 6. Xử lý kết quả Either
    result.fold(
      (failure) {
        state = state.copyWith(
          isSubmitting: false,
          errorMessage: failure.message,
        );
      },
      (success) {
        // cập nhập lại danh sách incident
        ref.read(incidentsProvider.notifier).upsertIncident(incident);

        state = state.copyWith(
          isSubmitting: false,
          isSuccess: true, // Đánh dấu thành công để UI tự đóng
        );
      },
    );
  }
}
