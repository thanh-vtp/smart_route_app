/// Custom exceptions cho Caption feature
/// Được sử dụng để wrap và classify các lỗi từ external sources
library;

class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, [this.code]);
  @override
  String toString() => 'AppException: $message';
}

/// Network related exceptions
class NetworkException extends AppException {
  const NetworkException(super.message, [super.code]);

  factory NetworkException.noConnection() =>
      const NetworkException('No internet connection', 'NO_CONNECTION');

  factory NetworkException.timeout() =>
      const NetworkException('Connection timeout', 'TIMEOUT');

  factory NetworkException.serverError([String? message]) =>
      NetworkException(message ?? 'Server error', 'SERVER_ERROR');
}

/// API related exceptions
class ApiException extends AppException {
  final int? statusCode;

  const ApiException(super.message, [super.code, this.statusCode]);

  factory ApiException.quotaExceeded() =>
      const ApiException('API quota exceeded', 'QUOTA_EXCEEDED', 429);

  factory ApiException.unauthorized() =>
      const ApiException('Unauthorized API access', 'UNAUTHORIZED', 401);

  factory ApiException.rateLimited() =>
      const ApiException('Too many requests', 'RATE_LIMITED', 429);

  factory ApiException.invalidResponse() =>
      const ApiException('Invalid API response', 'INVALID_RESPONSE');

  factory ApiException.serviceUnavailable() =>
      const ApiException('AI service unavailable', 'SERVICE_UNAVAILABLE', 503);
}

/// File related exceptions
class FileException extends AppException {
  const FileException(super.message, [super.code]);

  factory FileException.notFound() =>
      const FileException('File not found', 'FILE_NOT_FOUND');

  factory FileException.permissionDenied() =>
      const FileException('Permission denied', 'PERMISSION_DENIED');

  factory FileException.corruptedFile() =>
      const FileException('Corrupted file', 'CORRUPTED_FILE');

  factory FileException.tooLarge() =>
      const FileException('File too large', 'FILE_TOO_LARGE');
}

/// Validation related exceptions
class ValidationException extends AppException {
  const ValidationException(super.message, [super.code]);

  factory ValidationException.emptyInput() =>
      const ValidationException('Input cannot be empty', 'EMPTY_INPUT');

  factory ValidationException.invalidInput(String reason) =>
      ValidationException('Invalid input: $reason', 'INVALID_INPUT');

  factory ValidationException.requiredInput(String message) =>
      ValidationException(message, 'REQUIRED_INPUT');
}

/// Cache related exceptions
class CacheException extends AppException {
  const CacheException(super.message, [super.code]);

  factory CacheException.writeError() =>
      const CacheException('Cache write error', 'CACHE_WRITE_ERROR');

  factory CacheException.readError() =>
      const CacheException('Cache read error', 'CACHE_READ_ERROR');
}
