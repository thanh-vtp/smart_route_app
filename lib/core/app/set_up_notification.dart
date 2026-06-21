import 'dart:convert';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/app/notification_provider.dart';
import 'package:smart_route_app/common/app_logger.dart';
import 'package:smart_route_app/firebase_options.dart';

// Xử lý tin nhắn BACKGROUND (App đang chạy ngầm)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AppLogger.debug(
    'Handling a background message ${message.messageId}',
    name: 'set_up_notification',
  );
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications(ProviderContainer container) async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  // KHỐI NÀY: XỬ LÝ KHI NGƯỜI DÙNG BẤM VÀO THÔNG BÁO FOREGROUND
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_notification');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  // LẮNG NGHE SỰ KIỆN CLICK VÀO LOCAL NOTIFICATION
  await flutterLocalNotificationsPlugin.initialize(
    settings: initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      if (response.payload != null) {
        AppLogger.debug(
          'Local Notification Clicked with payload: ${response.payload}',
        );
        try {
          // Parse cái string JSON lúc nãy truyền vào
          final data = jsonDecode(response.payload!);

          if (data['type'] == 'incident' && data['incident_id'] != null) {
            final incidentId = data['incident_id'] as String;

            // ID SỰ CỐ VÀO HỆ THỐNG
            // MainMapView đang listen cái provider này sẽ tự động bật BottomSheet lên!
            container
                    .read(selectedIncidentIdFromNotificationProvider.notifier)
                    .state =
                incidentId;
          }
        } catch (e) {
          AppLogger.error('Lỗi khi parse payload notification', error: e);
        }
      }
    },
  );
  // KHỐI NÀY: XỬ LÝ KHI NGƯỜI DÙNG BẤM VÀO THÔNG BÁO FOREGROUND

  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  AppLogger.debug(
    'foreground message received: ${message.messageId}',
    name: 'set_up_notification',
  );

  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      id: notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'ic_notification',
          color: const Color(0xFF003265),
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),

      // DATA THÀNH JSON STRING ĐỂ TRUYỀN VÀO PAYLOAD
      payload: jsonEncode(message.data),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
