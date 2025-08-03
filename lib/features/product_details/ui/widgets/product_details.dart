import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(product.name, style: MyTextStyles.font18BoldBlack),
            const Spacer(),
            Text(
              "${product.discountedPrice} KD",
              style: MyTextStyles.font14BoldBlack.copyWith(
                color: product.discount > 0 ? Colors.green : Colors.black,
              ),
            ),
            const SizedBox(width: 10),
            if (product.discount > 0)
              Expanded(
                child: Text(
                  "${product.price} KD",
                  style: MyTextStyles.font16BoldBlack.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Text(product.description, style: MyTextStyles.font14RegularBlack),
        const SizedBox(height: 12),
        Row(
          children: [
            RichText(
              text: TextSpan(
                text: "sell per: ",
                style: MyTextStyles.font18BoldBlack,
                children: [
                  TextSpan(
                    text: product.sellPer,
                    style: MyTextStyles.font16BoldBlue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
