import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/repositories/repository_providers.dart';

class CacheManagementWidget extends HookConsumerWidget {
  const CacheManagementWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheStats = useState<Map<String, int>?>(null);
    final isLoading = useState(false);

    Future<void> loadCacheStats() async {
      isLoading.value = true;
      try {
        final geocodingRepo = ref.read(geocodingRepositoryProvider);
        final incidentRepo = ref.read(incidentRepositoryProvider);

        // Lấy stats từ cả 2 repository
        final geocodingStats = await geocodingRepo.getCacheStats();
        final incidentCount = await incidentRepo.getCachedIncidentCount();

        // Merge stats
        cacheStats.value = {...geocodingStats, 'incident': incidentCount};
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Lỗi khi tải thống kê cache: $e')),
          );
        }
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> clearAllCache() async {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Xóa tất cả cache'),
          content: const Text(
            'Bạn có chắc chắn muốn xóa tất cả dữ liệu cache? '
            'Điều này sẽ làm tăng số lượng API requests trong lần sử dụng tiếp theo.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Xóa'),
            ),
          ],
        ),
      );

      if (confirmed == true) {
        try {
          final geocodingRepo = ref.read(geocodingRepositoryProvider);
          final incidentRepo = ref.read(incidentRepositoryProvider);

          await geocodingRepo.clearAllCache();
          await incidentRepo.clearIncidentCache();
          await loadCacheStats();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Đã xóa tất cả cache')),
            );
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Lỗi khi xóa cache: $e')));
          }
        }
      }
    }

    Future<void> clearExpiredCache() async {
      try {
        final repository = ref.read(geocodingRepositoryProvider);
        await repository.clearExpiredCache();
        await loadCacheStats();
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Đã xóa cache hết hạn')));
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Lỗi khi xóa cache hết hạn: $e')),
          );
        }
      }
    }

    useEffect(() {
      loadCacheStats();
      return null;
    }, []);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.storage, color: Colors.purple),
                const SizedBox(width: 8),
                const Text(
                  'Quản lý Cache',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: isLoading.value ? null : loadCacheStats,
                  icon: isLoading.value
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.refresh),
                ),
              ],
            ),

            const SizedBox(height: 12),

            if (cacheStats.value != null) ...[
              // Tổng số cache
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.data_usage, color: Colors.purple),
                    const SizedBox(width: 8),
                    Text(
                      'Tổng: ${cacheStats.value!.values.fold(0, (a, b) => a + b)} mục',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              const Text(
                'Chi tiết theo loại:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              ...cacheStats.value!.entries.map((entry) {
                String label;
                String expiry;
                IconData icon;
                Color color;

                switch (entry.key) {
                  case 'geocode':
                    label = 'Tìm kiếm địa chỉ';
                    expiry = '7 ngày';
                    icon = Icons.search;
                    color = Colors.blue;
                    break;
                  case 'reverse_geocode':
                    label = 'Thông tin vị trí';
                    expiry = '3 ngày';
                    icon = Icons.location_on;
                    color = Colors.green;
                    break;
                  case 'route':
                    label = 'Tuyến đường';
                    expiry = '1 ngày';
                    icon = Icons.directions;
                    color = Colors.orange;
                    break;
                  case 'nearby':
                    label = 'Địa điểm gần đây';
                    expiry = '2 giờ';
                    icon = Icons.place;
                    color = Colors.red;
                    break;
                  case 'image':
                    label = 'Ảnh vệ tinh';
                    expiry = '30 ngày';
                    icon = Icons.satellite;
                    color = Colors.purple;
                    break;
                  case 'incident':
                    label = 'Sự cố giao thông';
                    expiry = 'Khi refresh';
                    icon = Icons.warning_amber;
                    color = Colors.amber;
                    break;
                  default:
                    label = entry.key;
                    expiry = 'N/A';
                    icon = Icons.data_usage;
                    color = Colors.grey;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(icon, color: color, size: 18),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              label,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Hết hạn: $expiry',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: entry.value > 0
                              ? color.withValues(alpha: 0.15)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${entry.value}',
                          style: TextStyle(
                            color: entry.value > 0 ? color : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: clearExpiredCache,
                      icon: const Icon(Icons.cleaning_services),
                      label: const Text('Xóa hết hạn'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: clearAllCache,
                      icon: const Icon(Icons.delete_sweep),
                      label: const Text('Xóa tất cả'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lợi ích của cache:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '• Giảm số lượng API requests',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '• Tăng tốc độ phản hồi',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '• Tiết kiệm băng thông',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '• Hoạt động offline một phần',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ] else if (isLoading.value) ...[
              const Center(child: CircularProgressIndicator()),
            ] else ...[
              const Text('Không thể tải thống kê cache'),
            ],
          ],
        ),
      ),
    );
  }
}
