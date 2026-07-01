import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String type,
    required String title,
    required String body,
    String? referenceIncidentId,
    @Default(false) bool isRead,
    required DateTime createdAt,
  }) = _AppNotification;
}
