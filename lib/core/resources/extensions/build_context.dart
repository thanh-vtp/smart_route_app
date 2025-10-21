/// BuildContext Extensions - Barrel File
///
/// This file exports all BuildContext extensions for convenient import.
/// Import this single file to access all context extensions:
/// ```dart
/// import 'package:project_app/core/resources/extensions/build_context.dart';
/// ```
///
/// Individual extensions can also be imported directly:
/// - [ContextThemeExtension] - Theme & style access
/// - [ContextSizeExtension] - Size & padding access
/// - [ContextModalExtension] - Modal bottom sheets
/// - [ContextModalBuilderExtension] - Modal UI builders
///
/// This structure provides:
/// - Better organization (separated concerns)
/// - Easier maintenance (smaller files)
/// - Flexible imports (use what you need)
/// - Backward compatibility (existing imports still work)
library;

// Export all extension files
export 'context_theme_extension.dart';
export 'context_size_extension.dart';
export 'context_modal_extension.dart';
export 'context_modal_builder_extension.dart';
