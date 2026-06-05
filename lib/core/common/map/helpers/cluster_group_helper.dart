import 'package:smart_route_app/features/cluster/domain/entities/cluster_entities.dart';

class ClusterGroupHelper {
  static Map<int, List<ClusterItem>> group(List<ClusterItem> items) {
    final result = <int, List<ClusterItem>>{};

    for (final item in items) {
      if (item.clusterId == -1) continue;

      result.putIfAbsent(item.clusterId, () => []);

      result[item.clusterId]!.add(item);
    }

    return result;
  }
}
