import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/features/favorites/ui/widgets/product_price_text.dart';

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
            Expanded(
              child: Text(product.name, style: MyTextStyles.font18BoldBlack),
            ),
            ProductPriceText(product: product),
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
                style: MyTextStyles.font16BoldBlack,
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
