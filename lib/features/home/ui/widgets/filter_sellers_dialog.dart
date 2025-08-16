import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';

class FilterSellersDialog extends StatefulWidget {
  const FilterSellersDialog({super.key});

  @override
  State<FilterSellersDialog> createState() => _FilterSellersDialogState();
}

class _FilterSellersDialogState extends State<FilterSellersDialog> {
  final List<String> items = ["All Areas", "Area 1", "Area 2"];
  String? value = "All Areas";
  int? groupValue = 0;
  int offers = 0;
  int freeDelivery = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 570),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Filter Sellers",
                  style: MyTextStyles.font18BoldBlack,
                ),
                const SizedBox(height: 16),
                const Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Delivers to",
                    style: MyTextStyles.font16MediumGrey,
                  ),
                ),
                const SizedBox(height: 7),
                ShadowContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: Colors.white,
                      value: value,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      isExpanded: true,
                      items: items
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          this.value = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ...{
                  "Offers": offers,
                  "Free Delivery": freeDelivery,
                }.entries.map(
                  (e) => CheckboxListTile(
                    title: Text(e.key),
                    checkboxShape: const CircleBorder(),
                    checkboxScaleFactor: 1.2,
                    controlAffinity: ListTileControlAffinity.leading,
                    side: WidgetStateBorderSide.resolveWith(
                      (states) =>
                          const BorderSide(color: Colors.grey, strokeAlign: 4),
                    ),
                    checkColor: MyColors.primaryColor,
                    activeColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    contentPadding: EdgeInsets.zero,
                    value: groupValue == e.value,
                    onChanged: (value) {
                      setState(() {
                        groupValue = e.value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                FractionallySizedBox(
                  widthFactor: .8,
                  child: MyButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Apply Filter",
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Close",
                    style: MyTextStyles.font16MediumGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
