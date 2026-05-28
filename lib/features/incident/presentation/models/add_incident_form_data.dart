import 'package:smart_route_app/features/incident/domain/entities/incident.dart';

/// Model quản lý dữ liệu form thêm incident
class AddIncidentFormData {
  final String typeId; // Lưu theo id: 'traffic', 'accident', etc.
  final String severityId; // 'low', 'medium', 'high'
  final String description;
  final String customTypeDescription; // Cho trường hợp type = 'other'
  final double latitude;
  final double longitude;

  const AddIncidentFormData({
    this.typeId = 'traffic',
    this.severityId = 'medium',
    this.description = '',
    this.customTypeDescription = '',
    required this.latitude,
    required this.longitude,
  });

  /// Tạo description cuối cùng để lưu DB
  String get finalDescription {
    if (typeId == 'other' && customTypeDescription.isNotEmpty) {
      final base = customTypeDescription.trim();
      return description.isNotEmpty ? '$base - $description' : base;
    }
    return description.isNotEmpty ? description : 'Không có mô tả';
  }

  /// Copy với giá trị mới
  AddIncidentFormData copyWith({
    String? typeId,
    String? severityId,
    String? description,
    String? customTypeDescription,
    double? latitude,
    double? longitude,
  }) {
    return AddIncidentFormData(
      typeId: typeId ?? this.typeId,
      severityId: severityId ?? this.severityId,
      description: description ?? this.description,
      customTypeDescription:
          customTypeDescription ?? this.customTypeDescription,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  /// Chuyển sang Incident entity để lưu DB
  Incident toIncident() {
    return Incident(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      latitude: latitude,
      longitude: longitude,
      type: typeId,
      severity: severityId,
      description: finalDescription,
      reportedTime: DateTime.now(),
    );
  }

  /// Validate form
  bool get isValid {
    if (typeId == 'other' && customTypeDescription.trim().isEmpty) {
      return false;
    }
    return true;
  }

  /// Lỗi validation
  String? get validationError {
    if (typeId == 'other' && customTypeDescription.trim().isEmpty) {
      return 'Vui lòng nhập loại sự cố';
    }
    return null;
  }
}
