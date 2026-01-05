import 'package:smart_route_app/core/errors/failures.dart';

/// Helper function to convert Failure to user-friendly Vietnamese message
String getFailureMessage(Failure failure) {
  if (failure is ArcGISFailure) {
    return _getArcGISFailureMessage(failure);
  } else if (failure is NetworkFailure) {
    return 'Lỗi kết nối mạng. Vui lòng kiểm tra internet.';
  } else if (failure is ValidationFailure) {
    return 'Dữ liệu không hợp lệ: ${failure.technicalMessage}';
  } else if (failure is PermissionFailure) {
    return 'Không có quyền truy cập.';
  } else if (failure is SupabaseFailure) {
    return 'Lỗi server: ${failure.technicalMessage}';
  } else if (failure is UnexpectedFailure) {
    return 'Lỗi không xác định: ${failure.technicalMessage}';
  }
  return failure.technicalMessage ?? 'Lỗi không xác định';
}

String _getArcGISFailureMessage(ArcGISFailure failure) {
  return switch (failure.code) {
    'CONNECTION_FAILED' => 'Không thể kết nối đến ArcGIS. Kiểm tra internet.',
    'TIMEOUT' => 'Kết nối bị timeout. Vui lòng thử lại.',
    'INVALID_API_KEY' => 'API key không hợp lệ hoặc hết hạn.',
    'RATE_LIMIT_EXCEEDED' => 'Đã vượt quá giới hạn API. Thử lại sau.',
    'SERVICE_UNAVAILABLE' => 'Dịch vụ ArcGIS tạm thời không khả dụng.',
    'INVALID_COORDINATES' => 'Tọa độ không hợp lệ.',
    'NO_RESULTS' => 'Không tìm thấy kết quả.',
    'GEOCODING_FAILED' => 'Không thể tìm địa chỉ.',
    'REVERSE_GEOCODING_FAILED' => 'Không thể lấy thông tin vị trí.',
    'ROUTING_FAILED' => 'Không thể tính toán đường đi.',
    'IMAGERY_FAILED' => 'Không thể lấy hình ảnh vệ tinh.',
    'NEARBY_SEARCH_FAILED' => 'Không thể tìm địa điểm gần đây.',
    'MISSING_API_KEY' => 'Thiếu API key ArcGIS.',
    'HTTP_ERROR' => 'Lỗi HTTP: ${failure.technicalMessage}',
    'PARSE_ERROR' => 'Lỗi xử lý dữ liệu từ server.',
    'INSUFFICIENT_STOPS' => 'Cần ít nhất 2 điểm để tính đường đi.',
    'API_ERROR' => 'Lỗi ArcGIS: ${failure.technicalMessage}',
    _ => failure.technicalMessage ?? 'Lỗi không xác định',
  };
}
