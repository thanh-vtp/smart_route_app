import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

/// Centralized logging utility following Clean Architecture and Flutter/Dart best practices
///
/// LOGGING GUIDELINES BY LAYER:
///
/// 1. PRESENTATION LAYER (UI):
///    - Use AppLogger.ui() for user interactions, navigation, form validation
///    - Use AppLogger.debug() for widget lifecycle, state changes
///    - AVOID: print(), direct debugPrint(), developer.log()
///
/// 2. DOMAIN LAYER (Business Logic):
///    - Use AppLogger.info() for business operations start/complete
///    - Use AppLogger.warning() for business rule violations
///    - Use AppLogger.error() for business exceptions
///    - AVOID: All direct logging methods
///
/// 3. DATA LAYER (Repositories, DataSources):
///    - Use AppLogger.repository() for repository operations
///    - Use AppLogger.data() for API calls, database operations
///    - Use AppLogger.debugRaw() for technical details (JSON, parsing)
///    - AVOID: print(), direct debugPrint()
///
/// 4. CORE/INFRASTRUCTURE:
///    - Use AppLogger.info() for service initialization
///    - Use AppLogger.error() for critical system errors
///    - Use AppLogger.debugRaw() for low-level technical details
///    - AVOID: print(), direct debugPrint()

class AppLogger {
  static const String _defaultName = 'AppLogger';

  /// Debug level logging - only in debug mode
  static void debug(
    String message, {
    String? name,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      developer.log(
        message,
        name: name ?? _defaultName,
        level: 700,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Info level logging - always logged
  static void info(
    String message, {
    String? name,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: name ?? _defaultName,
      level: 800,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Warning level logging
  static void warning(
    String message, {
    String? name,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: name ?? _defaultName,
      level: 900,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Error level logging
  static void error(
    String message, {
    String? name,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: name ?? _defaultName,
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Critical error logging
  static void critical(
    String message, {
    String? name,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: name ?? _defaultName,
      level: 1200,
      error: error,
      stackTrace: stackTrace,
    );
  }

  // Layer-specific loggers

  /// For Presentation Layer logging (UI interactions, navigation, form events)
  ///
  /// Usage Examples:
  /// - User button taps, navigation events
  /// - Form validation results
  /// - Widget lifecycle events
  ///
  /// Follows Flutter's recommended approach:
  /// - Uses debugPrint() for immediate console output in debug mode
  /// - Uses developer.log() for structured logging with levels
  static void ui(String message, {Object? error}) {
    // Immediate debug output for UI events (Flutter best practice)
    if (kDebugMode) {
      debugPrint('UI: $message');
    }

    // Structured logging for development tools
    if (error != null) {
      debug(message, name: 'PresentationLayer', error: error);
    } else {
      debug(message, name: 'PresentationLayer');
    }
  }

  /// For Data Layer logging (API calls, Database operations, etc.)
  ///
  /// Usage Examples:
  /// - API request/response logging
  /// - Database operation results
  /// - File I/O operations
  ///
  /// Uses developer.log() directly for better performance in data operations
  static void data(String message, {String? source, Object? error}) {
    debug(
      message,
      name: 'DataLayer${source != null ? '.$source' : ''}',
      error: error,
    );
  }

  /// For detailed technical debugging (raw JSON, parsing details, etc.)
  ///
  /// Usage Examples:
  /// - Raw API responses for debugging
  /// - JSON parsing steps
  /// - Low-level technical implementation details
  ///
  /// This is where developer.log() is most appropriate as per Dart docs
  static void debugRaw(String message, {String? name, String? source}) {
    debug(
      message,
      name: name ?? 'DataLayer${source != null ? '.$source' : ''}',
    );
  }

  /// For Repository Layer logging (business data operations)
  ///
  /// Usage Examples:
  /// - Repository method calls
  /// - Data transformation operations
  /// - Business logic data processing
  static void repository(String message, {Object? error}) {
    info(message, name: 'Repository', error: error);
  }

  /// For Domain Layer logging (business rules, use cases, entities)
  ///
  /// Usage Examples:
  /// - Use case execution start/complete
  /// - Business rule validations
  /// - Domain entity state changes
  ///
  /// According to Clean Architecture, domain layer should have minimal logging
  /// but this provides structured logging when needed for business operations
  static void domain(String message, {Object? error, String? useCase}) {
    info(
      message,
      name: 'Domain${useCase != null ? '.$useCase' : ''}',
      error: error,
    );
  }
}
