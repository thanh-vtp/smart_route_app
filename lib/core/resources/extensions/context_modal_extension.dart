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

  /// Extension for showing DraggableScrollableSheet for app
  /// Tự động tính maxChildSize để không che status bar
  DraggableScrollableSheet buildDraggableScrollableSheet({
    required Widget Function(ScrollController scrollController) builder,
  }) {
    // Lấy status bar height để tính maxChildSize
    final statusBarHeight = MediaQuery.of(this).padding.top;
    final screenHeight = MediaQuery.of(this).size.height;
    // maxChildSize = (screenHeight - statusBarHeight) / screenHeight
    final maxSize = (screenHeight - statusBarHeight) / screenHeight;

    return DraggableScrollableSheet(
      initialChildSize: maxSize, // Mở lên ban đầu full (dưới status bar)
      minChildSize: 0.14, // Thu nhỏ tối đa 14%
      maxChildSize: maxSize, // Kéo lên tối đa dưới status bar
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
          ],
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Expanded(child: builder(scrollController)),
          ],
        ),
      ),
    );
  }
}
