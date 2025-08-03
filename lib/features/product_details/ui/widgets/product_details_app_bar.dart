import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class ProductDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String productName;
  const ProductDetailsAppBar({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: Colors.grey[300], height: 1.0),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      title: Text(productName, style: MyTextStyles.font24BoldPrimary),
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
          icon: const Icon(Icons.share, size: 28, color: MyColors.primaryColor),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
