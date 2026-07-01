import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/notification/domain/usecases/get_notifications_usecase.dart';
import 'package:smart_route_app/features/notification/domain/usecases/mark_all_notifications_read_usecase.dart';
import 'package:smart_route_app/features/notification/domain/usecases/mark_notification_read_usecase.dart';
import 'package:smart_route_app/features/notification/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

@Riverpod(keepAlive: true)
GetNotificationsUseCase getNotificationsUseCase(Ref ref) {
  return GetNotificationsUseCase(ref.watch(notificationRepositoryProvider));
}

@Riverpod(keepAlive: true)
MarkNotificationReadUseCase markNotificationReadUseCase(Ref ref) {
  return MarkNotificationReadUseCase(ref.watch(notificationRepositoryProvider));
}

@Riverpod(keepAlive: true)
MarkAllNotificationsReadUseCase markAllNotificationsReadUseCase(Ref ref) {
  return MarkAllNotificationsReadUseCase(
    ref.watch(notificationRepositoryProvider),
  );
}
