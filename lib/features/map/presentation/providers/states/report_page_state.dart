import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';

part 'report_page_state.freezed.dart';

@freezed
class ReportPageState with _$ReportPageState {
  const factory ReportPageState.initial() = _Initial;
  const factory ReportPageState.loading() = _Loading;
  const factory ReportPageState.loaded({required List<Incident> incidents}) =
      _Loaded;

  /// State khi đang submit/edit incident
  const factory ReportPageState.submitting({
    required List<Incident> incidents,
  }) = _Submitting;

  /// State sau khi edit incident thành công
  const factory ReportPageState.submitted({required List<Incident> incidents}) =
      _Submitted;

  const factory ReportPageState.error({
    required Failure failure,
    List<Incident>?
    incidents, // Giữ lại danh sách incidents cũ nếu có lỗi khi add/edit
  }) = _Error;
}
