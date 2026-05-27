import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_route_app/core/app/router.dart';

class RouteSetupScreen extends StatefulWidget {
  const RouteSetupScreen({super.key});

  @override
  State<RouteSetupScreen> createState() => _RouteSetupScreenState();
}

class _RouteSetupScreenState extends State<RouteSetupScreen> {
  bool _avoidTolls = false;
  bool _avoidHighways = true;
  int _selectedVehicle = 0; // 0: Ô tô, 1: Xe máy, 2: Taxi

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Stack(
        children: [
          // Simulated Map Background
          Positioned.fill(
            child: Container(
              color: cs.surfaceContainerLow,
              child: CustomPaint(
                painter: _MapGridPainter(
                  color: cs.outlineVariant.withOpacity(0.3),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Top Configuration Card
                Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Inputs
                      Stack(
                        children: [
                          Positioned(
                            left: 19,
                            top: 24,
                            bottom: 24,
                            child: Container(
                              width: 2,
                              color: cs.outlineVariant,
                            ),
                          ),
                          Column(
                            children: [
                              _buildLocationInput(
                                context,
                                icon: Icons.trip_origin,
                                iconColor: cs.outline,
                                value: 'Vị trí hiện tại',
                                cs: cs,
                                textTheme: textTheme,
                              ),
                              const SizedBox(height: 8),
                              _buildLocationInput(
                                context,
                                icon: Icons.location_on,
                                iconColor: cs.primaryContainer,
                                value: 'Sân bay Tân Sơn Nhất',
                                cs: cs,
                                textTheme: textTheme,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Vehicle Tabs
                      Row(
                        children: [
                          _buildVehicleTab(
                            context,
                            0,
                            '🚗',
                            'Ô tô',
                            cs,
                            textTheme,
                          ),
                          const SizedBox(width: 8),
                          _buildVehicleTab(
                            context,
                            1,
                            '🛵',
                            'Xe máy',
                            cs,
                            textTheme,
                          ),
                          const SizedBox(width: 8),
                          _buildVehicleTab(
                            context,
                            2,
                            '🚕',
                            'Taxi',
                            cs,
                            textTheme,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Toggles
                      _buildToggle(
                        context,
                        label: 'Tránh trạm thu phí',
                        value: _avoidTolls,
                        onChanged: (val) => setState(() => _avoidTolls = val),
                        cs: cs,
                        textTheme: textTheme,
                      ),
                      const SizedBox(height: 8),
                      _buildToggle(
                        context,
                        label: 'Tránh đường cao tốc',
                        value: _avoidHighways,
                        onChanged: (val) =>
                            setState(() => _avoidHighways = val),
                        cs: cs,
                        textTheme: textTheme,
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Bottom Summary Card
                Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '45 Phút',
                        style: textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: cs.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            '12 km • ',
                            style: textTheme.bodyMedium?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Chậm hơn 5p do tai nạn',
                              style: textTheme.bodyMedium?.copyWith(
                                color: cs.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () {
                          /// TODO: '/go/active-navigation' is the route for ActiveNavigationScreen
                          context.push('/go/active-navigation');
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: cs.primary,
                          foregroundColor: cs.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9999),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'BẮT ĐẦU ĐI',
                              style: textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: cs.onPrimary,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.navigation,
                              color: cs.onPrimary,
                              size: 20,
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

          /// TODO: Nút back về trang trước
          // SafeArea(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: IconButton(
          //       onPressed: () => Navigator.pop(context),
          //       icon: const Icon(Icons.arrow_back),
          //       style: IconButton.styleFrom(
          //         backgroundColor: cs.surfaceContainerLowest,
          //         shadowColor: Colors.black.withOpacity(0.1),
          //         elevation: 2,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildLocationInput(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String value,
    required ColorScheme cs,
    required TextTheme textTheme,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: cs.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: textTheme.bodyMedium?.copyWith(color: cs.onSurface),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleTab(
    BuildContext context,
    int index,
    String emoji,
    String label,
    ColorScheme cs,
    TextTheme textTheme,
  ) {
    final isSelected = _selectedVehicle == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedVehicle = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? cs.primaryContainer : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? cs.primaryContainer : cs.outlineVariant,
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 4),
              Text(
                label,
                style: textTheme.labelLarge?.copyWith(
                  color: isSelected
                      ? cs.onPrimaryContainer
                      : cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggle(
    BuildContext context, {
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
    required ColorScheme cs,
    required TextTheme textTheme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textTheme.bodyMedium?.copyWith(color: cs.onSurface)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: cs.onPrimary,
          activeTrackColor: cs.primary,
          inactiveThumbColor: cs.outline,
          inactiveTrackColor: cs.surfaceVariant,
        ),
      ],
    );
  }
}

class _MapGridPainter extends CustomPainter {
  final Color color;

  _MapGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    const double spacing = 40.0;

    for (double i = 0; i <= size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i <= size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _MapGridPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
