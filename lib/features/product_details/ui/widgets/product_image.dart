import 'package:flutter/material.dart';
import 'package:fruits_market/assets/assets.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class ProductImage extends StatelessWidget {
  final String productImage;
  final double discount;
  const ProductImage({
    super.key,
    required this.productImage,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 388 / 232,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(Assets.productExample, fit: BoxFit.cover),
          ),
        ),
        if (discount > 0)
          Positioned.directional(
            textDirection: TextDirection.ltr,
            end: 16,
            top: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "10% Off Discount",
                style: MyTextStyles.font14MediumBlack,
              ),
            ),
          ),
      ],
    );
  }
}
