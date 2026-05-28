import 'package:arcgis_maps/arcgis_maps.dart' as arcgis;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart'
    as domain;

part 'incident_model.freezed.dart';
part 'incident_model.g.dart';

// freezed: 3.2.3
// dart run build_runner build --delete-conflicting-outputs

/// Custom JSON converter cho DateTime
/// Chuyển đổi DateTime <-> milliseconds khi serialize/deserialize JSON
class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

/// Model đại diện cho 1 điểm sự cố trên bản đồ
@freezed
class IncidentModel with _$IncidentModel {
  const IncidentModel._(); // private constructor for create factory toEntity()

  const factory IncidentModel({
    required String id,
    required double latitude, // vĩ độ
    required double longitude, // kinh độ
    required String type, // loại sự cố traffic, accident, construction, etc.
    required String severity, // mức độ sự cố
    required String description, // mô tả sự cố
    @DateTimeConverter()
    required DateTime reportedTime, // thời gian báo cáo (define)
    String? reportedBy, // tên người báo cáo (từ Google account)
    String? reportedByUid, // user ID người báo cáo
    String? arcgisObjectId, // ObjectID từ ArcGIS

    @DateTimeConverter() DateTime? creationDate, // Thời gian ghi vào server
    @DateTimeConverter() DateTime? editDate, // Thời gian cập nhật lần cuối
  }) = _IncidentModel;

  // Chuyển đổi JSON -> Data Model
  factory IncidentModel.fromJson(Map<String, dynamic> json) =>
      _$IncidentModelFromJson(json);

