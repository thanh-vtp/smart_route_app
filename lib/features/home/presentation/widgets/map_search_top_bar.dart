import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/auth/presentation/providers/states/auth.dart';

// Widget tùy chỉnh để hiển thị avatar và logout
class MapSearchTopBar extends ConsumerWidget {
  const MapSearchTopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

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
              Icon(Icons.location_pin, color: Colors.red),
              Expanded(child: Text("   Tìm kiếm ở đây")),
              Icon(Icons.mic),
              SizedBox(width: 8),
              // User avatar - tap to open profile drawer
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: CachedNetworkImage(
                  imageUrl: user.avatarUrl ?? '',
                  imageBuilder: (context, imageProvider) =>
                      CircleAvatar(backgroundImage: imageProvider),
                  placeholder: (context, url) =>
                      const CircleAvatar(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      CircleAvatar(child: Icon(Icons.person)),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
