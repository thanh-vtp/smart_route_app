import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/common/screens/state/incidents_provider.dart';
import 'package:smart_route_app/features/auth/domain/domain.dart';
import 'package:smart_route_app/features/auth/presentation/providers/uscases/use_case_providers.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/presentation/providers/usecases/use_case_providers.dart';
import 'edit_incident_state.dart';

part 'edit_incident_notifier.g.dart';

@riverpod
class EditIncidentNotifier extends _$EditIncidentNotifier {
  @override
  EditIncidentState build() {
    return const EditIncidentState();
  }

  Future<void> submitUpdate({
    required Incident currentIncident,
    required int severityIndex, // 0: low, 1: medium, 2: high
    required String description,
    DateTime? expiresAt,
  }) async {
    state = state.copyWith(isUpdating: true, errorMessage: null);

    try {
      // Chuyển index thành String enum của Supabase
      String newSeverity;
      switch (severityIndex) {
        case 0:
          newSeverity = 'low';
          break;
        case 1:
          newSeverity = 'medium';
          break;
        case 2:
          newSeverity = 'high';
          break;
        default:
          newSeverity = 'low';
      }

      // Tạo bản copy mới của Incident với dữ liệu được cập nhật
      final updatedIncident = currentIncident.copyWith(
        severity: newSeverity,
        description: description.trim().isEmpty ? null : description.trim(),
        expiresAt: expiresAt,
      );

      // Gọi UseCase Update
      final updateUsecase = ref.read(updateIncidentUsecaseProvider);
      final result = await updateUsecase(updatedIncident);

      result.fold(
        (failure) {
          state = state.copyWith(
            isUpdating: false,
            errorMessage: failure.message,
          );
        },
        (successIncident) {
          // Thành công: Cập nhật lại list trên Map (Để đổi màu Marker nếu cần)
          ref.read(incidentsProvider.notifier).upsertIncident(successIncident);

          state = state.copyWith(
            isUpdating: false,
            isSuccess: true, // Ra hiệu cho UI đóng BottomSheet
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isUpdating: false,
        errorMessage: 'Lỗi không xác định',
      );
    }
  }

  Future<void> deleteIncident(String incidentId) async {
    state = state.copyWith(isDeleting: true, errorMessage: null);

    try {
      // 1. Lấy ID người dùng hiện tại (Để đảm bảo bảo mật)
      final currentUser = ref.read(getCurrentUserUsecaseProvider).call();
      if (currentUser.isEmpty) {
        state = state.copyWith(
          isDeleting: false,
          errorMessage: 'Vui lòng đăng nhập.',
        );
        return;
      }

      // 2. Gọi UseCase xóa
      final deleteUsecase = ref.read(deleteIncidentUsecaseProvider);
      final result = await deleteUsecase(incidentId, currentUser.id);

      // 3. Xử lý kết quả
      result.fold(
        (failure) {
          state = state.copyWith(
            isDeleting: false,
            errorMessage: failure.message,
          );
        },
        (_) {
          // Xóa thành công: Loại bỏ incident khỏi danh sách trên Map
          ref.read(incidentsProvider.notifier).removeIncident(incidentId);

          state = state.copyWith(isDeleting: false, isDeleteSuccess: true);
        },
      );
    } catch (e) {
      state = state.copyWith(
        isDeleting: false,
        errorMessage: 'Lỗi không xác định khi xóa.',
      );
    }
  }
}
