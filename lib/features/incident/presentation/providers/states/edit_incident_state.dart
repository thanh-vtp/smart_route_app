import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_incident_state.freezed.dart';

@freezed
class EditIncidentState with _$EditIncidentState {
  const factory EditIncidentState({
    @Default(false) bool isUpdating,
    @Default(false) bool isSuccess,
    @Default(false) bool isDeleting,
    @Default(false) bool isDeleteSuccess,
    String? errorMessage,
  }) = _EditIncidentState;
}
