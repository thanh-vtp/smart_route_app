import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Widget tùy chỉnh để hiển thị avatar và logout
class MapSearchTopBar extends ConsumerWidget {
  final Widget? leadingIcon;
  final Widget? title;
  final Widget? trailingIcon;
  const MapSearchTopBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Row(
            children: [
              SizedBox(width: 16),
              leadingIcon ?? SizedBox(),
              title ?? SizedBox(),
              trailingIcon ?? SizedBox(),
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
