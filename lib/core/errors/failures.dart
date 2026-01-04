import 'package:equatable/equatable.dart';

// Failure → thuộc Domain Layer
// Là lỗi dạng business logic hoặc lỗi được chuẩn hóa
// Gửi về UseCase, Bloc, UI
// Không liên quan đến framework, không liên quan đến dữ liệu platform
// Luôn là object bất biến (immutable)
// → Failure là lỗi business hoặc lỗi đã convert từ kỹ thuật sang domain-safe

abstract class Failure extends Equatable {
  final String? technicalMessage;
  final String? code;
  final StackTrace? stackTrace;

  const Failure({this.technicalMessage, this.code, this.stackTrace});

  @override
  List<Object?> get props => [technicalMessage, code, stackTrace];
}

/// Lỗi liên quan đến network/API
final class NetworkFailure extends Failure {
  const NetworkFailure({super.technicalMessage, super.code, super.stackTrace});

  factory NetworkFailure.noInternet() => const NetworkFailure(
    code: 'NO_INTERNET',
    technicalMessage: 'SocketException: No connection',
  );

  // factory NetworkFailure.unauthorized() => const NetworkFailure(
  //   code: 'UNAUTHORIZED',
  //   technicalMessage: 'User not authenticated',
  // );
}

/// Lỗi liên quan đến validation dữ liệu
final class ValidationFailure extends Failure {
  const ValidationFailure({super.technicalMessage, super.code});

  factory ValidationFailure.invalidInput(String field) => ValidationFailure(
    code: 'INVALID_INPUT',
    technicalMessage: 'Field $field is invalid',
  );

  factory ValidationFailure.invalidUserData() => const ValidationFailure(
    code: 'INVALID_USER_DATA',
    technicalMessage: 'Missing UID/Email',
  );

  factory ValidationFailure.missingUserInfo() => const ValidationFailure(
    code: 'MISSING_USER_INFO',
    technicalMessage: 'Missing User ID',
  );
}

/// Lỗi liên quan đến permissions
final class PermissionFailure extends Failure {
  const PermissionFailure({
    super.technicalMessage,
    super.code,
    super.stackTrace,
  });

  factory PermissionFailure.denied({String? code, String? technicalMessage}) =>
      PermissionFailure(
        code: code ?? 'PERMISSION_DENIED',
        technicalMessage: technicalMessage ?? 'Access denied',
      );
}

final class SupabaseFailure extends Failure {
  const SupabaseFailure({super.technicalMessage, super.code, super.stackTrace});

  factory SupabaseFailure.apiError(String message, String code) =>
      SupabaseFailure(code: code, technicalMessage: message);
  factory SupabaseFailure.unauthorized() => const SupabaseFailure(
    code: 'UNAUTHORIZED',
    technicalMessage: 'User not authenticated',
  );
}

/// Lỗi liên quan đến ArcGIS services
final class ArcGISFailure extends Failure {
  const ArcGISFailure({super.technicalMessage, super.code, super.stackTrace});

  factory ArcGISFailure.connectionFailed() => const ArcGISFailure(
    code: 'CONNECTION_FAILED',
    technicalMessage: 'Cannot connect to ArcGIS services',
  );

  factory ArcGISFailure.timeout() =>
      const ArcGISFailure(code: 'TIMEOUT', technicalMessage: 'Request timeout');

  factory ArcGISFailure.apiError(String message) => ArcGISFailure(
    code: 'API_ERROR',
    technicalMessage: 'ArcGIS API Error: $message',
  );

  factory ArcGISFailure.invalidApiKey() => const ArcGISFailure(
    code: 'INVALID_API_KEY',
    technicalMessage: 'Invalid or missing ArcGIS API key',
  );

  factory ArcGISFailure.rateLimitExceeded() => const ArcGISFailure(
    code: 'RATE_LIMIT_EXCEEDED',
    technicalMessage: 'ArcGIS API rate limit exceeded',
  );

  factory ArcGISFailure.serviceUnavailable() => const ArcGISFailure(
    code: 'SERVICE_UNAVAILABLE',
    technicalMessage: 'ArcGIS service temporarily unavailable',
  );

  factory ArcGISFailure.invalidCoordinates() => const ArcGISFailure(
    code: 'INVALID_COORDINATES',
    technicalMessage: 'Invalid latitude or longitude values',
  );

  factory ArcGISFailure.noResults() => const ArcGISFailure(
    code: 'NO_RESULTS',
    technicalMessage: 'No results found for the query',
  );

  factory ArcGISFailure.geocodingFailed(String address) => ArcGISFailure(
    code: 'GEOCODING_FAILED',
    technicalMessage: 'Failed to geocode address: $address',
  );

  factory ArcGISFailure.reverseGeocodingFailed() => const ArcGISFailure(
    code: 'REVERSE_GEOCODING_FAILED',
    technicalMessage: 'Failed to reverse geocode coordinates',
  );

  factory ArcGISFailure.routingFailed() => const ArcGISFailure(
    code: 'ROUTING_FAILED',
    technicalMessage: 'Failed to calculate route',
  );

  factory ArcGISFailure.imageryFailed() => const ArcGISFailure(
    code: 'IMAGERY_FAILED',
    technicalMessage: 'Failed to get satellite imagery',
  );

  factory ArcGISFailure.nearbySearchFailed() => const ArcGISFailure(
    code: 'NEARBY_SEARCH_FAILED',
    technicalMessage: 'Failed to find nearby places',
  );

  factory ArcGISFailure.missingApiKey() => const ArcGISFailure(
    code: 'MISSING_API_KEY',
    technicalMessage: 'ARCGIS_API_KEY not found in environment variables',
  );

  factory ArcGISFailure.invalidRequest(String message) => ArcGISFailure(
    code: 'INVALID_REQUEST',
    technicalMessage: 'Invalid request: $message',
  );

  factory ArcGISFailure.httpError(int statusCode, String? reasonPhrase) =>
      ArcGISFailure(
        code: 'HTTP_ERROR',
        technicalMessage:
            'HTTP $statusCode: ${reasonPhrase ?? 'Unknown error'}',
      );

  factory ArcGISFailure.parseError(String message) => ArcGISFailure(
    code: 'PARSE_ERROR',
    technicalMessage: 'Failed to parse response: $message',
  );

  factory ArcGISFailure.cacheError(String message) => ArcGISFailure(
    code: 'CACHE_ERROR',
    technicalMessage: 'Cache operation failed: $message',
  );

  factory ArcGISFailure.insufficientStops() => const ArcGISFailure(
    code: 'INSUFFICIENT_STOPS',
    technicalMessage: 'At least 2 stops are required for routing',
  );

  factory ArcGISFailure.unknown() => const ArcGISFailure(
    code: 'UNKNOWN',
    technicalMessage: 'An unknown error occurred',
  );
}

final class CacheFailure extends Failure {
  const CacheFailure({super.technicalMessage, super.code, super.stackTrace});

  factory CacheFailure.noData() => const CacheFailure(
    code: 'NO_CACHE_DATA',
    technicalMessage: 'No cached data available',
  );
}

final class AuthFailure extends Failure {
  const AuthFailure(
    String s, {
    super.technicalMessage,
    super.code,
    super.stackTrace,
  });
}

/// Lỗi không xác định
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure(Object error, StackTrace? st)
    : super(code: 'UNKNOWN', technicalMessage: '$error', stackTrace: st);
}
