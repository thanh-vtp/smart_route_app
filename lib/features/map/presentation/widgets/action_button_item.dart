import 'package:flutter/material.dart';
import 'package:smart_route_app/features/map/presentation/models/incident_button_action.dart';

class ActionButtonItem extends StatelessWidget {
  const ActionButtonItem({super.key, required this.item});
  final IncidentButtonAction item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: item.onTap,
              child: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.teal[100],
                child: Icon(item.icon, color: Colors.teal[700]),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 70,
            child: Text(
              item.label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
