import 'package:smart_route_app/features/map/domain/entities/incident.dart';

/// Helper class để quản lý việc hiển thị incident một cách thống nhất
/// Đảm bảo tính nhất quán giữa detail view, list view, và map markers
class IncidentDisplayHelper {
  /// Lấy display name thống nhất từ incident type
  static String getDisplayName(Incident incident) {
    return incident.type;
  }

  /// Lấy description hiển thị
  static String getDescription(Incident incident) {
    return incident.description;
  }

  static String formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    // --- VỪA XONG ---
    if (diff.inMinutes < 1) return "Vừa xong";

    // --- PHÚT TRƯỚC ---
    if (diff.inHours < 1) {
      return "${diff.inMinutes} phút trước";
    }

    // --- GIỜ TRƯỚC ---
    if (diff.inDays < 1) {
      return "${diff.inHours} giờ trước";
    }

    // --- HÔM QUA ---
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    if (_isSameDay(dateTime, yesterday)) {
      return "Hôm qua ${_hhmm(dateTime)}";
    }

    // --- TRONG 7 NGÀY ---
    if (diff.inDays < 7) {
      final weekDay = _weekdayVN(dateTime.weekday);
      return "$weekDay, ${_ddmmyyyy(dateTime)} – ${_hhmm(dateTime)}";
    }

    // --- LÂU HƠN 7 NGÀY ---
    return "${_ddmmyyyy(dateTime)} – ${_hhmm(dateTime)}";
  }

  static bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static String _hhmm(DateTime dt) =>
      "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";

  static String _ddmmyyyy(DateTime dt) =>
      "${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}";

  static String _weekdayVN(int weekday) {
    const names = {
      DateTime.monday: "Thứ Hai",
      DateTime.tuesday: "Thứ Ba",
      DateTime.wednesday: "Thứ Tư",
      DateTime.thursday: "Thứ Năm",
      DateTime.friday: "Thứ Sáu",
      DateTime.saturday: "Thứ Bảy",
      DateTime.sunday: "Chủ Nhật",
    };
    return names[weekday]!;
  }

  /// Format vị trí hiển thị thống nhất
  static String formatLocation(Incident incident) {
    final lat = double.parse(incident.latitude);
    final lon = double.parse(incident.longitude);
    return '${lat.toStringAsFixed(6)}, ${lon.toStringAsFixed(6)}';
  }
}
