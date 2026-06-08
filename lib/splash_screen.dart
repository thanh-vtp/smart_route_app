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
    // Đợi 1 chút để hiệu ứng chuyển cảnh mượt mà hơn rồi mới tắt Native Splash
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset(
                'assets/icons/logo_full.png', // Ở Flutter thì dùng Full Logo thoải mái
                height: 80,
                width: MediaQuery.of(context).size.width * 0.7,
                fit: BoxFit.contain, // Đảm bảo logo tự co giãn không bị cắt
                errorBuilder: (context, error, stackTrace) => Column(
                  children: [
                    Icon(Icons.location_on, size: 64, color: colors.primary),
                    const SizedBox(height: 16),
                    Text(
                      'SmartRoute',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 64),

            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                color: colors.primary,
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
