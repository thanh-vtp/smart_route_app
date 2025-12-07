import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';

/// Bottom sheet hiển thị thông tin vị trí (long, lat) trên map
/// Được sử dụng để xác nhận vị trí trước khi báo cáo sự cố
class LocationInfoBottomSheet extends ConsumerStatefulWidget {
  final double initialLatitude;
  final double initialLongitude;
  final ArcGISMapViewController? mapViewController;
  final ArcGISSceneViewController? sceneViewController;
  final VoidCallback? onReport;
  final String title;
  final String? description;

  const LocationInfoBottomSheet({
    super.key,
    required this.initialLatitude,
    required this.initialLongitude,
    this.mapViewController,
    this.sceneViewController,
    this.onReport,
    this.title = 'Thông tin vị trí',
    this.description,
  });

  @override
  ConsumerState<LocationInfoBottomSheet> createState() =>
      _LocationInfoBottomSheetState();
}

class _LocationInfoBottomSheetState
    extends ConsumerState<LocationInfoBottomSheet> {
  String? _addressInfo;
  bool _isLoadingAddress = false;

  @override
  void initState() {
    super.initState();
    _loadAddressInfo();
  }

  /// Load thông tin địa chỉ từ tọa độ (reverse geocoding)
  Future<void> _loadAddressInfo() async {
    setState(() {
      _isLoadingAddress = true;
    });

    try {
      // TODO: Implement reverse geocoding với ArcGIS Locator
      // Tạm thời hiển thị formatted coordinates
      _addressInfo = _formatCoordinates();
    } catch (e) {
      AppLogger.ui('Error loading address info: $e');
      _addressInfo = 'Không thể tải thông tin địa chỉ';
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingAddress = false;
        });
      }
    }
  }

  /// Format tọa độ thành chuỗi dễ đọc
  String _formatCoordinates() {
    final latDeg = widget.initialLatitude.abs().floor();
    final latMin = ((widget.initialLatitude.abs() - latDeg) * 60).floor();
    final latSec =
        (((widget.initialLatitude.abs() - latDeg) * 60 - latMin) * 60);
    final latDir = widget.initialLatitude >= 0 ? 'N' : 'S';

    final lngDeg = widget.initialLongitude.abs().floor();
    final lngMin = ((widget.initialLongitude.abs() - lngDeg) * 60).floor();
    final lngSec =
        (((widget.initialLongitude.abs() - lngDeg) * 60 - lngMin) * 60);
    final lngDir = widget.initialLongitude >= 0 ? 'E' : 'W';

    return '$latDeg°$latMin\'${latSec.toStringAsFixed(2)}"$latDir, '
        '$lngDeg°$lngMin\'${lngSec.toStringAsFixed(2)}"$lngDir';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),

                if (widget.description != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    widget.description!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],

                const SizedBox(height: 24),

                // Coordinates card
                Card(
                  elevation: 0,
                  color: Colors.blue.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildCoordinateRow(
                          icon: Icons.north,
                          label: 'Vĩ độ (Latitude)',
                          value: widget.initialLatitude.toStringAsFixed(6),
                          onCopy: () => _copyToClipboard(
                            widget.initialLatitude.toString(),
                            'Đã copy vĩ độ',
                          ),
                        ),
                        const Divider(height: 24),
                        _buildCoordinateRow(
                          icon: Icons.east,
                          label: 'Kinh độ (Longitude)',
                          value: widget.initialLongitude.toStringAsFixed(6),
                          onCopy: () => _copyToClipboard(
                            widget.initialLongitude.toString(),
                            'Đã copy kinh độ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Address info
                if (_isLoadingAddress)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (_addressInfo != null)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.place, color: Colors.grey[600], size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tọa độ DMS',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _addressInfo!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 24),

                // Action button - chỉ hiển thị nút Báo cáo nếu có onReport
                if (widget.onReport != null)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onReport?.call();
                      },
                      icon: const Icon(Icons.report),
                      label: const Text('Báo cáo sự cố'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.red.shade600,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                // Safe area
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget để hiển thị một dòng tọa độ
  Widget _buildCoordinateRow({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onCopy,
  }) {
    AppLogger.ui('Coordinate row: $label = $value');
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blue.shade700),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onCopy,
          icon: const Icon(Icons.copy, size: 18),
          tooltip: 'Copy',
        ),
      ],
    );
  }

  /// Copy text to clipboard
  void _copyToClipboard(String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }
}
