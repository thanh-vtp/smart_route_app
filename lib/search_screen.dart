import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/search/presentation/state/search_notifier.dart';
import 'package:smart_route_app/features/search/presentation/state/search_state.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Controllers for structured search
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _wardController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Bắt sự kiện gõ phím - simple search
    _searchController.addListener(() {
      ref
          .read(searchProvider.notifier)
          .onSearchQueryChanged(_searchController.text);
    });

    // Structured search listeners
    _houseNumberController.addListener(() {
      ref
          .read(searchProvider.notifier)
          .updateHouseNumber(_houseNumberController.text);
    });

    _streetController.addListener(() {
      ref.read(searchProvider.notifier).updateStreet(_streetController.text);
    });

    _wardController.addListener(() {
      ref.read(searchProvider.notifier).updateWard(_wardController.text);
    });

    _districtController.addListener(() {
      ref
          .read(searchProvider.notifier)
          .updateDistrict(_districtController.text);
    });

    _cityController.addListener(() {
      ref.read(searchProvider.notifier).updateCity(_cityController.text);
    });

    _provinceController.addListener(() {
      ref
          .read(searchProvider.notifier)
          .updateProvince(_provinceController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _houseNumberController.dispose();
    _streetController.dispose();
    _wardController.dispose();
    _districtController.dispose();
    _cityController.dispose();
    _provinceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final searchState = ref.watch(searchProvider);

    // Quyết định danh sách nào được hiển thị (Đang search hay Lịch sử)
    final bool isSearching = searchState.searchMode == SearchMode.simple
        ? searchState.query.trim().isNotEmpty
        : _hasStructuredInput();

    final List<AddressResult> currentList = isSearching
        ? searchState.results
        : searchState.historyResults;

    return Scaffold(
      backgroundColor: cs.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header with Search Input
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: cs.onSurface),
                    onPressed: () => context.pop(),
                  ),
                  Expanded(
                    child: searchState.searchMode == SearchMode.simple
                        ? _buildSimpleSearchBar(cs, textTheme)
                        : _buildStructuredSearchButton(cs, textTheme),
                  ),
                  // Toggle search mode button
                  IconButton(
                    icon: Icon(
                      searchState.searchMode == SearchMode.simple
                          ? Icons.tune
                          : Icons.search,
                      color: cs.onSurfaceVariant,
                    ),
                    tooltip: searchState.searchMode == SearchMode.simple
                        ? 'Tìm kiếm nâng cao'
                        : 'Tìm kiếm đơn giản',
                    onPressed: () {
                      ref.read(searchProvider.notifier).toggleSearchMode();
                      // Clear all controllers
                      _searchController.clear();
                      _clearStructuredControllers();
                    },
                  ),
                ],
              ),
            ),

            Divider(height: 1, color: cs.outlineVariant.withOpacity(0.5)),

            // 2. Trạng thái Loading / Lỗi / Kết quả
            Expanded(
              child: _buildBodyContent(
                currentList,
                textTheme,
                cs,
                isSearching,
                searchState,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _hasStructuredInput() {
    return _houseNumberController.text.isNotEmpty ||
        _streetController.text.isNotEmpty ||
        _wardController.text.isNotEmpty ||
        _districtController.text.isNotEmpty ||
        _cityController.text.isNotEmpty ||
        _provinceController.text.isNotEmpty;
  }

  void _clearStructuredControllers() {
    _houseNumberController.clear();
    _streetController.clear();
    _wardController.clear();
    _districtController.clear();
    _cityController.clear();
    _provinceController.clear();
  }

  Widget _buildSimpleSearchBar(ColorScheme cs, TextTheme textTheme) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: cs.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(Icons.search, color: cs.onSurfaceVariant),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: textTheme.bodyLarge?.copyWith(color: cs.onSurface),
              decoration: InputDecoration(
                hintText: 'Bạn muốn đi đâu?',
                hintStyle: textTheme.bodyLarge?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: Icon(Icons.close, color: cs.onSurfaceVariant),
              onPressed: () {
                _searchController.clear();
                ref.read(searchProvider.notifier).clearSearch();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildStructuredSearchButton(ColorScheme cs, TextTheme textTheme) {
    return InkWell(
      onTap: () => _showStructuredSearchDialog(cs, textTheme),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: cs.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Row(
          children: [
            Icon(Icons.tune, color: cs.onSurfaceVariant),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _getStructuredSearchSummary(),
                style: textTheme.bodyLarge?.copyWith(
                  color: _hasStructuredInput()
                      ? cs.onSurface
                      : cs.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (_hasStructuredInput())
              IconButton(
                icon: Icon(Icons.close, color: cs.onSurfaceVariant),
                onPressed: () {
                  _clearStructuredControllers();
                  ref.read(searchProvider.notifier).clearSearch();
                },
              ),
          ],
        ),
      ),
    );
  }

  String _getStructuredSearchSummary() {
    final parts = <String>[];
    if (_houseNumberController.text.isNotEmpty) {
      parts.add(_houseNumberController.text);
    }
    if (_streetController.text.isNotEmpty) {
      parts.add(_streetController.text);
    }
    if (_wardController.text.isNotEmpty) {
      parts.add(_wardController.text);
    }
    if (_districtController.text.isNotEmpty) {
      parts.add(_districtController.text);
    }
    if (_cityController.text.isNotEmpty) {
      parts.add(_cityController.text);
    }
    if (_provinceController.text.isNotEmpty) {
      parts.add(_provinceController.text);
    }

    return parts.isEmpty ? 'Tìm kiếm theo địa chỉ chi tiết' : parts.join(', ');
  }

  void _showStructuredSearchDialog(ColorScheme cs, TextTheme textTheme) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: cs.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tìm kiếm chi tiết',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildStructuredField(
                controller: _houseNumberController,
                label: 'Số nhà',
                hint: 'VD: 123, 45A',
                icon: Icons.tag,
                cs: cs,
                textTheme: textTheme,
              ),
              const SizedBox(height: 12),
              _buildStructuredField(
                controller: _streetController,
                label: 'Tên đường',
                hint: 'VD: Nguyễn Huệ, Đường Lê Lợi',
                icon: Icons.route,
                cs: cs,
                textTheme: textTheme,
              ),
              const SizedBox(height: 12),
              _buildStructuredField(
                controller: _wardController,
                label: 'Phường/Xã',
                hint: 'VD: Bến Nghé, Phường 1',
                icon: Icons.location_city,
                cs: cs,
                textTheme: textTheme,
              ),
              const SizedBox(height: 12),
              _buildStructuredField(
                controller: _districtController,
                label: 'Quận/Huyện',
                hint: 'VD: Quận 1, Huyện Cam Lâm',
                icon: Icons.map,
                cs: cs,
                textTheme: textTheme,
              ),
              const SizedBox(height: 12),
              _buildStructuredField(
                controller: _cityController,
                label: 'Thành phố/Thị xã',
                hint: 'VD: Nha Trang, TP. Hồ Chí Minh',
                icon: Icons.apartment,
                cs: cs,
                textTheme: textTheme,
              ),
              const SizedBox(height: 12),
              _buildStructuredField(
                controller: _provinceController,
                label: 'Tỉnh',
                hint: 'VD: Khánh Hòa, TP. Hồ Chí Minh',
                icon: Icons.public,
                cs: cs,
                textTheme: textTheme,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.search),
                  label: const Text('Tìm kiếm'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStructuredField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required ColorScheme cs,
    required TextTheme textTheme,
  }) {
    return TextField(
      controller: controller,
      style: textTheme.bodyLarge,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: cs.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: cs.surfaceContainerHighest,
      ),
    );
  }

  Widget _buildBodyContent(
    List<AddressResult> currentList,
    TextTheme textTheme,
    ColorScheme cs,
    bool isSearching,
    SearchState searchState,
  ) {
    // 1. Nếu đang gõ và đang chờ API
    if (isSearching && searchState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // 2. Nếu có lỗi từ API
    if (isSearching && searchState.errorMessage != null) {
      return Center(
        child: Text(
          searchState.errorMessage!,
          style: textTheme.bodyLarge?.copyWith(color: cs.error),
        ),
      );
    }

    // 3. Nếu danh sách rỗng
    if (currentList.isEmpty) {
      if (isSearching) {
        // Đang search nhưng không ra
        return Center(
          child: Text(
            'Không tìm thấy địa điểm phù hợp.',
            style: textTheme.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
          ),
        );
      } else {
        // Mới vào nhưng chưa có lịch sử
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.history_toggle_off,
                size: 48,
                color: cs.surfaceVariant,
              ),
              const SizedBox(height: 16),
              Text(
                'Chưa có lịch sử tìm kiếm',
                style: textTheme.bodyLarge?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
        );
      }
    }

    return ListView.separated(
      itemCount: currentList.length,
      separatorBuilder: (context, index) =>
          Divider(height: 1, indent: 72, color: cs.surfaceVariant),
      itemBuilder: (context, index) {
        final item = currentList[index];

        // Cấu hình Icon: Lịch sử hiện đồng hồ, kết quả mới hiện cái ghim
        final IconData icon = isSearching ? Icons.location_on : Icons.schedule;
        final Color iconColor = isSearching ? cs.primary : cs.onSurfaceVariant;
        final Color iconBgColor = isSearching
            ? cs.primaryFixed
            : cs.surfaceContainerHigh;

        return _buildResultItem(
          context,
          item: item,
          icon: icon,
          iconColor: iconColor,
          iconBgColor: iconBgColor,
        );
      },
    );
  }

  Widget _buildResultItem(
    BuildContext context, {
    required AddressResult item,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        // Đóng màn hình Search và truyền kết quả (AddressResult) về cho màn Map
        context.pop(item);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên địa điểm hoặc địa chỉ ngắn
                  Text(
                    item.placeName ?? item.shortLabel ?? item.shortAddress,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Địa chỉ đầy đủ
                  Text(
                    item.formattedAddress,
                    style: textTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Hiển thị thông tin chi tiết nếu có
                  if (item.placeType != null || item.phoneNumber != null) ...[
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        if (item.placeType != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: cs.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              item.placeType!,
                              style: textTheme.labelSmall?.copyWith(
                                color: cs.onPrimaryContainer,
                              ),
                            ),
                          ),
                        if (item.phoneNumber != null)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.phone,
                                size: 14,
                                color: cs.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                item.phoneNumber!,
                                style: textTheme.labelSmall?.copyWith(
                                  color: cs.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],

                  // Score indicator
                  if (item.score < 90) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.info_outline, size: 14, color: cs.tertiary),
                        const SizedBox(width: 4),
                        Text(
                          'Độ chính xác: ${item.score.toStringAsFixed(0)}%',
                          style: textTheme.labelSmall?.copyWith(
                            color: cs.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Distance placeholder
            Column(
              children: [
                Text(
                  '--- km',
                  style: textTheme.labelMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
