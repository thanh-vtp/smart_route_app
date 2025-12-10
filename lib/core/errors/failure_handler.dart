import 'dart:async';
import 'dart:io';

import 'package:smart_route_app/core/errors/failures.dart';

/// Centralized exception to failure converter
/// Gom logic try-catch vào một chỗ để Repository gọn gàng
class FailureHandler {
  const FailureHandler._();

  /// Convert any exception/error to appropriate Failure
  static Failure handle(Object error, [StackTrace? stackTrace]) {
    // Already a Failure, return as-is
    if (error is Failure) return error;

    // Network errors
    if (error is SocketException) {
      return NetworkFailure.noInternet();
    }

    if (error is TimeoutException) {
      return NetworkFailure.timeout();
    }

    // String-based detection (fallback)
    final message = error.toString();
    if (message.contains('SocketException') ||
        message.contains('NetworkException')) {
      return NetworkFailure.noInternet();
    }

    // Default to unexpected
    return UnexpectedFailure(error, stackTrace);
  }
}

/// Extension for convenient usage in repositories
extension FailureHandlerExtension on Object {
  Failure toFailure([StackTrace? stackTrace]) =>
      FailureHandler.handle(this, stackTrace);
}