  /// Chuyển đổi JSON từ Supabase -> Data Model (với logging)
  /// Dùng cho debug và tracking data từ Supabase
  factory IncidentModel.fromSupabaseJson(Map<String, dynamic> json) {
    // Log raw JSON data
    // AppLogger.data(
    //   'Parsing Supabase JSON:\n${JsonEncoder.withIndent('  ').convert(json)}',
    //   source: 'IncidentModel.fromSupabaseJson',
    // );

    try {
      // Parse các field với error handling
      final id = json['id'] as String;
      final latitude = double.parse(json['latitude'] as String);
      final longitude = double.parse(json['longitude'] as String);
      final type = json['type'] as String;
      final severity = json['severity'] as String;
      final description = json['description'] as String;
      final reportedTime = DateTime.parse(json['reported_time'] as String);
      final reportedBy = json['reported_by'] as String?;
      final reportedByUid = json['reported_by_uid'] as String?;
      final arcgisObjectId = json['arcgis_object_id'] as String?;

      // Parse optional datetime fields
      DateTime? creationDate;
      if (json['created_at'] != null) {
        creationDate = DateTime.parse(json['created_at'] as String);
      }

      DateTime? editDate;
      if (json['updated_at'] != null) {
        editDate = DateTime.parse(json['updated_at'] as String);
      }

      final model = IncidentModel(
        id: id,
        latitude: latitude,
        longitude: longitude,
        type: type,
        severity: severity,
        description: description,
        reportedTime: reportedTime,
        reportedBy: reportedBy,
        reportedByUid: reportedByUid,
        arcgisObjectId: arcgisObjectId,
        creationDate: creationDate,
        editDate: editDate,
      );

      // AppLogger.data(
      //   'Parsed incident: id=$id, type=$type, severity=$severity, '
      //   'lat=$latitude, lng=$longitude, arcgisObjectId=$arcgisObjectId',
      //   source: 'IncidentModel.fromSupabaseJson',
      // );

      return model;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to parse Supabase JSON',
        name: 'IncidentModel.fromSupabaseJson',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Chuyển đổi Domain Entity -> Data Model
  // arcgisObjectId cần được set riêng vì Entity không chứa field này
  factory IncidentModel.fromEntity(
    domain.Incident entity, {
    String? arcgisObjectId,
  }) {
    return IncidentModel(
      id: entity.id,
      latitude: entity.latitude,
      longitude: entity.longitude,
      type: entity.type,
      severity: entity.severity,
      description: entity.description,
      reportedTime: entity.reportedTime,
      reportedBy: entity.reportedBy,
      reportedByUid: entity.reportedByUid,
      arcgisObjectId: arcgisObjectId,
      creationDate: entity.creationDate,
      editDate: entity.editDate,
    );
  }

  // Chuyển đổi Data Model -> Domain Entity
  domain.Incident toEntity() {
    return domain.Incident(
      id: id,
      latitude: latitude,
      longitude: longitude,
      type: type,
      severity: severity,
      description: description,
      reportedTime: reportedTime,
      reportedBy: reportedBy,
      reportedByUid: reportedByUid,
      creationDate: creationDate,
      editDate: editDate,
    );
  }

  /// Chuyển đổi Feature -> Data Model
  /// feature: Feature từ ArcGIS Maps SDK
  /// return: IncidentModel
  factory IncidentModel.fromFeature(arcgis.Feature feature) {
    final attributes = feature.attributes;
    var geometry = feature.geometry; // dùng var để có thể gán lại

    double latitude = 0.0;
    double longitude = 0.0;

    if (geometry is arcgis.ArcGISPoint) {
      // Phát hiện và sửa lỗi spatial reference không đúng
      // Nếu tọa độ nằm ngoài phạm vi WGS84 hợp lệ (-180 to 180, -90 to 90)
      // nhưng spatial reference claim là 4326, thì đây là lỗi dữ liệu
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

      latitude = geometry.y;
      longitude = geometry.x;
    }

    DateTime? parseArcGISDate(dynamic value) {
      if (value == null) return null;

      DateTime? date;

      if (value is DateTime) {
        date = value;
      } else if (value is int) {
        // Timestamp từ ArcGIS server thường là UTC
        date = DateTime.fromMillisecondsSinceEpoch(value, isUtc: true);
      } else if (value is String) {
        date = DateTime.tryParse(value);
      }

      // QUAN TRỌNG NHẤT: Chuyển từ UTC về giờ máy người dùng (Local)
      return date?.toLocal();
    }

    // Parse các fields với fallback values
    final objectId = attributes['OBJECTID']?.toString() ?? '';
    final loaiSuCo = attributes['LoaiSuCo'] as String? ?? 'Không rõ';
    final mucDo = attributes['MucDo'] as String? ?? 'Không rõ';
    final moTa = attributes['MoTa'] as String? ?? 'Không có mô tả';
    final reportedTime =
        parseArcGISDate(attributes['ThoiGianBaoCao']) ?? DateTime.now();
    final reportedBy = attributes['NguoiBaoCao'] as String?;
    final reportedByUid = attributes['NguoiBaoCaoUid'] as String?;
    final creationDate = parseArcGISDate(attributes['CreationDate']);
    final editDate = parseArcGISDate(attributes['EditDate']);

    return IncidentModel(
      id: objectId,
      latitude: latitude,
      longitude: longitude,
      type: loaiSuCo,
      severity: mucDo,
      description: moTa,
      reportedTime: reportedTime,
      reportedBy: reportedBy,
      reportedByUid: reportedByUid,
      creationDate: creationDate,
      editDate: editDate,
    );
  }
}

extension IncidentModelExtension on IncidentModel {
  /// Chuyển đổi Data Model -> Graphic
  /// this: IncidentModel
  /// return: Graphic
  arcgis.Graphic toGraphic() {
    final double lng = longitude;
    final double lat = latitude;

    // Validation: Đảm bảo tọa độ nằm trong phạm vi WGS84 hợp lệ
    if (lng.abs() > 180 || lat.abs() > 90) {
      throw ArgumentError(
        'Invalid WGS84 coordinates: lat=$lat, lng=$lng. '
        'Valid range: latitude [-90, 90], longitude [-180, 180]',
      );
    }

    arcgis.ArcGISPoint? point;

    point = arcgis.ArcGISPoint(
      x: lng,
      y: lat,
      spatialReference: arcgis.SpatialReference.wgs84,
    );

    return arcgis.Graphic(
      geometry: point,
      attributes: {
        'incident_id': id,
        'LoaiSuCo': type,
        'MucDo': severity,
        'MoTa': description,
        'ThoiGianBaoCao': reportedTime,
        'NguoiBaoCao': reportedBy,
        'NguoiBaoCaoUid': reportedByUid,
      },
    );
  }
}
