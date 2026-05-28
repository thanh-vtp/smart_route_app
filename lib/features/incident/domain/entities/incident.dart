import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident.freezed.dart';

// freezed: 3.2.3
// dart run build_runner build --delete-conflicting-outputs

/// Entity đại diện cho 1 điểm sự cố trên bản đồ
@freezed
class Incident with _$Incident {
  const factory Incident({
    required String id,
    required double latitude, // vĩ độ
    required double longitude, // kinh độ
    required String type, // loại sự cố traffic, accident, construction, etc.
    required String severity, // mức độ sự cố
    required String description, // mô tả sự cố
    required DateTime reportedTime, // thời gian báo cáo
    String? reportedBy, // tên người báo cáo (từ Google account)
    String? reportedByUid, // user ID người báo cáo
    DateTime? creationDate, // Thời gian ghi vào server
    DateTime? editDate, // Thời gian cập nhật lần cuối
  }) = _Incident;
}
