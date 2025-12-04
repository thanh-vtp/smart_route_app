import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feature_layer_providers.g.dart';

@Riverpod(keepAlive: true)
FeatureLayer incidentFeatureLayer(IncidentFeatureLayerRef ref) {
  final serviceUrl =
      "https://services7.arcgis.com/a062mjV7UpVWoyjr/arcgis/rest/services/smart_route_finder/FeatureServer/0";

  // Tạo ServiceFeatureTable từ URI
  final serviceFeatureTable = ServiceFeatureTable.withUri(
    Uri.parse(serviceUrl),
  );

  // Đặt feature request mode để fetch tất cả attributes
  // MANUAL_CACHE: Cho phép control đầy đủ việc populate features và attributes
  serviceFeatureTable.featureRequestMode = FeatureRequestMode.manualCache;

  // Tạo FeatureLayer từ ServiceFeatureTable
  return FeatureLayer.withFeatureTable(serviceFeatureTable);
}
