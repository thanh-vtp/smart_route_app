import 'package:hooks_riverpod/legacy.dart';

/// Provider này lưu trữ ID của sự cố khi người dùng bấm vào thông báo.
/// Nó đóng vai trò làm cầu nối giữa hệ thống Firebase và MainMapView.
final selectedIncidentIdFromNotificationProvider = StateProvider<String?>(
  (ref) => null,
);
