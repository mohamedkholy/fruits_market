import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_circular_avatar.dart';
import 'package:fruits_market/features/basket/data/models/basket_item.dart';

class BasketItemWidget extends StatelessWidget {
  final BasketItem basketItem;
  const BasketItemWidget({super.key, required this.basketItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
      ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          basketItem.product.name,
                          style: MyTextStyles.font16BoldBlack,
                        ),
                      ),
                      const Spacer(),
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
                        child: RichText(
                          text: TextSpan(
                            text:
                                "${((basketItem.product.price - basketItem.product.price * basketItem.product.discount) * basketItem.quantity).toStringAsFixed(2)} KD    ",
                            style: MyTextStyles.font14BoldBlack.copyWith(
                              color: basketItem.product.discount > 0
                                  ? Colors.green
                                  : Colors.black,
                            ),
                            children: [
                              if (basketItem.product.discount > 0)
                                TextSpan(
                                  text:
                                      "${(basketItem.product.price * basketItem.quantity).toStringAsFixed(2)} KD",
                                  style: MyTextStyles.font14BoldBlack.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                            ],
                          ),
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
