import 'package:smart_route_app/core/errors/failures.dart';

/// Maps Failure to user-friendly messages (Presentation layer)
/// Tách biệt logic hiển thị khỏi domain layer
class FailureMapper {
  const FailureMapper._();

  /// Trả về chuỗi thông báo lỗi thân thiện với User
  static String toUserMessage(Failure failure) {
    return switch (failure) {
      NetworkFailure() => _mapNetworkFailure(failure),
      ValidationFailure() => _mapValidationFailure(failure),
      PermissionFailure() => _mapPermissionFailure(failure),
      UnexpectedFailure() => 'Đã có lỗi xảy ra. Vui lòng thử lại sau.',
    };
  }

  static String _mapNetworkFailure(NetworkFailure failure) {
    return switch (failure.code) {
      'NO_INTERNET' => 'Không có kết nối mạng. Vui lòng kiểm tra Wifi/4G.',
      'TIMEOUT' => 'Kết nối quá hạn. Vui lòng thử lại sau.',
      'UNAUTHORIZED' => 'Phiên đăng nhập hết hạn. Vui lòng đăng nhập lại.',
      'SERVER_ERROR' => 'Hệ thống đang bảo trì. Vui lòng thử lại sau.',
      'NOT_FOUND' => 'Dữ liệu không tồn tại hoặc đã bị xóa.',
      _ => 'Lỗi kết nối. Vui lòng thử lại.',
    };
  }

  static String _mapValidationFailure(ValidationFailure failure) {
    return switch (failure.code) {
      'MISSING_USER_INFO' =>
        'Thông tin người dùng không hợp lệ. Vui lòng đăng nhập lại.',
      'INVALID_USER_DATA' =>
        'Thông tin tài khoản lỗi. Vui lòng đăng xuất và đăng nhập lại.',
      'INVALID_INPUT' =>
        'Dữ liệu nhập chưa đầy đủ (Mô tả). Vui lòng kiểm tra lại.',
      _ => 'Dữ liệu nhập không hợp lệ. Vui lòng kiểm tra lại.',
    };
  }

  static String _mapPermissionFailure(PermissionFailure failure) {
    return switch (failure.code) {
      'DELETE_DENIED_NOT_OWNER' =>
        'Bạn không có quyền xóa báo cáo của người khác.',
      'UPDATE_DENIED_NOT_OWNER' =>
        'Bạn không có quyền cập nhật báo cáo của người khác.',
      _ => 'Bạn không có quyền thực hiện thao tác này.',
    };
  }

  /// Debug message cho developer
  static String toDebugMessage(Failure failure) {
    return '${failure.code}: ${failure.technicalMessage}';
  }
}
