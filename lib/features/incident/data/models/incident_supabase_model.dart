import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';

part 'incident_supabase_model.freezed.dart';
part 'incident_supabase_model.g.dart';

@freezed
abstract class IncidentSupabaseModel with _$IncidentSupabaseModel {
  const IncidentSupabaseModel._(); // private constructor for create factory toEntity()

  const factory IncidentSupabaseModel({
    required String id,
    @JsonKey(name: 'arcgis_object_id') required String? arcgisObjectId,
    required String type,
    required String severity,
    required double lat, // vĩ độ
    required double lng, // kinh độ
    String? description,
    String? address,
    @JsonKey(name: 'reported_by') String? reportedBy,
    @Default(0) int upvotes,
    @Default(0) int downvotes,
    @Default('active') String status,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _IncidentSupabaseModel;

  // Chuyển đổi JSON -> Data Model
  factory IncidentSupabaseModel.fromJson(Map<String, dynamic> json) =>
      _$IncidentSupabaseModelFromJson(json);

  /// Chuyển từ Entity -> Model
  factory IncidentSupabaseModel.fromEntity(
    Incident entity, {
    String? arcgisObjectId,
  }) {
    return IncidentSupabaseModel(
      id: entity.id,
      arcgisObjectId: entity.arcgisObjectId,
      type: entity.type,
      severity: entity.severity,
      lat: entity.lat,
      lng: entity.lng,
      description: entity.description,
      address: entity.address,
      reportedBy: entity.reportedBy,
      upvotes: entity.upvotes,
      downvotes: entity.downvotes,
      status: entity.status,
      expiresAt: entity.expiresAt,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // Chuyển đổi Model -> Entity
  Incident toEntity() {
    return Incident(
      id: id,
      arcgisObjectId: arcgisObjectId,
      type: type,
      severity: severity,
      lat: lat,
      lng: lng,
      description: description,
      address: address,
      reportedBy: reportedBy,
      upvotes: upvotes,
      downvotes: downvotes,
      status: status,
      expiresAt: expiresAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
