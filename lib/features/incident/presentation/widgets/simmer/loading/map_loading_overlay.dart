import 'package:flutter/material.dart';

/// Widget hiển thị loading indicator khi đang tải dữ liệu sự cố
class MapLoadingOverlay extends StatelessWidget {
  const MapLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text('Đang tải dữ liệu sự cố...'),
            ],
          ),
        ),
      ),
    );
  }
}
