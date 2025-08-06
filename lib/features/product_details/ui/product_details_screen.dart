import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/models/product_add_on.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_app_bar.dart';
import 'package:fruits_market/features/product_details/ui/widgets/product_details.dart';
import 'package:fruits_market/features/product_details/ui/widgets/product_image.dart';
import 'package:fruits_market/features/product_details/ui/widgets/select_radio_expansion.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Scaffold(
            floatingActionButton: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.primaryColor,
                textStyle: MyTextStyles.font16BoldBlack,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart, size: 22),
              label: const Text("Add To Basket"),
            ),
            appBar: MyAppBar(
              title: widget.product.name,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    size: 28,
                    color: MyColors.primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    size: 28,
                    color: MyColors.primaryColor,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      ProductImage(
                        productImage: widget.product.imageUrl,
                        discount: widget.product.discount,
                      ),
                      const SizedBox(height: 12),
                      ProductDetails(product: widget.product),
                      const SizedBox(height: 12),
                      SelectRadioExpansion<String>(
                        title: "Select Weight",
                        items: widget.product.availableWeights,
                        labelBuilder: (weight) => weight,
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 12),
                      SelectRadioExpansion<ProductAddOn>(
                        title: "Select Add On",
                        items: widget.product.addOns,
                        labelBuilder: (addOn) => addOn.name,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
