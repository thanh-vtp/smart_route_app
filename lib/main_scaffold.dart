import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/app/notification_provider.dart';
import 'package:smart_route_app/core/app/set_up_notification.dart';
import 'package:smart_route_app/common/app_logger.dart';

  class MainScaffold extends ConsumerStatefulWidget {
    final StatefulNavigationShell navigationShell;
    const MainScaffold({super.key, required this.navigationShell});

    @override
    ConsumerState<ConsumerStatefulWidget> createState() => _MainScaffoldState();
  }

  class _MainScaffoldState extends ConsumerState<MainScaffold> {
    @override
    void initState() {
      super.initState();

      _requestPermissions();

      _setupFirebaseMessaging();
    }

    void _setupFirebaseMessaging() {
      // Xử lý tin nhắn TERMINATED / KILLED (App đã bị tắt hoàn toàn)
      // user chạm thông báo để mở App
      FirebaseMessaging.instance.getInitialMessage().then((
        RemoteMessage? message,
      ) {
        if (message != null) {
          _handleNotificationClick(message);
        }
      });

      // Xử lý khi nhấn vào thông báo (App đang chạy ngầm),
      // user chạm thông báo để quay lại App
      // được kích hoạt để điều hướng (Navigate).
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        AppLogger.debug(
          'Một sự kiện onMessageOpenedApp mới đã được published!',
          name: 'MainScaffold',
        );
        _handleNotificationClick(message);
      });

      // Xử lý tin nhắn FOREGROUND (App đang mở trên màn hình)
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        showFlutterNotification(message);
      });
    }

    void _handleNotificationClick(RemoteMessage message) {
      AppLogger.info(
        'Thông báo được nhấn, Data: ${message.data}',
        name: 'MainScaffold',
      );

      // Kiểm tra xem payload có chứa incident_id không (Đã setup trong Edge Function)
      if (message.data['type'] == 'incident' &&
          message.data['incident_id'] != null) {
        final incidentId = message.data['incident_id'] as String;

        // 1. Ép GoRouter chuyển về Tab 0 (Explore / Bản đồ)
        widget.navigationShell.goBranch(0, initialLocation: true);

        // 2. Truyền ID sự cố vào Provider để MainMapView bắt lấy và mở BottomSheet
        // chờ 1s để MainMapView render xong rồi mới kích hoạt State
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (!mounted) return;
          ref.read(selectedIncidentIdFromNotificationProvider.notifier).state =
              incidentId;
        });
      }
    }

    Future<void> _requestPermissions() async {
      // Xin quyền hiện thông báo
      NotificationSettings settings = await FirebaseMessaging.instance
          .requestPermission(
            announcement: true,
            carPlay: true,
            criticalAlert: true,
          );

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        await FirebaseMessaging.instance.setAutoInitEnabled(true);
        AppLogger.info('On FCM: ${settings.authorizationStatus}');
      }
    }

    @override
    Widget build(BuildContext context) {
      final cs = Theme.of(context).colorScheme;
      return Scaffold(
        body: widget.navigationShell,

        // Bottom Navigation (MD3)
        bottomNavigationBar: NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: (int index) {
            widget.navigationShell.goBranch(
              index,
              initialLocation: index == widget.navigationShell.currentIndex,
            );
          },
          backgroundColor: cs.surfaceContainer,
          indicatorColor: cs.secondaryContainer,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.report_outlined),
              selectedIcon: Icon(Icons.report),
              label: 'Reports',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_none_outlined),
              selectedIcon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
        ),
      );
    }
  }
