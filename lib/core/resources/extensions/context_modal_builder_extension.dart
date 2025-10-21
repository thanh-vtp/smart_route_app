import 'package:flutter/material.dart';

import 'context_size_extension.dart';

/// Extension for BuildContext - Modal UI Builders
///
/// Helper methods for building modal components like headers,
/// containers, and handle bars with consistent styling
extension ContextModalBuilderExtension on BuildContext {
  /// Extension for building modal header with rounded top corners and opacity
  ///
  /// [child] - Widget content for the header
  /// [backgroundColor] - Background color, default Color(0xFF1E1E1E)
  /// [opacity] - Background opacity (0.0 - 1.0), default 1.0
  /// [borderRadius] - Top border radius, default 20
  /// [padding] - Content padding, default EdgeInsets.all(20)
  /// [showBottomBorder] - Whether to show bottom border, default true
  /// [borderColor] - Bottom border color, default Colors.grey.shade800
  /// [borderWidth] - Bottom border width, default 1
  ///
  /// Result:
  /// ╔═══════════════════════╗ ← Rounded corners
  /// ║  Modal Title          ║
  /// ╠═══════════════════════╣ ← Bottom border
  Widget buildModalHeader({
    required Widget child,
    Color backgroundColor = const Color(0xFF1E1E1E),
    double opacity = 1.0,
    double borderRadius = 20.0,
    EdgeInsets padding = const EdgeInsets.all(20),
    bool showBottomBorder = true,
    Color? borderColor,
    double borderWidth = 1.0,
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor.withValues(alpha: opacity),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
        border: showBottomBorder
            ? Border(
                bottom: BorderSide(
                  color: borderColor ?? Colors.grey.shade800,
                  width: borderWidth,
                ),
              )
            : null,
      ),
      child: child,
    );
  }

  /// Extension for building modal header with handle bar (drag indicator)
  ///
  /// [child] - Widget content for the header (below the handle bar)
  /// [showHandleBar] - Whether to show handle bar, default true
  /// [backgroundColor] - Background color, default Color(0xFF1E1E1E)
  /// [opacity] - Background opacity (0.0 - 1.0), default 1.0
  /// [borderRadius] - Top border radius, default 20
  /// [padding] - Content padding, default EdgeInsets.all(20)
  /// [showBottomBorder] - Whether to show bottom border, default true
  /// [handleBarWidth] - Width of handle bar, default 40
  /// [handleBarHeight] - Height of handle bar, default 4
  /// [handleBarColor] - Color of handle bar, default Colors.white24
  /// [handleBarMargin] - Margin around handle bar, default EdgeInsets.only(bottom: 16)
  ///
  /// Result:
  /// ╔═══════════════════════╗
  /// ║       ━━━━            ║ ← Handle bar (40x4px)
  /// ║                       ║
  /// ║  Draggable Modal      ║
  /// ╠═══════════════════════╣
  Widget buildModalHeaderWithHandle({
    required Widget child,
    bool showHandleBar = true,
    Color backgroundColor = const Color(0xFF1E1E1E), // Dark gray
    double opacity = 1.0,
    double borderRadius = 20.0,
    EdgeInsets padding = const EdgeInsets.all(20),
    bool showBottomBorder = true,
    Color? borderColor,
    double borderWidth = 1.0,
    double handleBarWidth = 40.0,
    double handleBarHeight = 4.0,
    Color handleBarColor = Colors.white24,
    EdgeInsets handleBarMargin = const EdgeInsets.only(bottom: 16),
  }) {
    return buildModalHeader(
      backgroundColor: backgroundColor,
      opacity: opacity,
      borderRadius: borderRadius,
      padding: padding,
      showBottomBorder: showBottomBorder,
      borderColor: borderColor,
      borderWidth: borderWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          if (showHandleBar)
            Container(
              width: handleBarWidth,
              height: handleBarHeight,
              margin: handleBarMargin,
              decoration: BoxDecoration(
                color: handleBarColor,
                borderRadius: BorderRadius.circular(handleBarHeight / 2),
              ),
            ),
          // Content
          child,
        ],
      ),
    );
  }

  /// Extension for building modal container wrapper with rounded top corners
  ///
  /// This creates the full modal container that wraps the entire bottom sheet content
  /// (header + body). Different from [buildModalHeader] which only styles the header section.
  ///
  /// Common use cases:
  /// - Bottom sheet modal wrappers
  /// - Full-screen modal containers
  /// - Any container needing rounded top corners with standard modal styling
  ///
  /// Parameters:
  /// - [child] - Widget content to wrap (typically a Column with header + body)
  /// - [width] - Container width, defaults to full screen width
  /// - [height] - Fixed height, optional (use either height or constraints)
  /// - [constraints] - BoxConstraints for responsive sizing, optional
  /// - [backgroundColor] - Background color, default Color(0xFF121212)
  /// - [borderRadius] - Top corner radius, default 20.0
  ///
  /// Example:
  /// ```dart
  /// context.buildModalContainer(
  ///   constraints: BoxConstraints(
  ///     maxHeight: context.height * 0.85,
  ///     minHeight: context.height * 0.55,
  ///   ),
  ///   child: Column([...]),
  /// )
  /// ```
  Widget buildModalContainer({
    required Widget child,
    double? width,
    double? height,
    BoxConstraints? constraints,
    Color backgroundColor = const Color(0xFF121212), // Dark background
    double borderRadius = 20.0,
  }) {
    return Container(
      width: width ?? this.width,
      height: height,
      constraints: constraints,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      child: child,
    );
  }
}
