import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:smart_route_app/core/resources/lib/supabase.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/data/datasources/user_device_datasource.dart';
import 'package:smart_route_app/features/auth/presentation/providers/data/remote_datasource_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fcm_token_service.g.dart';

/// Provider cho FCM Token Service
@Riverpod(keepAlive: true)
FCMTokenService fcmTokenService(FcmTokenServiceRef ref) {
  final datasource = ref.watch(userDeviceDatasourceProvider);

  final service = FCMTokenService(datasource);

  ref.onDispose(service.dispose);

  return service;
}

class FCMTokenService {
  final UserDeviceDatasource _deviceDatasource;

  StreamSubscription<String>? _tokenRefreshSubscription;

  FCMTokenService(this._deviceDatasource);

  Future<void> initialize() async {
    _listenTokenRefresh();
  }

  /// Đồng bộ token hiện tại (dùng khi app khởi động, hoặc user vừa đăng nhập)
  Future<void> syncCurrentToken() async {
    try {
      final user = supabase.auth.currentUser;

      if (user == null) return;

      final token = await FirebaseMessaging.instance.getToken();

      if (token == null) return;

      final deviceId = await _getUniqueDeviceId();

      await _deviceDatasource.saveDevice(
        userId: user.id,
        deviceId: deviceId,
        token: token,
      );
      AppLogger.info('FCM token synced');
    } catch (e, st) {
      AppLogger.error('Sync FCM token failed', error: e, stackTrace: st);
    }
  }

  /// Lắng nghe sự kiện refresh token từ FCM
  void _listenTokenRefresh() {
    _tokenRefreshSubscription = FirebaseMessaging.instance.onTokenRefresh
        .listen((newToken) async {
          try {
            final user = supabase.auth.currentUser;

            if (user == null) return;

            final deviceId = await _getUniqueDeviceId();

            await _deviceDatasource.saveDevice(
              userId: user.id,
              token: newToken,
              deviceId: deviceId,
            );

            AppLogger.info('FCM token refreshed');
          } catch (e, st) {
            AppLogger.error(
              'FCM token refresh failed',
              error: e,
              stackTrace: st,
            );
          }
        });
  }

  /// Remove current device when logout
  Future<void> removeCurrentDevice() async {
    try {
      final user = supabase.auth.currentUser;

      if (user == null) return;

      final deviceId = await _getUniqueDeviceId();

      await _deviceDatasource.removeDevice(userId: user.id, deviceId: deviceId);

      AppLogger.info('Current device removed');
    } catch (e, st) {
      AppLogger.error('Remove current device failed', error: e, stackTrace: st);
    }
  }

  Future<String> _getUniqueDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;

      return info.fingerprint;
    }

    if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;

      return info.identifierForVendor ?? 'unknown_ios_device';
    }

    return 'unknown_device';
  }

  void dispose() {
    _tokenRefreshSubscription?.cancel();
  }
}
