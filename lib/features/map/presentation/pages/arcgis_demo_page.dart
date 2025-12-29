import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/arcgis_demo_widget.dart';

class ArcGISDemoPage extends ConsumerWidget {
  const ArcGISDemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ArcGISDemoWidget();
  }
}
