import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_market/core/helpers/assets_helper.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';

class SelectPayment extends StatefulWidget {
  const SelectPayment({super.key});

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  final Map<String, String> paymentMethods = const {
    "Credit Card/Debit card": Assets.imagesSvgCredit,
    "Cash of Delivery": Assets.imagesSvgCash,
    "Knet": Assets.imagesSvgKnet,
  };

  int selectedPaymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Payment", style: MyTextStyles.font16BoldBlack),
        const SizedBox(height: 20),
        for (int i = 0; i < paymentMethods.length; i++)
          ShadowContainer(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(paymentMethods.values.elementAt(i)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    paymentMethods.keys.elementAt(i),
                    style: MyTextStyles.font16BoldBlack,
                  ),
                ),
                Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: i,
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
