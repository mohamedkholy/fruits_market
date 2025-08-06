import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/font_weight_helper.dart';
import 'package:fruits_market/core/models/order.dart';
import 'package:fruits_market/core/models/payment_method.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class TrackedOrderDetailsColumn extends StatelessWidget {
  const TrackedOrderDetailsColumn({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: 'Your order Code: ',
            style: MyTextStyles.font18RegularGrey,
            children: [
              TextSpan(
                text: order.id,
                style: MyTextStyles.font18BoldPrimary.copyWith(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeightHelper.extraBold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${order.itemCount} items - ${order.totalAmount} KD',
          style: MyTextStyles.font18RegularGrey,
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: 'Payment Method: ',
            style: MyTextStyles.font18RegularGrey,
            children: [
              TextSpan(
                text: order.paymentMethod.displayName,
                style: MyTextStyles.font18BoldPrimary.copyWith(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeightHelper.extraBold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
