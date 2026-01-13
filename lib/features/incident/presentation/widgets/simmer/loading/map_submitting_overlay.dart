import 'package:flutter/material.dart';

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
