import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/entities/cluster_item.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';

part 'map_page_state.freezed.dart';

@freezed
class MapPageState with _$MapPageState {
  const factory MapPageState.initial() = _Initial;

  const factory MapPageState.loading() = _Loading;

  /// State khi đã load xong danh sách incidents
  const factory MapPageState.loaded({required List<Incident> incidents}) =
      _Loaded;

  /// State khi đang submit/add incident mới
  const factory MapPageState.submitting({
    required List<Incident> incidents, // Giữ lại danh sách hiện tại
  }) = _Submitting;

  /// State sau khi add incident thành công
  const factory MapPageState.submitted({
    required List<Incident> incidents, // Danh sách đã cập nhật
  }) = _Submitted;

  const factory MapPageState.error({required Failure failure}) = _Error;

  // state fetch cluster
  const factory MapPageState.clusterLoaded({
    required List<ClusterItem> clusters,
  }) = _ClusterLoaded;
}
