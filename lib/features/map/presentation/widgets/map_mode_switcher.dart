import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';

/// Widget chuyển đổi giữa chế độ 2D và 3D trên bản đồ
/// Thiết kế dạng toggle button compact, phù hợp với map controls
class MapModeSwitcher extends ConsumerStatefulWidget {
  const MapModeSwitcher({super.key});

  @override
  ConsumerState<MapModeSwitcher> createState() => _MapModeSwitcherState();
}

class _MapModeSwitcherState extends ConsumerState<MapModeSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _slideAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onModeChanged(MapMode mode) {
    ref.read(mapModeProviderProvider.notifier).setMapMode(mode);

    // Animate indicator
    if (mode == MapMode.scene3D) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mapMode = ref.watch(mapModeProviderProvider);

    // Sync animation với state hiện tại
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mapMode == MapMode.scene3D && !_animationController.isCompleted) {
        _animationController.forward();
      } else if (mapMode == MapMode.map2D && _animationController.value > 0) {
        _animationController.reverse();
      }
    });

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            // Animated background indicator
            AnimatedBuilder(
              animation: _slideAnimation,
              builder: (context, child) {
                return Positioned(
                  left: _slideAnimation.value * 44,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withValues(alpha: 0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).primaryColor.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Buttons row
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ModeButton(
                  icon: Icons.map_outlined,
                  label: '2D',
                  isSelected: mapMode == MapMode.map2D,
                  onTap: () => _onModeChanged(MapMode.map2D),
                ),
                _ModeButton(
                  icon: Icons.view_in_ar_outlined,
                  label: '3D',
                  isSelected: mapMode == MapMode.scene3D,
                  onTap: () => _onModeChanged(MapMode.scene3D),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? Colors.white : Colors.grey[600],
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
