import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:smart_route_app/core/resources/lib/supabase.dart';

abstract class UserDeviceDatasource {
  /// Save/update current device FCM token
  Future<void> saveDevice({
    required String userId,
    required String deviceId,
    required String token,
  });

  /// Remove current device
  Future<void> removeDevice({required String userId, required String deviceId});
}

class UserDeviceDatasourceImpl implements UserDeviceDatasource {
  @override
  Future<void> saveDevice({
    required String userId,
    required String deviceId,
    required String token,
  }) async {
    await supabase.from('user_devices').upsert({
      'user_id': userId,
      'device_id': deviceId,
      'fcm_token': token,
      'device_name': await _getDeviceName(),
      'device_type': Platform.operatingSystem,
      'last_active_at': DateTime.now().toIso8601String(),
    }, onConflict: 'user_id,device_id');
  }

  @override
  Future<void> removeDevice({
    required String userId,
    required String deviceId,
  }) async {
    await supabase
        .from('user_devices')
        .delete()
        .eq('user_id', userId)
        .eq('device_id', deviceId);
  }

  Future<String> _getDeviceName() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;

      return '${info.manufacturer} ${info.model}';
    }

    if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;

      return info.name;
    }

    return 'Unknown Device';
  }
}
