// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class IncidentButtonAction {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  IncidentButtonAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}
