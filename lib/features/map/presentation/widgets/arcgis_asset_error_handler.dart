import 'package:flutter/material.dart';

class ArcGISAssetErrorHandler extends StatelessWidget {
  final Widget child;
  final Widget? fallback;

  const ArcGISAssetErrorHandler({
    super.key,
    required this.child,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        try {
          return child;
        } catch (e) {
          if (e.toString().contains('arcgis_runtime_feature_set.txt')) {
            return fallback ?? _buildAssetErrorFallback(context);
          }
          rethrow;
        }
      },
    );
  }

  Widget _buildAssetErrorFallback(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange[200]!),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning, color: Colors.orange[700], size: 48),
          const SizedBox(height: 12),
          const Text(
            'ArcGIS Maps Asset Error',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Có lỗi với ArcGIS Maps package assets. '
            'Tính năng geocoding vẫn hoạt động bình thường.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 12),
          const Text(
            'Giải pháp:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            '• flutter clean && flutter pub get\n'
            '• Restart IDE\n'
            '• Kiểm tra ArcGIS Maps package version',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
