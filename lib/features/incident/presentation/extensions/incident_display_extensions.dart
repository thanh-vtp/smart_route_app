import 'package:flutter/material.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/presentation/models/incident_type_config.dart';

/// Extension để thêm display properties cho Incident entity
extension IncidentDisplay on Incident {
  /// Display name cho loại sự cố (traffic -> "Kẹt xe")
  IncidentTypeConfig get typeConfig => IncidentTypes.getById(type);

  String get typeDisplayName => typeConfig.displayName;
  Color get color => typeConfig.color;
  Color get backgroundColor => typeConfig.backgroundColor;

  /// Display name cho mức độ (low -> "Thấp")
  String get severityDisplayName {
    const names = {'low': 'Thấp', 'medium': 'Trung bình', 'high': 'Cao'};
    return names[severity.toLowerCase()] ?? severity;
  }

  String formatCustomDate(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 1) return "Vừa xong";
    if (diff.inHours < 1) {
      return "${diff.inMinutes} phút trước";
    }
    if (diff.inDays < 1) {
      return "${diff.inHours} giờ trước";
    }
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

  String get formattedReportedTime => formatCustomDate(reportedTime);
  String get formattedEditTime => formatCustomDate(editDate ?? reportedTime);

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _hhmm(DateTime dt) =>
      "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";

  String _ddmmyyyy(DateTime dt) =>
      "${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}";

  String _weekdayVN(int weekday) {
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
}
