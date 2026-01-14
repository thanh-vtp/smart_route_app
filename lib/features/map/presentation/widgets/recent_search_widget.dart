import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/states/recent_search_notifier.dart';

/// Widget hiển thị danh sách lịch sử tìm kiếm gần đây
/// Sử dụng RecentSearchNotifier để lấy data từ SQLite cache
class RecentSearchWidget extends ConsumerWidget {
  /// Callback khi người dùng chọn một địa chỉ từ lịch sử
  final void Function(AddressResult address)? onAddressSelected;

  /// Hiển thị header với nút "Xóa tất cả"
  final bool showHeader;

  /// Số lượng item tối đa hiển thị
  final int maxItems;

  const RecentSearchWidget({
    super.key,
    this.onAddressSelected,
    this.showHeader = true,
    this.maxItems = 10,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentSearchAsync = ref.watch(recentSearchNotifierProvider);

    return recentSearchAsync.when(
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, stack) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Lỗi: $err', style: TextStyle(color: Colors.red)),
      ),
      data: (state) {
        if (state.isLoading) {
          return const LinearProgressIndicator();
        }

        if (state.history.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.history, size: 48, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                    'Chưa có lịch sử tìm kiếm',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        }

        final displayItems = state.history.take(maxItems).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showHeader)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tìm kiếm gần đây',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () => ref
                          .read(recentSearchNotifierProvider.notifier)
                          .clearAll(),
                      child: const Text('Xóa tất cả'),
                    ),
                  ],
                ),
              ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: displayItems.length,
                itemBuilder: (context, index) {
                  final item = displayItems[index];
                  return _RecentSearchItem(
                    address: item,
                    onTap: () => onAddressSelected?.call(item),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Item hiển thị một địa chỉ trong lịch sử
class _RecentSearchItem extends StatelessWidget {
  final AddressResult address;
  final VoidCallback? onTap;

  const _RecentSearchItem({required this.address, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.history, color: Colors.grey.shade600, size: 20),
      ),
      title: Text(
        address.fullAddress.split('\n').first,
        style: const TextStyle(fontSize: 16),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _buildSubtitle(),
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            '(${address.latitude.toStringAsFixed(4)}, ${address.longitude.toStringAsFixed(4)})',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  String _buildSubtitle() {
    // Ưu tiên hiển thị city/region nếu có
    if (address.city != null && address.city!.isNotEmpty) {
      return address.city!;
    }
    if (address.region != null && address.region!.isNotEmpty) {
      return address.region!;
    }
    // Fallback: hiển thị tọa độ
    return '${address.latitude.toStringAsFixed(4)}, ${address.longitude.toStringAsFixed(4)}';
  }
}
