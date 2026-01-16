import 'package:flutter/material.dart';
import 'package:smart_route_app/features/search/domain/entities/nearby_place.dart';

/// Widget hiển thị danh sách địa điểm với expand/collapse
class NearbyPlaceList extends StatefulWidget {
  final List<NearbyPlace> places;
  final Function(NearbyPlace) onPlaceTap;
  final Function(NearbyPlace)? onDirectionTap;

  const NearbyPlaceList({
    super.key,
    required this.places,
    required this.onPlaceTap,
    this.onDirectionTap,
  });

  @override
  State<NearbyPlaceList> createState() => NearbyPlaceListState();
}

class NearbyPlaceListState extends State<NearbyPlaceList> {
  static const int _defaultCount = 5;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final totalCount = widget.places.length;
    final displayCount = _isExpanded
        ? totalCount
        : totalCount.clamp(0, _defaultCount);
    final displayPlaces = widget.places.take(displayCount).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Danh sách địa điểm
        ...displayPlaces.map((place) => _buildPlaceItem(place)),

        // Nút Xem tất cả / Thu gọn
        if (totalCount > _defaultCount) ...[
          const SizedBox(height: 8),
          Center(
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 20,
              ),
              label: Text(
                _isExpanded
                    ? 'Thu gọn'
                    : 'Xem tất cả (${totalCount - _defaultCount} địa điểm khác)',
              ),
              style: TextButton.styleFrom(foregroundColor: Colors.blue[700]),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPlaceItem(NearbyPlace place) {
    final category = place.emergencyCategory;
    final color = category.color;

    // Format khoảng cách
    String distanceText = '';
    if (place.distance > 1000) {
      distanceText = '${(place.distance / 1000).toStringAsFixed(1)} km';
    } else {
      distanceText = '${place.distance.toStringAsFixed(0)} m';
    }

    return InkWell(
      onTap: () => widget.onPlaceTap(place),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  category.icon,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name.isNotEmpty ? place.name : category.displayName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          category.displayName,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.directions_walk,
                        size: 12,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 2),
                      Text(
                        distanceText,
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Direction button
            if (widget.onDirectionTap != null)
              IconButton(
                onPressed: () => widget.onDirectionTap?.call(place),
                icon: const Icon(Icons.directions_outlined, size: 20),
                color: Colors.blue,
                tooltip: 'Chỉ đường',
                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                padding: EdgeInsets.zero,
              ),
          ],
        ),
      ),
    );
  }
}
