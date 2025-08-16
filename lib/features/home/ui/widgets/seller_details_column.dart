import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class SellerDetailsColumn extends StatelessWidget {
  final Seller seller;
  const SellerDetailsColumn({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(seller.name, style: MyTextStyles.font16BoldBlack),
            ),
            Text("${seller.rating}", style: MyTextStyles.font14RegularGrey),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(
              Icons.delivery_dining_outlined,
              color: MyColors.primaryColor,
              size: 20,
            ),
            Expanded(
              child: Text(
                "  Delivery Chargs: ${seller.deliveryFee} KD",
                style: MyTextStyles.font14RegularGrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Wrap(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: MyColors.grey,
                      ),
                      Text(
                        " ${seller.isOpen ? " Open" : " Close"}",
                        style: MyTextStyles.font14RegularGrey.copyWith(
                          color: seller.isOpen ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: MyColors.grey,
                      ),
                      Text(
                        "  ${seller.mainProduct}",
                        style: MyTextStyles.font14RegularGrey.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "2.5 KM",
              style: MyTextStyles.font14RegularGrey.copyWith(
                color: MyColors.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
