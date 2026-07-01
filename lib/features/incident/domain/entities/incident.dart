import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident.freezed.dart';

@freezed
abstract class Incident with _$Incident {
  const factory Incident({
    required String id,
    String? arcgisObjectId,
    required String type, // loại sự cố traffic, accident, construction, etc.
    required String severity, // mức độ sự cố
    required double lat, // vĩ độ
    required double lng, // kinh độ
    String? description,
    String? address,
    String? reportedBy,
    @Default(0) int upvotes,
    @Default(0) int downvotes,
    @Default('active') String status,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Incident;
}
