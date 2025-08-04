import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class ProductPriceText extends StatelessWidget {
  final Product product;
  final int? quantity;
  const ProductPriceText({super.key, required this.product, this.quantity});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text:
            "${(product.discountedPrice * (quantity ?? 1)).toStringAsFixed(2)} KD    ",
        style: MyTextStyles.font14BoldBlack.copyWith(
          color: product.discount > 0 ? Colors.green : Colors.black,
        ),
        children: [
          if (product.discount > 0)
            TextSpan(
              text:
                  "${(product.price * (quantity ?? 1)).toStringAsFixed(2)} KD",
              style: MyTextStyles.font14BoldBlack.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
            ),
        ],
      ),
    );
  }
}
