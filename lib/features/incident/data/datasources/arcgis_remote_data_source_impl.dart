import 'dart:async';
import 'dart:io';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/common/model/incident_arcgis_model.dart';
import 'package:smart_route_app/core/errors/exceptions.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/data/datasources/arcgis_remote_data_source.dart';
import 'package:http/http.dart' as http;

class ArcGISRemoteDataSourceImpl implements ArcGISRemoteDataSource {
  final FeatureLayer _featureLayer;
  final http.Client _client;

  ArcGISRemoteDataSourceImpl(
    this._featureLayer, {
    http.Client? client,
    String? arcgisToken,
  }) : _client = client ?? http.Client();

  @override
  Future<List<IncidentArcgisModel>> getIncidents({
    Geometry? visibleExtent,
  }) async {
    try {
      final table = _featureLayer.featureTable;
      if (table == null) {
        throw Exception('Feature table is null, cannot get incidents');
      }

      // Tạo query parameters với where clause "1=1" để lấy tất cả features
      final query = QueryParameters()
        ..whereClause = "status = 'active' OR status = 'fake'";

      // TỐI ƯU 1: Nếu có visibleExtent, chỉ lấy trong màn hình hiện tại
      if (visibleExtent != null) {
        query.geometry = visibleExtent;
        query.spatialRelationship = SpatialRelationship.intersects;
      }

      // Yêu cầu trả về TẤT CẢ CÁC FIELDS từ feature layer
      // Trong ArcGIS SDK, cần load ServiceFeatureTable với outFields trước khi query
      if (table is ServiceFeatureTable) {
        // AppLogger.data(
        //   'ServiceFeatureTable detected - mode: ${table.featureRequestMode}',
        //   source: 'ArcGISRemoteDataSourceImpl',
        // );

        // load status để retry data
        if (table.loadStatus == LoadStatus.failedToLoad) {
          // AppLogger.data(
          //   'Table failed previously. Retrying load...',
          //   source: 'ArcGISRemoteDataSourceImpl',
          // );
          await table.retryLoad(); // thử lại nếu fail
        } else if (table.loadStatus == LoadStatus.notLoaded) {
          // Load table để đảm bảo có tất cả metadata và fields
          await table.load();
        }

        // AppLogger.data(
        //   'Table loaded - loadStatus: ${table.loadStatus}, '
        //   'numberOfFeatures: ${table.numberOfFeatures}, '
        //   'hasGeometry: ${table.hasGeometry}',
        //   source: 'ArcGISRemoteDataSourceImpl',
        // );

        // Log fields trong table metadata
        // final fields = table.fields;
        // final fieldNames = fields.map((f) => f.name).toList();
        // AppLogger.data(
        //   'Table fields from metadata: $fieldNames',
        //   source: 'ArcGISRemoteDataSourceImpl',
        // );

        // Nếu dùng MANUAL_CACHE mode, cần populate features từ service
        if (table.featureRequestMode == FeatureRequestMode.manualCache) {
          // AppLogger.data(
          //   'Populating from service...',
          //   source: 'ArcGISRemoteDataSourceImpl',
          // );

          // TỐI ƯU 2: CHỈ lấy 3 fields cần thiết để vẽ bản đồ
          await table.populateFromService(
            parameters: query,
            clearCache: true, // Đổi thành true để force refresh khi retry
            outFields: ['*'],
          );

          // AppLogger.data(
          //   'Population completed - cache: ${table.numberOfFeatures}',
          //   source: 'ArcGISRemoteDataSourceImpl',
          // );
        }
      }

      final result = await table.queryFeatures(query);
      // Map FeatureQueryResult to List<IncidentModel>
      final features = result.features().toList();

      AppLogger.data(
        'GET completed - Found ${features.length} incidents',
        source: 'ArcGISRemoteDataSourceImpl',
      );

      // for (final field in table.fields) {
      //   AppLogger.debug('Data Field: ${field.name} - ${field.type}');
      // }

      if (features.isEmpty) {
        return [];
      }

      final incidentModels = features
          .map((feature) => IncidentArcgisModel.fromFeature(feature))
          .toList();

      // AppLogger.debug('incidentModels.length = ${incidentModels.length}');

      return incidentModels;
    } catch (e, st) {
      // log info error
      AppLogger.error(
        'Error getting incidents from ArcGIS',
        name: 'ArcGISRemoteDataSourceImpl',
        error: e,
        stackTrace: st,
      );

      if (e is SocketException) {
        throw NetworkException.noInternet(st);
      }

      throw UnexpectedException(e.toString());
    }
  }
}
