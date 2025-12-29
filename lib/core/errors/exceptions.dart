// Exception → thuộc Data Layer
// Là lỗi phát sinh trong quá trình thực thi (runtime error)
// Là lỗi đến từ: API, server, cache, Firebase, file, permission OS,…
// Dùng để throw trong repository implementation
// → Exception là lỗi kỹ thuật (technical error)

// Base class cho tất cả Exception trong App
abstract class AppException implements Exception {
  final String message;
  final String prefix;
  final String? code;
  final StackTrace? stackTrace;

  const AppException({
    required this.message,
    required this.prefix,
    this.code,
    this.stackTrace,
  });

  @override
  String toString() =>
      '$prefix$message ${code != null ? '($code)' : ''}${stackTrace != null ? '\nStackTrace: $stackTrace' : ''}';
}

class NetworkException extends AppException {
  const NetworkException(String message, String code, StackTrace? stackTrace)
    : super(
        message: message,
        prefix: '[Network Error]: ',
        code: code,
        stackTrace: stackTrace,
      );

  /// 1. Không có internet (Wifi/3G tắt hoặc không có tín hiệu)
  factory NetworkException.noInternet(StackTrace? stackTrace) =>
      NetworkException(
        'No internet connection detected',
        'NO_CONNECTION',
        stackTrace,
      );
}

class SupabaseException extends AppException {
  const SupabaseException(String message, String code, StackTrace? stackTrace)
    : super(
        message: message,
        prefix: '[Supabase Error]: ',
        code: code,
        stackTrace: stackTrace,
      );

  factory SupabaseException.apiError(
    String message,
    String code,
    StackTrace? stackTrace,
  ) => SupabaseException(message, code, stackTrace);
}

class ServerException extends AppException {
  const ServerException(String message, String code, StackTrace? stackTrace)
    : super(
        message: message,
        prefix: '[Server Error]: ',
        code: code,
        stackTrace: stackTrace,
      );
}

class UnexpectedException extends AppException {
  const UnexpectedException(String message)
    : super(message: message, prefix: '[Unexpected Error]: ');
}
