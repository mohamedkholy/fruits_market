import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_circular_avatar.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';
import 'package:fruits_market/features/basket/data/models/basket_item.dart';
import 'package:fruits_market/features/favorites/ui/widgets/product_price_text.dart';

class BasketItemWidget extends StatelessWidget {
  final BasketItem basketItem;
  const BasketItemWidget({super.key, required this.basketItem});

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: IntrinsicHeight(
        child: Row(
          children: [
            const MyCircularAvatar(imageUrl: ""),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          basketItem.product.name,
                          style: MyTextStyles.font16BoldBlack,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.delete_forever,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ProductPriceText(
                          product: basketItem.product,
                          quantity: basketItem.quantity,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            const Icon(Icons.remove, size: 25),
                            const SizedBox(width: 10),
                            Text(
                              basketItem.quantity.toString(),
                              style: MyTextStyles.font16BoldBlack,
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.add, size: 25),
                          ],
                        ),
                      ),
                    ],
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
