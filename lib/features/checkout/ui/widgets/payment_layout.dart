import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';
import 'package:fruits_market/features/checkout/ui/widgets/order_Details.dart';
import 'package:fruits_market/features/checkout/ui/widgets/select_payment.dart';

class PaymentLayout extends StatelessWidget {
  const PaymentLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          children: [
            ShadowContainer(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Do You Have any Coupon Code?",
                    style: MyTextStyles.font16BoldBlack,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Apply",
                      style: MyTextStyles.font16MediumWhite,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const OrderDetails(),
            const SizedBox(height: 10),
            const SelectPayment(),
          ],
        ),
      ),
    );
  }
}
