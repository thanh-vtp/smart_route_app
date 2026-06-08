import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:smart_route_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:smart_route_app/features/notification/presentation/providers/data/remote_datasource_providers.dart';
part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(NotificationRepositoryRef ref) {
  final remoteDataSource = ref.watch(notificationRemoteDataSourceProvider);
  return NotificationRepositoryImpl(remoteDataSource);
}
