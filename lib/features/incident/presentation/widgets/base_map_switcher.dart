import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/incident/presentation/providers/base_map_style_providers.dart';

class BasemapSwitcher extends ConsumerWidget {
  const BasemapSwitcher({super.key});

  void _showBasemapSelector(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _BasemapSelectorSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      heroTag: 'basemap_switcher',
      backgroundColor: Colors.white,
      elevation: 4,
      onPressed: () => _showBasemapSelector(context, ref),
      child: Icon(Icons.layers_outlined, color: Theme.of(context).primaryColor),
    );
  }
}

class _BasemapSelectorSheet extends ConsumerStatefulWidget {
  const _BasemapSelectorSheet();

  @override
  ConsumerState<_BasemapSelectorSheet> createState() =>
      _BasemapSelectorSheetState();
}

class _BasemapSelectorSheetState extends ConsumerState<_BasemapSelectorSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectBasemap(BasemapStyle style) {
    // Lưu reference đến container TRƯỚC khi pop (vì sau pop widget sẽ dispose)
    final container = ProviderScope.containerOf(context);

    // 1. Bật loading TRƯỚC khi đóng bottom sheet
    container.read(basemapLoadingProvider.notifier).setLoading(true);

    // 2. Đóng bottom sheet
    Navigator.of(context).pop();

    // 3. Dùng WidgetsBinding để đợi frame tiếp theo render loading overlay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 4. Đổi basemap sau khi loading đã hiển thị
      container
          .read(baseMapStyleProviderProvider.notifier)
          .setBaseMapStyle(style);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = ref.watch(baseMapStyleProviderProvider);

    final basemaps = [
      _BasemapOption(
        name: 'Đường phố',
        description: 'Bản đồ điều hướng với đường phố rõ ràng',
        style: BasemapStyle.arcGISNavigation,
        icon: Icons.map_outlined,
        gradient: const LinearGradient(
          colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
        ),
      ),
      _BasemapOption(
        name: 'Vệ tinh',
        description: 'Hình ảnh vệ tinh chất lượng cao',
        style: BasemapStyle.arcGISImagery,
        icon: Icons.satellite_alt,
        gradient: const LinearGradient(
          colors: [Color(0xFF34A853), Color(0xFF2D8E47)],
        ),
      ),
      _BasemapOption(
        name: 'Địa hình',
        description: 'Hiển thị độ cao và địa hình',
        style: BasemapStyle.arcGISTerrain,
        icon: Icons.terrain,
        gradient: const LinearGradient(
          colors: [Color(0xFFEA4335), Color(0xFFD93025)],
        ),
      ),
      _BasemapOption(
        name: 'Chế độ tối',
        description: 'Bản đồ tối cho ban đêm',
        style: BasemapStyle.arcGISNavigationNight,
        icon: Icons.dark_mode,
        gradient: const LinearGradient(
          colors: [Color(0xFF5F6368), Color(0xFF3C4043)],
        ),
      ),
    ];

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(_slideAnimation),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.layers,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chọn loại bản đồ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Thay đổi kiểu hiển thị bản đồ',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Basemap options grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: basemaps.length,
                  itemBuilder: (context, index) {
                    final basemap = basemaps[index];
                    final isSelected = currentStyle == basemap.style;

                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 300 + (index * 100)),
                        curve: Curves.easeOutBack,
                        builder: (context, value, child) {
                          return Transform.scale(scale: value, child: child);
                        },
                        child: _BasemapCard(
                          basemap: basemap,
                          isSelected: isSelected,
                          onTap: () => _selectBasemap(basemap.style),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _BasemapOption {
  final String name;
  final String description;
  final BasemapStyle style;
  final IconData icon;
  final Gradient gradient;

  const _BasemapOption({
    required this.name,
    required this.description,
    required this.style,
    required this.icon,
    required this.gradient,
  });
}

class _BasemapCard extends StatefulWidget {
  final _BasemapOption basemap;
  final bool isSelected;
  final VoidCallback onTap;

  const _BasemapCard({
    required this.basemap,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_BasemapCard> createState() => _BasemapCardState();
}

class _BasemapCardState extends State<_BasemapCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: widget.isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey[300]!,
              width: widget.isSelected ? 3 : 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.isSelected
                    ? Theme.of(context).primaryColor.withValues(alpha: 0.3)
                    : Colors.black.withValues(alpha: 0.05),
                blurRadius: widget.isSelected ? 12 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                // Gradient background
                Container(
                  decoration: BoxDecoration(gradient: widget.basemap.gradient),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon with background
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          widget.basemap.icon,
                          color: Colors.black87,
                          size: 24,
                        ),
                      ),

                      const Spacer(),

                      // Name
                      Text(
                        widget.basemap.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(color: Colors.black26, blurRadius: 4),
                          ],
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Description
                      Text(
                        widget.basemap.description,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 11,
                          shadows: const [
                            Shadow(color: Colors.black26, blurRadius: 4),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Selected indicator
                if (widget.isSelected)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
