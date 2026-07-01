import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/cluster/domain/entities/cluster_entities.dart';

part 'cluster_state.freezed.dart';

@freezed
abstract class ClusterState with _$ClusterState {
  const factory ClusterState({
    @Default(false) bool isLoading,
    final ClusterResult? clusterResult,
    String? errorMessage,
  }) = _ClusterState;
}
