import 'package:flutter/material.dart';
import 'incident_type_chips.dart';

// TODO: Widget chọn loại sự cố theo chiều ngang với hiệu ứng "Peek Effect

class HorizontalIncidentSelector extends StatefulWidget {
  final Function(IncidentType) onTypeSelected;
  final IncidentType? initialSelection;

  const HorizontalIncidentSelector({
    super.key,
    required this.onTypeSelected,
    this.initialSelection,
  });

  @override
  State<HorizontalIncidentSelector> createState() =>
      _HorizontalIncidentSelectorState();
}

class _HorizontalIncidentSelectorState
    extends State<HorizontalIncidentSelector> {
  IncidentType? _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialSelection;
  }

  void _handleSelect(IncidentType type) {
    setState(() {
      _selectedType = type;
    });
    widget.onTypeSelected(type);
  }

  @override
  Widget build(BuildContext context) {
    // Fixed dimensions to achieve the "Peek Effect"
    const double itemWidth = 80.0;
    const double itemHeight = 88.0;
    const double gap = 12.0;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      // Padding 16 ensures 5th item starts at ~372px which creates a peel effect on 390px screens
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: IncidentType.values.map((type) {
          final isSelected = _selectedType == type;
          final data = IncidentTypeStyles.getData(type);

          final bgColor = isSelected
              ? IncidentTypeStyles.getSelectedBackgroundColor(context, type)
              : IncidentTypeStyles.getUnselectedBackgroundColor(context);

          final textColor = isSelected
              ? IncidentTypeStyles.getSelectedTextColor(context, type)
              : IncidentTypeStyles.getUnselectedTextColor(context);

          final borderSide = isSelected
              ? BorderSide(
                  color: IncidentTypeStyles.getSelectedBorderColor(
                    context,
                    type,
                  ),
                  width: 2.0,
                )
              : const BorderSide(color: Colors.transparent, width: 2.0);

          final margin = EdgeInsets.only(
            right: type == IncidentType.values.last ? 0 : gap,
          );

          return Padding(
            padding: margin,
            child: GestureDetector(
              onTap: () => _handleSelect(type),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: itemWidth,
                height: itemHeight,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.fromBorderSide(borderSide),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(data.icon, color: textColor, size: 28.0),
                    const SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        data.label,
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge?.copyWith(color: textColor),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
