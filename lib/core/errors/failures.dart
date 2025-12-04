import 'package:equatable/equatable.dart';

/// Base class cho tất cả failures trong domain layer
/// Sử dụng Equatable để so sánh failures
abstract class Failure extends Equatable {
  final String message;
  final StackTrace? stackTrace;

  const Failure({required this.message, this.stackTrace});

  @override
  List<Object?> get props => [message];
}

// ============================================================================
// NETWORK FAILURES
// ============================================================================

/// Lỗi liên quan đến network/API
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.stackTrace});

  factory NetworkFailure.noInternet() {
    return const NetworkFailure(
      message: 'Không có kết nối internet. Vui lòng kiểm tra lại.',
    );
  }

  factory NetworkFailure.timeout() {
    return const NetworkFailure(message: 'Kết nối timeout. Vui lòng thử lại.');
  }

  factory NetworkFailure.serverError([String? details]) {
    return NetworkFailure(
      message: details ?? 'Lỗi server. Vui lòng thử lại sau.',
    );
  }

  factory NetworkFailure.unauthorized([String? details]) {
    return NetworkFailure(
      message: details ?? 'Bạn cần đăng nhập để thực hiện thao tác này.',
    );
  }

  factory NetworkFailure.badRequest([String? details]) {
    return NetworkFailure(
      message: details ?? 'Yêu cầu không hợp lệ. Vui lòng kiểm tra lại.',
    );
  }

  factory NetworkFailure.notFound([String? details]) {
    return NetworkFailure(
      message: details ?? 'Không tìm thấy tài nguyên yêu cầu.',
    );
  }
}

// ============================================================================
// CACHE/STORAGE FAILURES
// ============================================================================

/// Lỗi liên quan đến local storage
class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.stackTrace});

  factory CacheFailure.readError() {
    return const CacheFailure(message: 'Không thể đọc dữ liệu từ bộ nhớ.');
  }

  factory CacheFailure.writeError() {
    return const CacheFailure(message: 'Không thể lưu dữ liệu vào bộ nhớ.');
  }

  factory CacheFailure.deleteError() {
    return const CacheFailure(message: 'Không thể xóa dữ liệu từ bộ nhớ.');
  }

  factory CacheFailure.notFound(String itemName) {
    return CacheFailure(message: 'Không tìm thấy $itemName trong bộ nhớ.');
  }
}

// ============================================================================
// VALIDATION FAILURES
// ============================================================================

/// Lỗi validation input
class ValidationFailure extends Failure {
  const ValidationFailure({required super.message, super.stackTrace});

  factory ValidationFailure.emptyField(String fieldName) {
    return ValidationFailure(message: '$fieldName không được để trống.');
  }

  factory ValidationFailure.invalidFormat(String fieldName) {
    return ValidationFailure(message: 'Định dạng $fieldName không hợp lệ.');
  }

  factory ValidationFailure.tooShort(String fieldName, int minLength) {
    return ValidationFailure(
      message: '$fieldName phải có ít nhất $minLength ký tự.',
    );
  }

  factory ValidationFailure.tooLong(String fieldName, int maxLength) {
    return ValidationFailure(
      message: '$fieldName không được vượt quá $maxLength ký tự.',
    );
  }
}

// ============================================================================
// AI/GENERATION FAILURES
// ============================================================================

/// Lỗi liên quan đến AI caption generation
class GenerationFailure extends Failure {
  const GenerationFailure({required super.message, super.stackTrace});

  factory GenerationFailure.apiKeyMissing() {
    return const GenerationFailure(
      message: 'API key chưa được cấu hình. Vui lòng kiểm tra lại.',
    );
  }

  factory GenerationFailure.invalidInput() {
    return const GenerationFailure(
      message: 'Input không hợp lệ. Vui lòng chọn ảnh và nhập thông tin.',
    );
  }

  factory GenerationFailure.quotaExceeded() {
    return const GenerationFailure(
      message: 'Đã vượt quá giới hạn sử dụng API. Vui lòng thử lại sau.',
    );
  }

  factory GenerationFailure.contentBlocked() {
    return const GenerationFailure(
      message: 'Nội dung bị chặn bởi AI safety filter.',
    );
  }

  factory GenerationFailure.generationError([String? details]) {
    return GenerationFailure(
      message: details ?? 'Không thể tạo caption. Vui lòng thử lại.',
    );
  }
}

// ============================================================================
// PERMISSION FAILURES
// ============================================================================

/// Lỗi liên quan đến permissions
class PermissionFailure extends Failure {
  const PermissionFailure({required super.message, super.stackTrace});

  factory PermissionFailure.denied(String permissionName) {
    return PermissionFailure(message: 'Quyền $permissionName bị từ chối.');
  }

  factory PermissionFailure.permanentlyDenied(String permissionName) {
    return PermissionFailure(
      message:
          'Quyền $permissionName bị từ chối vĩnh viễn. Vui lòng cấp quyền trong Settings.',
    );
  }
}

// ============================================================================
// UNEXPECTED FAILURES
// ============================================================================

/// Lỗi không xác định
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message, super.stackTrace});

  factory UnexpectedFailure.fromException(Object exception, [StackTrace? st]) {
    return UnexpectedFailure(
      message: 'Lỗi không xác định: ${exception.toString()}',
      stackTrace: st,
    );
  }
}

// ============================================================================
// HELPER EXTENSIONS
// ============================================================================

/// Extension để convert Exception thành Failure
extension FailureFromException on Object {
  Failure toFailure([StackTrace? stackTrace]) {
    if (this is Failure) {
      return this as Failure;
    }

    final message = toString();

    // Network errors
    if (message.contains('SocketException') ||
        message.contains('NetworkException')) {
      return NetworkFailure.noInternet();
    }

    if (message.contains('TimeoutException')) {
      return NetworkFailure.timeout();
    }

    // Storage errors
    if (message.contains('FileSystemException') ||
        message.contains('StorageException')) {
      return CacheFailure.writeError();
    }

    // Default to unexpected
    return UnexpectedFailure.fromException(this, stackTrace);
  }
}
