import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// Failure → thuộc Domain Layer
// Là lỗi dạng business logic hoặc lỗi được chuẩn hóa
// Gửi về UseCase, Bloc, UI
// Không liên quan đến framework, không liên quan đến dữ liệu platform
// Luôn là object bất biến (immutable)
// → Failure là lỗi business hoặc lỗi đã convert từ kỹ thuật sang domain-safe

@immutable
sealed class Failure extends Equatable {
  final String? technicalMessage;
  final String? code;
  final StackTrace? stackTrace;

  const Failure({this.technicalMessage, this.code, this.stackTrace});

  @override
  List<Object?> get props => [technicalMessage, code];
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

/// Lỗi không xác định
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure(Object error, StackTrace? st)
    : super(code: 'UNKNOWN', technicalMessage: '$error', stackTrace: st);
}
