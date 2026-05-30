import 'package:flutter/material.dart';

//TODO: Wdget hiện thị các loại thông báo (success, error, validation, info)
class AppAlerts {
  static void _showSnackbar(
    BuildContext context,
    Widget content,
    Color backgroundColor, {
    double elevation = 6.0,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: elevation,
        padding: EdgeInsets.zero,
      ),
    );
  }

  // 1. Incoming Notification
  static void showIncoming(
    BuildContext context,
    String message, {
    VoidCallback? onAction,
  }) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white, // surfaceContainerLowest
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 3,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 4, color: cs.primaryContainer),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: cs.primaryContainer,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          message,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: cs.onSurface,
                          ),
                        ),
                      ),
                      if (onAction != null) ...[
                        const SizedBox(width: 8),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            onAction();
                          },
                          child: Text(
                            'XEM',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: cs.primaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // 2. Success
  static void showSuccess(BuildContext context, String message) {
    final theme = Theme.of(context);
    const bgColor = Color(0xFF005151); // custom-success-bg
    const textColor = Colors.white; // on-tertiary

    _showSnackbar(
      context,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: textColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.labelLarge?.copyWith(color: textColor),
              ),
            ),
          ],
        ),
      ),
      bgColor,
    );
  }

  // 3. Validation
  static void showValidation(BuildContext context, String message) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    _showSnackbar(
      context,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: cs.onErrorContainer),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: cs.onErrorContainer,
                ),
              ),
            ),
          ],
        ),
      ),
      cs.errorContainer,
    );
  }

  // 4. Hard Failure / Error
  static void showError(
    BuildContext context,
    String message, {
    VoidCallback? onRetry,
  }) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    _showSnackbar(
      context,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(Icons.close, color: cs.onError),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.labelLarge?.copyWith(color: cs.onError),
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(width: 8),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  onRetry();
                },
                child: Text(
                  'THỬ LẠI',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: cs.onError,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      cs.error,
    );
  }

  // 5. Offline
  static void showOffline(BuildContext context, String message) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    _showSnackbar(
      context,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(Icons.wifi_off, color: cs.onSecondary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: cs.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
      cs.secondary,
    );
  }

  // 6. Info
  static void showInfo(BuildContext context, String message) {
    final theme = Theme.of(context);
    const bgColor = Color(0xFFFFF0C2);
    const textColor = Color(0xFF7A4D00);

    _showSnackbar(
      context,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            const Icon(Icons.info_outline, color: textColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
              ),
            ),
          ],
        ),
      ),
      bgColor,
    );
  }
}
