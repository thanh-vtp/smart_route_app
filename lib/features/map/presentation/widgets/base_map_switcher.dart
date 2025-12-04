import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/presentation/providers/base_map_style_providers.dart';

class BasemapSwitcher extends ConsumerStatefulWidget {
  const BasemapSwitcher({super.key});

  @override
  ConsumerState<BasemapSwitcher> createState() => _BasemapSwitcherState();
}

class _BasemapSwitcherState extends ConsumerState<BasemapSwitcher>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false; // state button

  late final AnimationController _controller;
  late final Animation<double> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded)
        _controller.forward();
      else
        _controller.reverse();
    });
  }

  Widget _buildBasemapButton(String label, BasemapStyle style, Color color) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0), // left to right
        end: Offset.zero,
      ).animate(_slideAnimation),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: FloatingActionButton(
          mini: true,
          heroTag: label,
          backgroundColor: color,
          onPressed: () {
            // delay update để tránh lỗi layout
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref
                  .read(baseMapStyleProviderProvider.notifier)
                  .setBaseMapStyle(style);
              _toggle();
            });
          },
          child: Text(
            label[0],
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const supportedBasemaps = {
      'Đường phố': BasemapStyle.arcGISNavigation,
      'Vệ tinh': BasemapStyle.arcGISImagery,
      'Địa hình': BasemapStyle.arcGISTerrain,
      'Tối': BasemapStyle.arcGISNavigationNight,
    };

    // tạo list nút basemap
    final basemapButtons = supportedBasemaps.entries.map((entry) {
      Color color;
      switch (entry.key) {
        case 'Đường phố':
          color = Colors.blue;
          break;
        case 'Vệ tinh':
          color = Colors.red;
          break;
        case 'Địa hình':
          color = Colors.green;
          break;
        case 'Tối':
          color = Colors.grey;
          break;
        default:
          color = Colors.black;
      }
      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: _buildBasemapButton(entry.key, entry.value, color),
      );
    }).toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: _toggle,
          child: AnimatedRotation(
            duration: const Duration(milliseconds: 300),
            turns: _isExpanded ? 0.125 : 0,
            child: const Icon(Icons.layers),
          ),
        ),

        // Row layer buttons xuất hiện từ trái sang phải
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(children: basemapButtons),
          ),
      ],
    );
  }
}

// class BasemapSwitcher extends ConsumerWidget {
//   const BasemapSwitcher({super.key});

//   // Định nghĩa các kiểu basemap hỗ trợ
//   final Map<String, BasemapStyle> supportedBasemaps = const {
//     'Đường phố': BasemapStyle.arcGISNavigation,
//     'Vệ tinh': BasemapStyle.arcGISImagery,
//     'Địa hình': BasemapStyle.arcGISTerrain,
//     'Tối': BasemapStyle.arcGISNavigationNight,
//   };

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentStyle = ref.watch(baseMapStyleProviderProvider);

    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(8),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black.withValues(alpha: 0.2),
    //         blurRadius: 4,
    //         offset: const Offset(0, 2),
    //       ),
    //     ],
    //   ),
    //   child: DropdownButton<BasemapStyle>(
    //     value: currentStyle,
    //     underline: const SizedBox.shrink(), // Bỏ gạch chân
    //     onChanged: (BasemapStyle? newStyle) {
    //       if (newStyle != null) {
    //         // Khi người dùng chọn, gọi notifier để cập nhật state
    //         ref
    //             .read(baseMapStyleProviderProvider.notifier)
    //             .setBaseMapStyle(newStyle);
    //       }
    //     },
    //     items: supportedBasemaps.entries.map((entry) {
    //       return DropdownMenuItem(value: entry.value, child: Text(entry.key));
    //     }).toList(),
    //   ),
    // );
//   }
// }
