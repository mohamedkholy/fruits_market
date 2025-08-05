import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/date_formater.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';

class DeliveryTimeLayout extends StatefulWidget {
  const DeliveryTimeLayout({super.key});

  @override
  State<DeliveryTimeLayout> createState() => _DeliveryTimeLayoutState();
}

class _DeliveryTimeLayoutState extends State<DeliveryTimeLayout> {
  int groupValue = 0;
  int deliveryNow = 1;
  int deliveryTime = 2;
  DateTime selectedDate = DateUtils.dateOnly(
    DateTime.now().add(const Duration(days: 1)),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShadowContainer(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Now", style: MyTextStyles.font16BoldBlack),
                  Radio(
                    value: deliveryNow,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ShadowContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Select Delivery Time",
                        style: MyTextStyles.font16BoldBlack,
                      ),
                      Radio(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: deliveryTime,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ShadowContainer(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: InkWell(
                      onTap: () {
                        _pickDate();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormater.formatDateToString(selectedDate),
                            style: MyTextStyles.font16BoldBlack.copyWith(
                              color: MyColors.primaryColor,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: MyColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
