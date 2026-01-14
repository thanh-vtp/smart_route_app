import 'dart:async';
import 'dart:io';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/errors/exceptions.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/data/datasources/arcgis_remote_data_source.dart';
import 'package:smart_route_app/features/incident/data/models/incident_model.dart';

class ArcGISRemoteDataSourceImpl implements ArcGISRemoteDataSource {
  final FeatureLayer _featureLayer;

  ArcGISRemoteDataSourceImpl(this._featureLayer);

  @override
  Future<List<IncidentModel>> getIncidents() async {
    try {
      final table = _featureLayer.featureTable;
      if (table == null) {
        throw Exception('Feature table is null, cannot get incidents');
      }

      // Tạo query parameters với where clause "1=1" để lấy tất cả features
      final query = QueryParameters()..whereClause = "1=1";

      // Yêu cầu trả về TẤT CẢ CÁC FIELDS từ feature layer
      // Trong ArcGIS SDK, cần load ServiceFeatureTable với outFields trước khi query
      if (table is ServiceFeatureTable) {
        AppLogger.data(
          'ServiceFeatureTable detected - mode: ${table.featureRequestMode}',
          source: 'ArcGISRemoteDataSourceImpl',
        );

        // load status để retry data
        if (table.loadStatus == LoadStatus.failedToLoad) {
          AppLogger.data(
            'Table failed previously. Retrying load...',
            source: 'ArcGISRemoteDataSourceImpl',
          );
          await table.retryLoad(); // thử lại nếu fail
        } else if (table.loadStatus == LoadStatus.notLoaded) {
          // Load table để đảm bảo có tất cả metadata và fields
          await table.load();
        }

        AppLogger.data(
          'Table loaded - loadStatus: ${table.loadStatus}, '
          'numberOfFeatures: ${table.numberOfFeatures}, '
          'hasGeometry: ${table.hasGeometry}',
          source: 'ArcGISRemoteDataSourceImpl',
        );

        // Log fields trong table metadata
        // final fields = table.fields;
        // final fieldNames = fields.map((f) => f.name).toList();
        // AppLogger.data(
        //   'Table fields from metadata: $fieldNames',
        //   source: 'ArcGISRemoteDataSourceImpl',
        // );

        // Nếu dùng MANUAL_CACHE mode, cần populate features từ service
        if (table.featureRequestMode == FeatureRequestMode.manualCache) {
          AppLogger.data(
            'Populating from service...',
            source: 'ArcGISRemoteDataSourceImpl',
          );
          await table.populateFromService(
            parameters: query,
            clearCache: true, // Đổi thành true để force refresh khi retry
            outFields: ['*'], // Lấy tất cả fields
          );

          AppLogger.data(
            'Population completed - cache: ${table.numberOfFeatures}',
            source: 'ArcGISRemoteDataSourceImpl',
          );
        }
      }

      final result = await table.queryFeatures(query);
      // Map FeatureQueryResult to List<IncidentModel>
      final features = result.features().toList();

      AppLogger.data(
        'GET completed - Found ${features.length} incidents',
        source: 'ArcGISRemoteDataSourceImpl',
      );

      if (features.isEmpty) {
        return [];
      }

      // Log JSON của từng feature và available fields
      if (features.isNotEmpty) {
        final firstFeature = features.first;
        final availableFields = firstFeature.attributes.keys.toList();
        AppLogger.data(
          'Available fields in layer: $availableFields',
          source: 'ArcGISRemoteDataSourceImpl',
        );
      }

      // for (var i = 0; i < features.length; i++) {
      //   final feature = features[i];
      //   final featureJson = _featureToJson(feature);
      //   AppLogger.data(
      //     'Feature #$i JSON:\n${JsonEncoder.withIndent('  ').convert(featureJson)}',
      //     source: 'ArcGISRemoteDataSourceImpl',
      //   );
      // }

      final incidentModels = features
          .map((feature) => IncidentModel.fromFeature(feature))
          .toList();

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

  @override
  Future<String> addIncident(IncidentModel incident) async {
    try {
      final table = _featureLayer.featureTable;
      if (table == null) {
        throw Exception('Feature table is null, cannot add incident');
      }

      AppLogger.data(
        'ADD to ArcGIS... (Lat: ${incident.latitude}, Lng: ${incident.longitude})',
        source: 'ArcGISRemoteDataSource',
      );

      if (table is! ServiceFeatureTable) {
        throw Exception('Feature table is not a ServiceFeatureTable');
      }

      // Tạo feature mới
      final feature = table.createFeature();

      // 1. SET ATTRIBUTES
      // Chỉ set các trường CUSTOM mà bạn tạo.
      // TUYỆT ĐỐI KHÔNG SET: Creator, CreationDate, Editor, EditDate, OBJECTID
      feature.attributes['LoaiSuCo'] = incident.type;
      feature.attributes['MucDo'] = incident.severity;
      feature.attributes['MoTa'] = incident.description;
      feature.attributes['NguoiBaoCao'] = incident.reportedBy;
      feature.attributes['NguoiBaoCaoUid'] =
          incident.reportedByUid; // UID để check ownership

      // QUAN TRỌNG: Truyền DateTime object, không truyền String
      feature.attributes['ThoiGianBaoCao'] = incident.reportedTime;

      // 2. SET GEOMETRY
      // Parse tọa độ từ String sang double
      final double lng = double.parse(incident.longitude);
      final double lat = double.parse(incident.latitude);

      // Tạo Point với WGS84 (Kinh/Vĩ độ). SDK sẽ tự project sang hệ tọa độ của Server (Mét/UTM)
      final point = ArcGISPoint(
        x: lng,
        y: lat,
        spatialReference: SpatialReference.wgs84,
      );
      feature.geometry = point;

      // 3. Thêm feature vào local table
      await table.addFeature(feature); // Thêm vào bảng tạm

      // Apply edits để đồng bộ với server
      final results = await table.applyEdits(); // Đẩy lên server

      if (results.isEmpty) {
        throw Exception('No edit results returned from applyEdits');
      }

      // Kiểm tra lỗi
      final addResult = results.first;
      if (addResult.error != null) {
        throw Exception('Failed to add feature: ${addResult.error?.message}');
      }

      // 4. RETURN OBJECT ID
      final objectId = addResult.objectId.toString();

      AppLogger.data(
        'ADD to ArcGIS Success - ObjectID: $objectId',
        source: 'ArcGISRemoteDataSource',
      );

      return objectId;
    } catch (e, st) {
      AppLogger.error(
        'Error adding incident to ArcGIS',
        name: 'ArcGISRemoteDataSource',
        error: e,
        stackTrace: st,
      );
      if (e is SocketException) {
        throw NetworkException.noInternet(st);
      }

      throw UnexpectedException(e.toString());
    }
  }

  @override
  Future<void> deleteIncident(String objectId) async {
    try {
      final table = _featureLayer.featureTable;
      if (table == null) {
        throw Exception('Feature table is null, cannot delete incident');
      }

      AppLogger.data(
        'DELETE from ArcGIS: ObjectID $objectId',
        source: 'ArcGISRemoteDataSource',
      );

      if (table is! ServiceFeatureTable) {
        throw Exception('Feature table is not a ServiceFeatureTable');
      }

      // 1. Query tìm feature cần xóa theo OBJECTID
      final query = QueryParameters()..whereClause = "OBJECTID = $objectId";
      final result = await table.queryFeatures(query);
      final features = result.features().toList();

      if (features.isEmpty) {
        // Nếu không tìm thấy thì coi như đã xóa hoặc ID sai, không throw lỗi để flow tiếp tục
        AppLogger.warning(
          'Feature not found with ObjectID: $objectId to delete',
        );
        return;
      }

      // 2. Xóa feature từ local table
      await table.deleteFeature(features.first);

      // Apply edits để đồng bộ với server
      final results = await table.applyEdits();

      if (results.isNotEmpty) {
        final deleteResult = results.first;
        if (deleteResult.error != null) {
          throw Exception(
            'Failed to delete feature: ${deleteResult.error?.message}',
          );
        }
      }

      AppLogger.data(
        'DELETE from ArcGIS Success - ObjectID: $objectId',
        source: 'ArcGISRemoteDataSource',
      );
    } catch (e, st) {
      AppLogger.error(
        'Error deleting incident from ArcGIS',
        name: 'ArcGISRemoteDataSource',
        error: e,
        stackTrace: st,
      );
      if (e is SocketException) {
        throw NetworkException.noInternet(st);
      }

      throw UnexpectedException(e.toString());
    }
  }

  @override
  Future<void> updateIncident(IncidentModel incident) async {
    try {
      final table = _featureLayer.featureTable;
      if (table == null) {
        throw Exception('Feature table is null, cannot delete incident');
      }

      if (table is! ServiceFeatureTable) {
        throw Exception('Feature table is not a ServiceFeatureTable');
      }

      // 1. Kiểm tra xem có ObjectID không (Bắt buộc để tìm feature)
      if (incident.arcgisObjectId == null || incident.arcgisObjectId!.isEmpty) {
        throw Exception('Missing ArcGIS ObjectID for update');
      }

      // 2. Query tìm feature cần xóa theo OBJECTID
      final objectId = int.parse(incident.arcgisObjectId!);
      final query = QueryParameters()..whereClause = "OBJECTID = $objectId";
      final result = await table.queryFeatures(query);
      final features = result.features().toList();

      if (features.isEmpty) {
        // Nếu không tìm thấy thì coi như đã xóa hoặc ID sai, không throw lỗi để flow tiếp tục
        AppLogger.warning(
          'Feature not found with ObjectID: $objectId to delete',
        );
        return;
      }

      final feature = features.first;

      // 3. Cập nhật Attributes (Chỉ cập nhật các trường cho phép)
      feature.attributes['LoaiSuCo'] = incident.type;
      feature.attributes['MucDo'] = incident.severity;
      feature.attributes['MoTa'] = incident.description;
      // Không cập nhật ThoiGianBaoCao, NguoiBaoCao (giữ nguyên gốc)

      // 4. Cập nhật Geometry
      final double lng = double.parse(incident.longitude);
      final double lat = double.parse(incident.latitude);

      // Tạo Point với WGS84 (Kinh/Vĩ độ). SDK sẽ tự project sang hệ tọa độ của Server (Mét/UTM)
      final point = ArcGISPoint(
        x: lng,
        y: lat,
        spatialReference: SpatialReference.wgs84,
      );
      feature.geometry = point;

      // 5. Cập nhật feature vào local table
      await table.updateFeature(feature); // Cập nhật vào bảng tạm

      // 6. Apply edits để đồng bộ với server
      final results = await table.applyEdits();

      if (results.isEmpty) {
        throw Exception('No edit results returned from applyEdits');
      }

      // Kiểm tra lỗi
      final editResults = results.first;

      if (results.isNotEmpty && editResults.error != null) {
        throw Exception(
          'Failed to ArcGIS Update feature: ${editResults.error?.message}',
        );
      }

      // 4. RETURN OBJECT ID
      final objectIdResult = editResults.objectId.toString();

      AppLogger.data(
        'Edit to ArcGIS Success - ObjectID: $objectIdResult',
        source: 'ArcGISRemoteDataSource',
      );
    } catch (e, st) {
      AppLogger.error(
        'Error updating incident to ArcGIS',
        name: 'ArcGISRemoteDataSource',
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

/// Helper method để convert Feature sang JSON format
Map<String, dynamic> _featureToJson(Feature feature) {
  final attributes = feature.attributes;
  final geometry = feature.geometry;
  // Convert attributes to JSON-safe format
  // DateTime objects need to be converted to strings or milliseconds
  final safeAttributes = <String, dynamic>{};
  attributes.forEach((key, value) {
    if (value == null) {
      safeAttributes[key] = null;
    } else if (value is DateTime) {
      // Convert DateTime to ISO string for logging
      safeAttributes[key] = {
        'type': 'DateTime',
        'iso': value.toIso8601String(),
        'milliseconds': value.millisecondsSinceEpoch,
      };
    } else if (value is int ||
        value is double ||
        value is String ||
        value is bool) {
      safeAttributes[key] = value;
    } else {
      // For other types, convert to string
      safeAttributes[key] = value.toString();
    }
  });
  Map<String, dynamic> geometryJson = {};
  if (geometry != null) {
    if (geometry is ArcGISPoint) {
      geometryJson = {
        'type': 'Point',
        'x': geometry.x,
        'y': geometry.y,
        'spatialReference': {
          'wkid': geometry.spatialReference?.wkid ?? 'unknown',
        },
      };
    } else {
      final extent = geometry.extent;
      geometryJson = {
        'type': geometry.runtimeType.toString(),
        'extent': {
          'xMin': extent.xMin,
          'yMin': extent.yMin,
          'xMax': extent.xMax,
          'yMax': extent.yMax,
        },
      };
    }
  }
  return {'attributes': safeAttributes, 'geometry': geometryJson};
}
