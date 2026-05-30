import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_incident_state.freezed.dart';

@freezed
class ReportIncidentState with _$ReportIncidentState {
  const factory ReportIncidentState({
    // Trạng thái cho việc dịch địa chỉ
    @Default(true) bool isLoadingAddress,
    String? address,

    // Trạng thái cho việc submit báo cáo
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _ReportIncidentState;
}
