import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';

class CancleOrderDialog extends StatefulWidget {
  const CancleOrderDialog({super.key});

  @override
  State<CancleOrderDialog> createState() => _CancleOrderDialogState();
}

class _CancleOrderDialogState extends State<CancleOrderDialog> {
  final List<String> cancelReasons = const [
    "Changed my mind",
    "Found a better price elsewhere",
    "Order placed by mistake",
    "Item not needed anymore",
    "Delivery is taking too long",
    "Ordered wrong item",
    "Payment issue",
    "Other",
  ];
  String? reason;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 570),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Cancel Order", style: MyTextStyles.font16BoldBlack),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Reason", style: MyTextStyles.font14RegularGrey),
                    const SizedBox(height: 7),
                    ShadowContainer(
                      borderRadius: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          value: reason,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          hint: const Text(
                            "Please Select reason",
                            style: MyTextStyles.font15RegularGrey,
                          ),
                          items: cancelReasons
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (value) => setState(() => reason = value),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Notes", style: MyTextStyles.font14RegularGrey),
                    SizedBox(height: 7),
                    ShadowContainer(
                      borderRadius: 15,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your notes",
                          hintStyle: MyTextStyles.font15RegularGrey,
                          counterText: "",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                FractionallySizedBox(
                  widthFactor: .8,
                  child: MyButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Confirm Cancellation",
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
