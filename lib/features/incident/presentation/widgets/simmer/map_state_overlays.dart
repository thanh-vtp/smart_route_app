import 'package:flutter/material.dart';

/// Widget hiển thị loading indicator khi đang tải dữ liệu sự cố
class MapLoadingOverlay extends StatelessWidget {
  const MapLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text('Đang tải dữ liệu sự cố...'),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget hiển thị submitting indicator khi đang gửi báo cáo
class MapSubmittingOverlay extends StatelessWidget {
  const MapSubmittingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: 0,
      right: 0,
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(width: 12),
                Text('Đang gửi báo cáo...'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Widget hiển thị error message
class MapErrorOverlay extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final bool isFatal; // Thêm cờ này: true = lỗi chết app, false = lỗi mạng nhẹ

  const MapErrorOverlay({
    super.key,
    required this.message,
    this.onRetry,
    this.isFatal = false,
  });

  @override
  Widget build(BuildContext context) {
    // TRƯỜNG HỢP 1: Lỗi chí mạng (Map không load được) -> Hiện giữa màn hình
    if (isFatal) {
      return Container(
        color: Colors.white, // Nền trắng che hết map lỗi
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud_off, size: 64, color: Colors.grey[400]),
              const SizedBox(height: 16),
              Text(
                'Không thể tải bản đồ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(message, style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 24),
              if (onRetry != null)
                FilledButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Thử lại'),
                ),
            ],
          ),
        ),
      );
    }

    // TRƯỜNG HỢP 2: Lỗi nhẹ (Mất mạng) -> Hiện thanh nhỏ (như Google Maps)
    // Dùng Positioned để đặt nó lên trên cùng (dưới SafeArea)
    return Positioned(
      bottom: 200, // Đặt dưới thanh tìm kiếm (tùy chỉnh theo UI của bạn)
      left: 20,
      right: 20,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(8),
        color: Colors.redAccent.shade700,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.wifi_off, color: Colors.white, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (onRetry != null)
                TextButton(
                  onPressed: onRetry,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Thử lại',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
