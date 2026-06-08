import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/notification_entity.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const NotificationModel._();

  const factory NotificationModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String type,
    required String title,
    required String body,
    @JsonKey(name: 'reference_incident_id') String? referenceIncidentId,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  AppNotification toEntity() {
    return AppNotification(
      id: id,
      type: type,
      title: title,
      body: body,
      referenceIncidentId: referenceIncidentId,
      isRead: isRead,
      createdAt: createdAt?.toLocal() ?? DateTime.now(),
    );
  }
}
