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
  const factory ReportPageState.error({required Failure failure}) = _Error;
}
