import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tắt Native Splash Screen để nhường chỗ cho giao diện Flutter này
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    // Lấy theme giống hệt như cách bạn làm ở LoginScreen
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.background, // Màu nền #F8F9FA
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Box - Copy y hệt từ LoginScreen để tạo sự đồng bộ
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colors.outlineVariant),
              ),
              child: Center(
                child: Icon(
                  Icons.egg_alt_outlined,
                  size: 64,
                  color: colors.primary, // Màu xanh #00488D
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Tên App
            Text(
              'SmartHatch Enterprise',
              style: theme.textTheme.headlineLarge?.copyWith(
                color: colors.primary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 48),

            // Loading Indicator (Màu Primary)
            CircularProgressIndicator(color: colors.primary),
          ],
        ),
      ),
    );
  }
}
