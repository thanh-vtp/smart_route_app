import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/auth/presentation/auth_controller_provider.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final controller = ref.watch(authControllerProvider);

    final isLoading = controller.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    ref.listen(authControllerProvider, (_, next) {
      next.whenOrNull(
        error: (message) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        },
      );
    });

    return Scaffold(
      backgroundColor: cs.surface,
      body: Stack(
        children: [
          // Background Map Grid Pattern (Upper Half)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: CustomPaint(
              painter: _GridPainter(color: cs.primary.withOpacity(0.05)),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Branding
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: cs.primaryContainer,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.location_on,
                        size: 36,
                        color: cs.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'SmartRoute',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Login Card
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 400),
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: cs.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(24.0), // rounded-xl
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 4), // MD3 Level 2 approx
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Chào mừng trở lại',
                            textAlign: TextAlign.center,
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cs.onSurface,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Đăng nhập để xem hệ thống giao thông',
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Email Input
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Email công việc hoặc cá nhân',
                              hintStyle: textTheme.bodyLarge?.copyWith(
                                color: cs.onSurfaceVariant.withOpacity(0.8),
                              ),
                              filled: true,
                              fillColor: cs.surfaceContainer,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                            style: textTheme.bodyLarge?.copyWith(
                              color: cs.onSurface,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),

                          // Password Input
                          TextField(
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              hintText: 'Mật khẩu',
                              hintStyle: textTheme.bodyLarge?.copyWith(
                                color: cs.onSurfaceVariant.withOpacity(0.8),
                              ),
                              filled: true,
                              fillColor: cs.surfaceContainer,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: cs.onSurfaceVariant,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                            style: textTheme.bodyLarge?.copyWith(
                              color: cs.onSurface,
                            ),
                          ),

                          // Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Quên mật khẩu?',
                                style: textTheme.labelLarge?.copyWith(
                                  color: cs.primary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Login Button
                          FilledButton(
                            onPressed: () {
                              // if (isLoading) {
                              //   return;
                              // } else {
                              //   context.push(MainMapView.routePath);
                              // }
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: cs.primary,
                              foregroundColor: cs.onPrimary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'ĐĂNG NHẬP',
                              style: textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: cs.onPrimary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Divider
                          Row(
                            children: [
                              Expanded(
                                child: Divider(color: cs.outlineVariant),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  'HOẶC',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: cs.onSurfaceVariant,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(color: cs.outlineVariant),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Google Auth
                          OutlinedButton(
                            onPressed: () {
                              if (isLoading) {
                                return;
                              } else {
                                ref
                                    .read(authControllerProvider.notifier)
                                    .signInWithGoogle();
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: cs.outlineVariant),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Placeholder for Google Logo
                                      const _GoogleLogoPlaceholder(),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Tiếp tục với Google',
                                        style: textTheme.labelLarge?.copyWith(
                                          color: cs.onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color color;

  _GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    const double spacing = 20.0;

    for (double i = 0; i <= size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i <= size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}

class _GoogleLogoPlaceholder extends StatelessWidget {
  const _GoogleLogoPlaceholder();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint p1 = Paint()..color = const Color(0xFFEA4335); // Red
    final Paint p2 = Paint()..color = const Color(0xFFFBBC05); // Yellow
    final Paint p3 = Paint()..color = const Color(0xFF34A853); // Green
    final Paint p4 = Paint()..color = const Color(0xFF4285F4); // Blue

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14,
      1.57,
      true,
      p1,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      1.57,
      1.57,
      true,
      p3,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      4.71,
      1.57,
      true,
      p2,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      1.57,
      true,
      p4,
    );

    final Paint innerPaint = Paint()..color = const Color(0xFFFFFFFF);
    canvas.drawCircle(center, radius * 0.6, innerPaint);

    canvas.drawRect(
      Rect.fromLTRB(
        center.dx,
        center.dy - radius * 0.2,
        size.width,
        center.dy + radius * 0.2,
      ),
      p4,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
