import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class SelectRadioExpansion<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T) labelBuilder;
  final void Function(T?)? onChanged;

  const SelectRadioExpansion({
    super.key,
    required this.title,
    required this.items,
    required this.labelBuilder,
    this.onChanged,
  });

  @override
  State<SelectRadioExpansion<T>> createState() =>
      _SelectRadioExpansionState<T>();
}

class _SelectRadioExpansionState<T> extends State<SelectRadioExpansion<T>> {
  T? selectedValue;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      initiallyExpanded: true,
      showTrailingIcon: false,
      onExpansionChanged: (value) {
        setState(() {
          isExpanded = value;
        });
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.title, style: MyTextStyles.font16BoldBlack),
              const Spacer(),
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up_outlined
                    : Icons.keyboard_arrow_down_outlined,
                size: 24,
              ),
            ],
          ),
          const Divider(color: Colors.grey, thickness: 1),
        ],
      ),
      children: [
        ...List.generate(
          widget.items.length,
          (index) => Row(
            children: [
              Radio<T>(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: widget.items[index],
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  widget.onChanged?.call(value);
                },
              ),
              Text(
                widget.labelBuilder(widget.items[index]),
                style: MyTextStyles.font14MediumBlack,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
