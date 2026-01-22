import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/navigation/presentation/pages/direction_page.dart';
import 'package:smart_route_app/features/incident/presentation/providers/user_location_provider.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/location_picker_map_widget.dart';
import 'package:smart_route_app/features/search/presentation/widgets/recent_search_widget.dart';
import 'package:smart_route_app/features/search/presentation/providers/usecases/use_case_providers.dart';

class SearchDirectionsPage extends ConsumerStatefulWidget {
  final LocationFieldType fieldType;
  final AddressResult? currentStart;
  final AddressResult? currentEnd;

  const SearchDirectionsPage({
    super.key,
    required this.fieldType,
    this.currentStart,
    this.currentEnd,
  });

  @override
  ConsumerState<SearchDirectionsPage> createState() =>
      _SearchDirectionsPageState();
}

class _SearchDirectionsPageState extends ConsumerState<SearchDirectionsPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<AddressResult> _suggestions = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    // Auto focus on text field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
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
        (failure) => setState(() => _isSearching = false),
        (addresses) => setState(() {
          _suggestions = addresses.take(10).toList();
          _isSearching = false;
        }),
      );
    }
  }

  void _selectAddress(AddressResult address) {
    Navigator.pop(context, address);
  }

  /// Mở LocationPickerMapWidget để chọn vị trí trên bản đồ
  Future<void> _openMapPicker() async {
    // Lấy vị trí ban đầu: ưu tiên current location, fallback về Nha Trang
    double initialLat = 12.2388; // Nha Trang default
    double initialLon = 109.1967;

    // Nếu đang chọn start và đã có end -> dùng end làm initial
    // Nếu đang chọn end và đã có start -> dùng start làm initial
    if (widget.fieldType == LocationFieldType.start &&
        widget.currentEnd != null) {
      initialLat = widget.currentEnd!.latitude;
      initialLon = widget.currentEnd!.longitude;
    } else if (widget.fieldType == LocationFieldType.end &&
        widget.currentStart != null) {
      initialLat = widget.currentStart!.latitude;
      initialLon = widget.currentStart!.longitude;
    } else {
      // Thử lấy vị trí GPS hiện tại
      final userLocation = ref.read(userLocationProvider);
      if (userLocation != null) {
        initialLat = userLocation.y;
        initialLon = userLocation.x;
      }
    }

    final result = await Navigator.push<Map<String, double>>(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPickerMapWidget(
          initialLatitude: initialLat,
          initialLongitude: initialLon,
        ),
      ),
    );

    if (result != null && mounted) {
      final lat = result['latitude']!;
      final lon = result['longitude']!;

      // Reverse geocode để lấy địa chỉ
      final reverseGeocodeUseCase = ref.read(reverseGeocodeUseCaseProvider);
      final geocodeResult = await reverseGeocodeUseCase(lat, lon);

      geocodeResult.fold(
        (failure) {
          // Nếu reverse geocode fail, vẫn trả về với tọa độ
          final address = AddressResult(
            fullAddress:
                'Vị trí đã chọn\n${lat.toStringAsFixed(6)}, ${lon.toStringAsFixed(6)}',
            latitude: lat,
            longitude: lon,
            score: 100,
          );
          _selectAddress(address);
        },
        (address) {
          _selectAddress(address);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final hintText = widget.fieldType == LocationFieldType.start
        ? 'Chọn vị trí bắt đầu'
        : 'Chọn điểm đến';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: TextField(
          controller: _searchController,
          focusNode: _focusNode,
          onChanged: _searchAddress,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _searchController.clear();
                      _searchAddress('');
                    },
                    icon: const Icon(Icons.clear, color: Colors.grey),
                  )
                : null,
          ),
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic, color: Colors.blue),
          ),
        ],
      ),
      body: Column(
        children: [
          // "Chọn trên bản đồ" option
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.grey.shade600),
            title: const Text('Chọn trên bản đồ'),
            onTap: () => _openMapPicker(),
          ),
          const Divider(height: 1),

          // Search results or recent searches
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildContent() {
    // Show loading
    if (_isSearching) {
      return const Center(child: CircularProgressIndicator());
    }

    // Show search results if searching
    if (_searchController.text.isNotEmpty && _suggestions.isNotEmpty) {
      return _buildSuggestionsList();
    }

    // Show "no results" if searched but empty
    if (_searchController.text.isNotEmpty && _suggestions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'Không tìm thấy kết quả',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    // Show recent searches
    return _buildRecentSearchesList();
  }

  Widget _buildSuggestionsList() {
    return ListView.builder(
      itemCount: _suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = _suggestions[index];
        final lines = suggestion.fullAddress.split('\n');
        final title = lines.first;
        final subtitle = lines.length > 1 ? lines.sublist(1).join(', ') : null;

        return ListTile(
          leading: Icon(
            Icons.location_on_outlined,
            color: Colors.grey.shade600,
          ),
          title: Text(title, style: const TextStyle(fontSize: 16)),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          onTap: () => _selectAddress(suggestion),
        );
      },
    );
  }

  Widget _buildRecentSearchesList() {
    return RecentSearchWidget(
      showHeader: true,
      maxItems: 10,
      onAddressSelected: (address) => _selectAddress(address),
    );
  }
}
