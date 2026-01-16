import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_info_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_center_providers.dart';
import 'package:smart_route_app/features/map/presentation/widgets/recent_search_widget.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/search/presentation/providers/selected_address.dart';
import 'package:smart_route_app/features/search/presentation/providers/usecases/use_case_providers.dart';
import 'package:smart_route_app/features/search/presentation/widgets/map_search_top_bar.dart';

class SearchMapPage extends ConsumerStatefulWidget {
  const SearchMapPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchMapPageState();
}

class _SearchMapPageState extends ConsumerState<SearchMapPage> {
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;

  bool _isSearching = false;
  List<AddressResult> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> _searchAddress(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        _suggestions = [];
        _isSearching = false;
      });
      return;
    }

    setState(() => _isSearching = true);

    final useCase = ref.read(geocodeAddressUseCaseProvider);
    final result = await useCase(query);

    if (mounted) {
      result.fold(
        (failure) => setState(() {
          _isSearching = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Lỗi: ${failure.technicalMessage}')),
          );
        }),
        (addresses) => setState(() {
          _suggestions = addresses.take(10).toList();
          _isSearching = false;
        }),
      );
    }
  }

  Future<void> _selectAddress(AddressResult address) async {
    // Lưu địa chỉ đã chọn vào provider (để hiển thị trên MapSearchTopBar)
    ref.read(selectedAddressProvider.notifier).setAddress(address: address);

    // Add marker tại vị trí được chọn
    final point = ArcGISPoint(
      x: address.longitude,
      y: address.latitude,
      spatialReference: SpatialReference.wgs84,
    );
    sharedLocationMarkerHelper.addMarker(point);

    // Yêu cầu map di chuyển đến vị trí được chọn
    ref.read(navigateToPointProvider.notifier).navigateTo(point, scale: 5000);

    // Show LocationInfoDraggableSheet với tọa độ đã chọn
    ref
        .read(mapBottomSheetProvider.notifier)
        .showLocationInfo(address.latitude, address.longitude);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          MapSearchTopBar(
            leadingIcon: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: Expanded(
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                autofocus: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    left: 14,
                    top: 16,
                    bottom: 12,
                  ),
                  hintText: 'Tìm kiếm ở đây',
                  border: InputBorder.none,
                  suffixIcon: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _searchController,
                    builder: (context, value, child) {
                      if (value.text.isEmpty) return const SizedBox.shrink();
                      return IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        onPressed: () {
                          _searchController.clear();
                          _searchFocusNode.requestFocus();
                          setState(() => _suggestions = []);
                        },
                      );
                    },
                  ),
                ),
                style: const TextStyle(fontSize: 16),
                onChanged: _searchAddress,
                onSubmitted: _searchAddress,
              ),
            ),
            trailingIcon: const Icon(Icons.mic),
          ),

          // Loading indicator
          if (_isSearching) const LinearProgressIndicator(),

          const Divider(height: 1),

          // Hiển thị kết quả tìm kiếm hoặc lịch sử
          Expanded(
            child: _suggestions.isNotEmpty
                ? _buildSearchResults()
                : RecentSearchWidget(onAddressSelected: _selectAddress),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: _suggestions.length,
      itemBuilder: (context, index) {
        final address = _suggestions[index];
        return ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.location_on,
              color: Colors.blue.shade600,
              size: 20,
            ),
          ),
          title: Text(
            address.fullAddress.split('\n').first,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _buildSubtitle(address),
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => _selectAddress(address),
        );
      },
    );
  }

  String _buildSubtitle(AddressResult address) {
    final parts = <String>[];
    if (address.district != null) parts.add(address.district!);
    if (address.city != null) parts.add(address.city!);
    if (address.region != null && address.region != address.city) {
      parts.add(address.region!);
    }
    return parts.isNotEmpty ? parts.join(', ') : address.fullAddress;
  }
}
