import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_circular_avatar.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';
import 'package:fruits_market/features/favorites/ui/widgets/product_price_text.dart';

class FavoritesItem extends StatelessWidget {
  final Product product;
  const FavoritesItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: IntrinsicHeight(
        child: Row(
          children: [
            const MyCircularAvatar(imageUrl: "", radius: 40),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: MyTextStyles.font16BoldBlack,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const Icon(
                            Icons.heart_broken_rounded,
                            color: MyColors.grey,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: ProductPriceText(product: product)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.store, color: Colors.black, size: 20),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            product.sellerName,
                            style: MyTextStyles.font14MediumBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
