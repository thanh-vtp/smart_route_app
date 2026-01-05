import 'dart:io';
import '../../../../core/errors/failures.dart';

class ArcGISExceptionHandler {
  /// Convert exceptions to appropriate Failure types
  static Failure handleException(Object exception, StackTrace? stackTrace) {
    // If it's already an ArcGISFailure, return it as-is
    if (exception is ArcGISFailure) {
      return exception;
    } else if (exception is Failure) {
      return exception;
    } else if (exception is SocketException) {
      return _handleSocketException(exception, stackTrace);
    } else if (exception is HttpException) {
      return _handleHttpException(exception, stackTrace);
    } else if (exception is FormatException) {
      return ArcGISFailure.apiError('Invalid response format');
    } else if (exception is ArgumentError) {
      return ValidationFailure.invalidInput(
        exception.message?.toString() ?? 'Unknown field',
      );
    } else if (exception.toString().contains('TimeoutException')) {
      return ArcGISFailure.timeout();
    } else if (exception.toString().contains('Client is already closed')) {
      return ArcGISFailure.connectionFailed();
    } else if (exception.toString().contains('Connection attempt cancelled')) {
      return ArcGISFailure.connectionFailed();
    } else if (exception.toString().contains('Failed host lookup')) {
      return NetworkFailure.noInternet();
    } else {
      return UnexpectedFailure(exception, stackTrace);
    }
  }

  static Failure _handleSocketException(
    SocketException exception,
    StackTrace? stackTrace,
  ) {
    if (exception.message.contains('Failed host lookup')) {
      return NetworkFailure.noInternet();
    } else if (exception.message.contains('Connection refused')) {
      return ArcGISFailure.serviceUnavailable();
    } else if (exception.message.contains('Connection timeout')) {
      return ArcGISFailure.timeout();
    } else {
      return ArcGISFailure.connectionFailed();
    }
  }

  static Failure _handleHttpException(
    HttpException exception,
    StackTrace? stackTrace,
  ) {
    return ArcGISFailure.apiError(exception.message);
  }

  /// Handle ArcGIS API specific errors from response
  static Failure handleApiError(Map<String, dynamic> errorData) {
    final code = errorData['code'] as int?;
    final message = errorData['message'] as String? ?? 'Unknown API error';

    switch (code) {
      case 400:
        return ValidationFailure.invalidInput('API parameters');
      case 401:
        return ArcGISFailure.invalidApiKey();
      case 403:
        return PermissionFailure.denied(
          code: 'ARCGIS_FORBIDDEN',
          technicalMessage: message,
        );
      case 429:
        return ArcGISFailure.rateLimitExceeded();
      case 500:
      case 502:
      case 503:
        return ArcGISFailure.serviceUnavailable();
      default:
        return ArcGISFailure.apiError(message);
    }
  }

  /// Handle HTTP status codes
  static Failure handleHttpStatus(int statusCode, String? reasonPhrase) {
    switch (statusCode) {
      case 400:
        return ValidationFailure.invalidInput('Request parameters');
      case 401:
        return ArcGISFailure.invalidApiKey();
      case 403:
        return PermissionFailure.denied(
          code: 'ARCGIS_FORBIDDEN',
          technicalMessage: reasonPhrase,
        );
      case 404:
        return ArcGISFailure.noResults();
      case 429:
        return ArcGISFailure.rateLimitExceeded();
      case 500:
      case 502:
      case 503:
        return ArcGISFailure.serviceUnavailable();
      default:
        return ArcGISFailure.apiError('HTTP $statusCode: $reasonPhrase');
    }
  }
}
