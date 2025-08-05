import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class BasketDetails extends StatelessWidget {
  final double subtotal;
  final double shippingCharges;
  final int itemCount;
  const BasketDetails({
    super.key,
    required this.subtotal,
    required this.shippingCharges,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Subtotal", style: MyTextStyles.font16BoldBlack),
              Text("$subtotal KD", style: MyTextStyles.font16BoldBlack),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Shipping charges",
                style: MyTextStyles.font16BoldBlack,
              ),
              Text("$shippingCharges KD", style: MyTextStyles.font16BoldBlack),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total", style: MyTextStyles.font16BoldBlack),
              Text(
                "${subtotal + shippingCharges} KD",
                style: MyTextStyles.font16BoldBlack,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$itemCount items", style: MyTextStyles.font16BoldBlack),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryColor,
                  textStyle: MyTextStyles.font16BoldBlack,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.checkoutScreen);
                },
                icon: const Icon(Icons.arrow_forward, size: 22),
                label: const Text("Checkout"),
              ).animate(
                effects: [
                  const SlideEffect(
                    begin: Offset(-.03, 0),
                    end: Offset(.03, 0),
                    duration: Duration(seconds: 1),
                  ),
                ],
                autoPlay: true,
                onComplete: (controller) {
                  controller.repeat(reverse: true);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
