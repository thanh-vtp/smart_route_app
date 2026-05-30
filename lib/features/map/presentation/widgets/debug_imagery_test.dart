import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/common/presentation/providers/states/get_location_imagery_state.dart';

class DebugImageryTest extends ConsumerWidget {
  const DebugImageryTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationImageryState = ref.watch(locationImageryStateProvider);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Debug Imagery Test',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                AppLogger.ui('🔥 Button pressed - calling getLocationImagery');
                ref
                    .read(locationImageryStateProvider.notifier)
                    .getLocationImagery(21.0285, 105.8542); // Hanoi coordinates
              },
              child: const Text('Test Load Hanoi Satellite Image'),
            ),

            const SizedBox(height: 16),

            locationImageryState.when(
              data: (imagery) {
                if (imagery == null) {
                  return const Text('No imagery data');
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('✅ Success!'),
                    Text('Image size: ${imagery.imageData.length} bytes'),
                    Text('Description: ${imagery.description ?? "N/A"}'),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.memory(
                        imagery.imageData,
                        width: 200,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 8),
                  Text('Loading satellite image...'),
                ],
              ),
              error: (error, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('❌ Error:'),
                  Text(
                    error.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
