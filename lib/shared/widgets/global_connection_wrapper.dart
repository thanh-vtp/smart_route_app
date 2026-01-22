import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/network/providers/state/app_connectivity_provider.dart';

class GlobalConnectionWrapper extends ConsumerWidget {
  const GlobalConnectionWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(appConnectivityProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: status == ConnectivityStatus.offline
          ? Material(
              color: Colors.red,
              child: SafeArea(
                top: false,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.wifi_off, color: Colors.white, size: 20),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Không có kết nối Internet",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(), // Ẩn khi có mạng
    );
  }
}
