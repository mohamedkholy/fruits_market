import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/widgets/my_circular_avatar.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';
import 'package:fruits_market/features/seller/ui/widgets/product_details_colum.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MyRoutes.productDetailsScreen,
          arguments: product,
        );
      },
      child: ShadowContainer(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Row(
          children: [
            const MyCircularAvatar(imageUrl: ''),
            const SizedBox(width: 24),
            Expanded(child: ProductDetailsColum(product: product)),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: MyColors.primaryColor.withAlpha(200),
              radius: 23,
              child: IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.add_shopping_cart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
