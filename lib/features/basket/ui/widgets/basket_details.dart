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
          ...[
            ("Subtotal", "$subtotal KD", 10.0),
            ("Shipping charges", "$shippingCharges KD", 10.0),
            ("Total", "${subtotal + shippingCharges} KD", 0.0),
          ].map(
            (e) => Container(
              margin: EdgeInsets.only(bottom: e.$3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.$1, style: MyTextStyles.font16BoldBlack),
                  Text(e.$2, style: MyTextStyles.font16BoldBlack),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height < 400 ? 10 : 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "$itemCount items",
                  style: MyTextStyles.font16BoldBlack,
                ),
              ),
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
