import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_item.freezed.dart';

@freezed
class ClusterItem with _$ClusterItem {
  const ClusterItem._(); // private constructor for freezed

  factory ClusterItem({
    required int objectId,
    required double latitude,
    required double longitude,
    required int clusterId,
    required int isCorePoint,
  }) = _ClusterItem;

  // helper method để xác định nếu clusterId == '-1' thì đây là noise point (điểm nhiễu, không thuộc cluster nào)
  // using 'item.isNoise' replaces 'item.clusterId == '-1''
  bool get isNoise => clusterId == -1;
}
