import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:arcgis_maps/arcgis_maps.dart' as arcgis;
import 'package:smart_route_app/common/app_logger.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';

part 'incident_arcgis_model.freezed.dart';

@freezed
class IncidentArcgisModel with _$IncidentArcgisModel {
  const IncidentArcgisModel._(); // private constructor
  const factory IncidentArcgisModel({
    required String arcgisObjectId,
    required String incidentUuid,
    required double lat, // vĩ độ
    required double lng, // kinh độ
    required String type, // loại sự cố traffic, accident, construction, etc.
    required String severity, // mức độ sự cố
    required String status,
  }) = _IncidentArcgisModel;

  /// Chuyển đổi Feature -> Data Model
  /// feature: Feature từ ArcGIS Maps SDK
  /// return: IncidentArcgisModel
  factory IncidentArcgisModel.fromFeature(arcgis.Feature feature) {
    final attributes = feature.attributes;
    var geometry = feature.geometry; // dùng var để có thể gán lại

    double lat = 0.0;
    double lng = 0.0;

    if (geometry is arcgis.ArcGISPoint) {
      // Phát hiện và sửa lỗi spatial reference không đúng
      // Nếu tọa độ nằm ngoài phạm vi WGS84 hợp lệ (-180 to 180, -90 to 90)
      // nhưng spatial reference claim là 4326, thì đây là lỗi dữ liệu

      // AppLogger.debug(
      //   '[DEBUG] Geometry: x=${geometry.x}, '
      //   'y=${geometry.y}, '
      //   'wkid=${geometry.spatialReference?.wkid}',
      // );

      final x = geometry.x;
      final y = geometry.y;
      final wkid = geometry.spatialReference?.wkid;

      // Kiểm tra nếu tọa độ nằm ngoài phạm vi WGS84 hợp lệ
      final isOutOfWgs84Range = x.abs() > 180 || y.abs() > 90;

      if (wkid == 4326 && isOutOfWgs84Range) {
        // Tọa độ thực sự là Web Mercator (3857) nhưng bị đánh dấu sai là WGS84
        // Tạo lại geometry với spatial reference đúng, sau đó chuyển sang WGS84
        final correctedGeometry = arcgis.ArcGISPoint(
          x: x,
          y: y,
          spatialReference: arcgis.SpatialReference(wkid: 3857), // Web Mercator
        );

        final projectedPoint = arcgis.GeometryEngine.project(
          correctedGeometry,
          outputSpatialReference: arcgis.SpatialReference.wgs84,
        );

        if (projectedPoint is arcgis.ArcGISPoint) {
          geometry = projectedPoint;
        }
      } else if (wkid != null && wkid != 4326) {
        // Nếu geometry không phải là WGS84 (wkid 4326), hãy convert nó.
        // UTM Zone 48N thường có wkid 32648.
        final projectedPoint = arcgis.GeometryEngine.project(
          geometry,
          outputSpatialReference: arcgis.SpatialReference.wgs84, // EPSG: 4326
        );

        if (projectedPoint is arcgis.ArcGISPoint) {
          geometry = projectedPoint;
        }
      }

      lat = geometry.y;
      lng = geometry.x;
    }

    // Parse các fields với fallback values

    final arcgisObjectId = attributes['OBJECTID']?.toString() ?? '';
    final incidentUuid = attributes['incident_uuid'] as String? ?? '';
    final type =
        attributes['incident_type'] as String? ?? 'Không rõ loại sự cố';
    final severity = attributes['severity'] as String? ?? 'Không rõ mức độ';
    final status = attributes['status'] as String? ?? 'Không có trạng thái';

    return IncidentArcgisModel(
      arcgisObjectId: arcgisObjectId,
      incidentUuid: incidentUuid,
      lat: lat,
      lng: lng,
      type: type,
      severity: severity,
      status: status,
    );
  }

  Incident toEntity() {
    return Incident(
      id: incidentUuid,
      arcgisObjectId: arcgisObjectId,
      lat: lat,
      lng: lng,
      type: type,
      severity: severity,
      status: status,

      // set null
      description: null,
      reportedBy: null,
      upvotes: 0,
      downvotes: 0,
      expiresAt: null,
      createdAt: null,
      updatedAt: null,
    );
  }
}
