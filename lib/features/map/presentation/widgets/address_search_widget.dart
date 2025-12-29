import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/domain/entities/address_result.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/geocode_address_state.dart';

class AddressSearchWidget extends HookConsumerWidget {
  final Function(AddressResult)? onAddressSelected;
  final String? hintText;

  const AddressSearchWidget({super.key, this.onAddressSelected, this.hintText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final focusNode = useFocusNode();
    final isSearching = useState(false);
    final searchResults = useState<List<AddressResult>>([]);
    final showResults = useState(false);

    useEffect(() {
      void listener() {
        final text = searchController.text.trim();
        if (text.length >= 3) {
          isSearching.value = true;
          // Debounce search
          Future.delayed(const Duration(milliseconds: 500), () {
            if (searchController.text.trim() == text) {
              _performSearch(ref, text);
            }
          });
        } else {
          showResults.value = false;
          searchResults.value = [];
        }
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, []);

    // Listen to geocoding state changes
    ref.listen(geocodeAddressStateProvider, (previous, next) {
      next.whenOrNull(
        data: (results) {
          isSearching.value = false;
          if (results != null) {
            searchResults.value = results;
            showResults.value = results.isNotEmpty;
          }
        },
        error: (error, _) {
          isSearching.value = false;
          showResults.value = false;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Lỗi tìm kiếm: $error')));
        },
      );
    });

    return Column(
      children: [
        // Search input
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: searchController,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText ?? 'Tìm kiếm địa chỉ...',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: isSearching.value
                  ? const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        searchController.clear();
                        showResults.value = false;
                        focusNode.unfocus();
                      },
                      icon: const Icon(Icons.clear, color: Colors.grey),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                _performSearch(ref, value.trim());
              }
            },
          ),
        ),

        // Search results
        if (showResults.value) ...[
          const SizedBox(height: 8),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: searchResults.value.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final result = searchResults.value[index];
                return ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.blue),
                  title: Text(
                    result.fullAddress,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: _buildAddressSubtitle(result),
                  trailing: Text(
                    '${(result.score).toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: _getScoreColor(result.score),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    searchController.text = result.fullAddress;
                    showResults.value = false;
                    focusNode.unfocus();
                    if (onAddressSelected != null) {
                      onAddressSelected!(result);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildAddressSubtitle(AddressResult result) {
    final parts = <String>[];

    if (result.district != null) parts.add(result.district!);
    if (result.city != null) parts.add(result.city!);
    if (result.region != null) parts.add(result.region!);

    final subtitle = parts.join(', ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subtitle.isNotEmpty)
          Text(subtitle, style: const TextStyle(fontSize: 12)),
        Text(
          'Lat: ${result.latitude.toStringAsFixed(4)}, Lon: ${result.longitude.toStringAsFixed(4)}',
          style: TextStyle(fontSize: 11, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Color _getScoreColor(double score) {
    if (score >= 90) return Colors.green;
    if (score >= 70) return Colors.orange;
    return Colors.red;
  }

  void _performSearch(WidgetRef ref, String query) {
    ref.read(geocodeAddressStateProvider.notifier).geocodeAddress(query);
  }
}
