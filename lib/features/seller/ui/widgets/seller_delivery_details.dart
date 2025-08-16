import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class SellerDeliveryDetails extends StatelessWidget {
  final String deliveryTime;
  final double deliveryFee;
  const SellerDeliveryDetails({
    super.key,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Icon(
          Icons.access_time_rounded,
          color: MyColors.primaryColor,
          size: 20,
        ),
        Text("  $deliveryTime", style: MyTextStyles.font14MediumBlack),
        const SizedBox(width: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.delivery_dining_outlined,
              color: MyColors.primaryColor,
              size: 20,
            ),
            Text(
              "  KD ${deliveryFee.toStringAsFixed(1)}",
              style: MyTextStyles.font14MediumBlack,
            ),
          ],
        ),
      ],
    );
  }
}
