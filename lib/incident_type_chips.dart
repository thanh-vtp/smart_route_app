import 'package:flutter/material.dart';

/// Enum các loại sự cố
/// crash: tai nạn, traffic: kẹt xe, police: cảnh sát, hazard: nguy hiểm, closure: đường cấm, camera: camera giao thông
enum IncidentType { crash, traffic, police, hazard, closure, camera }

class IncidentTypeData {
  final String label;
  final IconData icon;

  const IncidentTypeData({required this.label, required this.icon});
}

// TODO:
class IncidentTypeStyles {
  static IncidentTypeData getData(IncidentType type) {
    switch (type) {
      case IncidentType.crash:
        return const IncidentTypeData(label: 'Tai nạn', icon: Icons.car_crash);
      case IncidentType.traffic:
        return const IncidentTypeData(label: 'Kẹt xe', icon: Icons.traffic);
      case IncidentType.police:
        return const IncidentTypeData(label: 'CSGT', icon: Icons.local_police);
      case IncidentType.hazard:
        return const IncidentTypeData(label: 'Nguy hiểm', icon: Icons.warning);
      case IncidentType.closure:
        return const IncidentTypeData(label: 'Đường cấm', icon: Icons.block);
      case IncidentType.camera:
        return const IncidentTypeData(label: 'Camera', icon: Icons.videocam);
    }
  }

  static Color getSelectedBackgroundColor(
    BuildContext context,
    IncidentType type,
  ) {
    final cs = Theme.of(context).colorScheme;
    switch (type) {
      case IncidentType.crash:
        return cs.errorContainer;
      case IncidentType.traffic:
        return const Color(0xFFFFF0C2); // traffic-bg
      case IncidentType.police:
        return cs.primaryContainer;
      case IncidentType.hazard:
        return cs.secondaryContainer;
      case IncidentType.closure:
        return cs.surfaceVariant;
      case IncidentType.camera:
        return cs.tertiaryContainer;
    }
  }

  static Color getSelectedTextColor(BuildContext context, IncidentType type) {
    final cs = Theme.of(context).colorScheme;
    switch (type) {
      case IncidentType.crash:
        return cs.onErrorContainer;
      case IncidentType.traffic:
        return const Color(0xFF7A4D00); // traffic-text
      case IncidentType.police:
        return cs.onPrimaryContainer;
      case IncidentType.hazard:
        return cs.onSecondaryContainer;
      case IncidentType.closure:
        return cs.onSurface;
      case IncidentType.camera:
        return cs.onTertiaryContainer;
    }
  }

  static Color getSelectedBorderColor(BuildContext context, IncidentType type) {
    final cs = Theme.of(context).colorScheme;
    switch (type) {
      case IncidentType.crash:
        return cs.error;
      case IncidentType.traffic:
        return const Color(0xFFB56D00); // traffic-border
      case IncidentType.police:
        return cs.primary;
      case IncidentType.hazard:
        return cs.secondary;
      case IncidentType.closure:
        return cs.onSurface;
      case IncidentType.camera:
        return cs.tertiary;
    }
  }

  static Color getUnselectedBackgroundColor(BuildContext context) {
    // Falls back to defined custom surface container hex to ensure accuracy.
    return const Color(0xFFEDEEEF);
  }

  static Color getUnselectedTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSurfaceVariant;
  }
}
