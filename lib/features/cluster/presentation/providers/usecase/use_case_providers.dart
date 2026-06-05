import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/cluster/domain/usecase/fetch_cluster_usecase.dart';
import 'package:smart_route_app/features/cluster/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

@riverpod
FetchClusterUseCase fetchClusterUseCase(FetchClusterUseCaseRef ref) {
  final repository = ref.watch(clusterRepositoryProvider);
  return FetchClusterUseCase(repository);
}
