import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/common/app_logger.dart';
import 'package:smart_route_app/common/constants/app_constants.dart';

part 'incident_feature_layer_providers.g.dart';

@Riverpod(keepAlive: true)
FeatureLayer incidentFeatureLayer(IncidentFeatureLayerRef ref) {
  if (kDebugMode) {
    AppLogger.info('Initialized ArcGIS API Key', name: 'ARCGIS_API_KEY');
  }

  final serviceFeatureTable = ServiceFeatureTable.withUri(
    Uri.parse(Constants.serviceTFeatureTableUrl),
  );

  // Đặt feature request mode để fetch tất cả attributes
  // MANUAL_CACHE: Cho phép control đầy đủ việc populate features và attributes
  serviceFeatureTable.featureRequestMode = FeatureRequestMode.manualCache;

  // Tạo FeatureLayer từ URL
  final incidentsLayer = FeatureLayer.withFeatureTable(serviceFeatureTable);

  // Add all feature layers to the map.
  // map.operationalLayers.addAll([incidentsLayer]);

  return incidentsLayer;
}
