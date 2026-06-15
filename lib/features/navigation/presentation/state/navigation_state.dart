import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';

/// Trạng thái của chức năng điều hướng thời gian thực (Turn-by-Turn Navigation)
class NavigationState {
  /// Session hiện tại (null = chưa bắt đầu dẫn đường)
  final NavigationSession? session;

  /// Đang trong quá trình dẫn đường
  final bool isNavigating;

  /// Thông báo lỗi
  final String? errorMessage;

  const NavigationState({
    this.session,
    this.isNavigating = false,
    this.errorMessage,
  });

  factory NavigationState.initial() {
    return const NavigationState();
  }

  NavigationState copyWith({
    NavigationSession? session,
    bool? isNavigating,
    String? errorMessage,
    bool clearSession = false,
    bool clearError = false,
  }) {
    return NavigationState(
      session: clearSession ? null : (session ?? this.session),
      isNavigating: isNavigating ?? this.isNavigating,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
