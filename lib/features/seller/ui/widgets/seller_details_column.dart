import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/features/seller/ui/widgets/seller_delivery_details.dart';

class SellerDetailsColumn extends StatelessWidget {
  final Seller seller;
  const SellerDetailsColumn({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(seller.name, style: MyTextStyles.font16BoldBlack),
        Text(seller.mainProduct, style: MyTextStyles.font14RegularGrey),
        const SizedBox(height: 5),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  Text(
                    "  ${seller.rating}",
                    style: MyTextStyles.font13MediumBlack,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            CircleAvatar(
              radius: 3,
              backgroundColor: seller.isOpen ? Colors.green : Colors.red,
            ),
            Text(
              " ${seller.isOpen ? " Open" : " Close"}",
              style: MyTextStyles.font14MediumBlack.copyWith(
                color: seller.isOpen ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SellerDeliveryDetails(
          deliveryTime: seller.deliveryTime,
          deliveryFee: seller.deliveryFee,
        ),
      ],
    );
  }
}
