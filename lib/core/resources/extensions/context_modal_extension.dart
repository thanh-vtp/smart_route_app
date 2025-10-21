import 'package:flutter/material.dart';
import 'context_size_extension.dart';

/// Extension for BuildContext - Modal Bottom Sheet
///
/// Methods for showing modal bottom sheets with calculated heights
/// and various presets (full-screen, half-screen, custom)
extension ContextModalExtension on BuildContext {
  /// Extension for showing modal bottom sheet with calculated height
  ///
  /// [builder] - Widget builder for modal content
  /// [heightFraction] - Fraction of available height (0.0 - 1.0), default 0.9
  /// [excludeAppBar] - Whether to exclude AppBar height, default true
  /// [excludeBottomNav] - Whether to exclude BottomNavigationBar height, default true
  /// [additionalTopPadding] - Additional top padding, default 0
  /// [backgroundColor] - Background color, default transparent
  /// [isScrollControlled] - Whether modal can be scrolled, default true
  Future<T?> showModalBottomSheetWithHeight<T>({
    required Widget Function(BuildContext) builder,
    double heightFraction = 0.9,
    bool excludeAppBar = true,
    bool excludeBottomNav = true,
    double additionalTopPadding = 0,
    Color? backgroundColor,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
  }) {
    // Calculate available height using ContextSizeExtension
    double availableHeight = getAvailableHeight(
      excludeAppBar: excludeAppBar,
      excludeBottomNav: excludeBottomNav,
    );

    // Subtract additional top padding
    availableHeight -= additionalTopPadding;

    // Calculate final height based on fraction
    final modalHeight = availableHeight * heightFraction;

    // Log height calculations
    // AppLogger.info(
    //   '📐 Modal Height Calculation:\n'
    //   '  Available Height: ${availableHeight.toStringAsFixed(2)}px\n'
    //   '  Height Fraction: $heightFraction\n'
    //   '  Additional Top Padding: $additionalTopPadding\n'
    //   '  Final Modal Height: ${modalHeight.toStringAsFixed(2)}px\n'
    //   '  Exclude AppBar: $excludeAppBar\n'
    //   '  Exclude BottomNav: $excludeBottomNav\n'
    //   '  Route: ${routeSettings?.name ?? "unnamed"}',
    //   name: 'ModalExtension',
    // );

    return showModalBottomSheet<T>(
      context: this,
      backgroundColor: backgroundColor ?? Colors.transparent,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
      builder: (context) {
        return SizedBox(height: modalHeight, child: builder(context));
      },
    );
  }

  /// Extension for showing full-screen modal bottom sheet
  /// (Excludes status bar, AppBar, and BottomNavigationBar)
  ///
  /// Result:
  /// ┌─────────────┐
  /// │  AppBar     │ ← Không che
  /// ├═════════════┤
  /// │             │
  /// │   MODAL     │ ← Bắt đầu từ đây
  /// │   100%      │
  /// │             │
  /// └─────────────┘
  Future<T?> showFullScreenModal<T>({
    required Widget Function(BuildContext) builder,
    double topMargin = 0,
    Color? backgroundColor,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    // AppLogger.info(
    //   '🎯 showFullScreenModal called:\n'
    //   '  Top Margin: $topMargin\n'
    //   '  Height Fraction: 1.0 (100%)\n'
    //   '  Exclude AppBar: true\n'
    //   '  Exclude BottomNav: true',
    //   name: 'FullScreenModal',
    // );

    return showModalBottomSheetWithHeight<T>(
      builder: builder,
      heightFraction: 1.0,
      excludeAppBar: true,
      excludeBottomNav: true,
      additionalTopPadding: topMargin,
      backgroundColor: backgroundColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }

  /// Extension for showing half-screen modal bottom sheet
  /// Result:
  /// ┌─────────────┐
  /// │  AppBar     │
  /// ├─────────────┤
  /// │             │
  /// │  Content    │ ← Modal ở giữa màn hình
  /// ├═════════════┤
  /// │   MODAL     │ ← 50% screen
  /// │   50%       │
  /// └─────────────┘
  Future<T?> showHalfScreenModal<T>({
    required Widget Function(BuildContext) builder,
    Color? backgroundColor,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheetWithHeight<T>(
      builder: builder,
      heightFraction: 0.5,
      excludeAppBar: false,
      excludeBottomNav: false,
      backgroundColor: backgroundColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }
}
