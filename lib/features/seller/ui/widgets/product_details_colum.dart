import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class ProductDetailsColum extends StatelessWidget {
  final Product product;
  const ProductDetailsColum({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name, style: MyTextStyles.font16BoldBlack),
        const SizedBox(height: 5),
        Row(
          children: [
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
                  style: MyTextStyles.font14BoldBlack.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        if (product.discount > 0)
          Container(
            decoration: BoxDecoration(
              color: Colors.green.withAlpha(25),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "${product.discount}% off",
              style: MyTextStyles.font14MediumBlack,
            ),
          ),
      ],
    );
  }
}
