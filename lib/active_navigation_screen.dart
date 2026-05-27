import 'package:flutter/material.dart';
import 'maneuver_indicator.dart';
import 'reporting_bottom_sheet.dart';

class ActiveNavigationScreen extends StatelessWidget {
  const ActiveNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Bản đồ nền (Mô phỏng màu xanh lá nhạt trong ảnh)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFB5B796), Color(0xFFE0E5D1)],
                ),
              ),
              child: Center(
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateX(-0.8),
                  alignment: FractionalOffset.center,
                  child: Container(
                    width: 12,
                    height: 400,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00488D), // Màu đường Line xanh đậm
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00488D).withOpacity(0.3),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2. Bảng chỉ dẫn ngã rẽ chính (Top Banner)
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ManeuverIndicator(
                  type: ManeuverType.turnRight,
                  distance: '200 m',
                  instruction: 'Rẽ phải vào đường Nguyễn Văn Cừ',
                  size: ManeuverSize.large,
                ),

                const SizedBox(height: 8),

                // 3. Widget "Sau đó"
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_upward, size: 16, color: Colors.black87),
                      SizedBox(width: 4),
                      Text(
                        'Sau đó 2km',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 4. Đồng hồ tốc độ (Góc dưới bên trái)
          Positioned(
            left: 16,
            bottom: 140,
            child: Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFBA1A1A),
                  width: 3,
                ), // Viền đỏ
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '45',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'km/h',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          // 5. Nút BÁO CÁO (Góc dưới bên phải - Pill shaped)
          Positioned(
            right: 16,
            bottom: 140,
            child: FloatingActionButton.extended(
              heroTag: 'active_report',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ReportingBottomSheet(),
                );
              },
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
              elevation: 4,
              icon: Icon(Icons.campaign, color: cs.onError),
              label: Text(
                'BÁO CÁO',
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: cs.onError,
                ),
              ),
            ),
          ),

          // 6. Bảng trạng thái hành trình (Bottom Panel)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                24,
                24,
                24,
                MediaQuery.of(context).padding.bottom + 16,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '14:45',
                          style: textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                            fontSize: 34,
                          ),
                        ),
                        const Text(
                          '35 phút • 10.5 km',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Nút X (Đóng) bo tròn màu xám nhạt
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3F4F5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xFFBA1A1A),
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
