import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/cluster/presentation/providers/usecase/use_case_providers.dart';
import 'package:smart_route_app/features/cluster/presentation/states/cluster_state.dart';

part 'cluster_notifier.g.dart';

@riverpod
class ClusterNotifier extends _$ClusterNotifier {
  @override
  ClusterState build() => const ClusterState();

  Future<void> fetchClusters() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final usecase = ref.read(fetchClusterUseCaseProvider);
    final result = await usecase(); // Gọi không tham số

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (clusterResult) => state = state.copyWith(
        isLoading: false,
        clusterResult: clusterResult,
      ),
    );
  }

  void clearClusters() => state = const ClusterState();
}
