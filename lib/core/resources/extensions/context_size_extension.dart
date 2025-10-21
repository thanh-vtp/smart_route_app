import 'package:flutter/material.dart';

/// Extension for BuildContext - Size & Padding access
///
/// Quick access to screen dimensions, safe areas, and view insets
extension ContextSizeExtension on BuildContext {
  /// Extension for quickly accessing screen size
  Size get size => MediaQuery.of(this).size;

  /// Extension for quickly accessing screen height
  double get height => size.height;

  /// Extension for quickly accessing screen width
  double get width => size.width;

  /// Extension for quickly accessing view insets (e.g., keyboard height)
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// Extension for quickly accessing view padding (e.g., status bar, notch)
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  /// Extension for quickly accessing padding (e.g., safe areas)
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Get available screen height (excluding system UI elements)
  ///
  /// Uses root MediaQuery (MediaQueryData.fromView) to ensure consistent calculations
  /// even when called from within modals that strip padding.
  ///
  /// [excludeAppBar] - Whether to exclude AppBar height
  /// [excludeBottomNav] - Whether to exclude BottomNavigationBar height
  double getAvailableHeight({
    bool excludeAppBar = true,
    bool excludeBottomNav = true,
  }) {
    // Get MediaQuery from root view to bypass modal's removePadding
    final view = View.of(this);
    final mediaQuery = MediaQueryData.fromView(view);

    // Get raw values from root MediaQuery
    final screenHeight = mediaQuery.size.height;
    final topPadding = mediaQuery.viewPadding.top;
    final bottomPadding = mediaQuery.viewPadding.bottom;

    // Calculate base height
    double availableHeight = screenHeight - topPadding - bottomPadding;

    // Track deductions
    double appBarDeduction = 0;
    double bottomNavDeduction = 0;

    if (excludeAppBar) {
      appBarDeduction = kToolbarHeight;
      availableHeight -= kToolbarHeight;
    }

    if (excludeBottomNav) {
      bottomNavDeduction = kBottomNavigationBarHeight;
      availableHeight -= kBottomNavigationBarHeight;
    }

    // Log detailed calculation
    // AppLogger.info(
    //   '📏 getAvailableHeight Calculation:\n'
    //   '  Screen Height: ${screenHeight.toStringAsFixed(2)}px\n'
    //   '  Top Padding (Status Bar): ${topPadding.toStringAsFixed(2)}px\n'
    //   '  Bottom Padding (Safe Area): ${bottomPadding.toStringAsFixed(2)}px\n'
    //   '  AppBar Deduction: ${appBarDeduction.toStringAsFixed(2)}px (excluded: $excludeAppBar)\n'
    //   '  BottomNav Deduction: ${bottomNavDeduction.toStringAsFixed(2)}px (excluded: $excludeBottomNav)\n'
    //   '  Final Available Height: ${availableHeight.toStringAsFixed(2)}px\n'
    //   '  Source: Root MediaQuery (consistent everywhere)',
    //   name: 'SizeExtension',
    // );

    return availableHeight;
  }
}
