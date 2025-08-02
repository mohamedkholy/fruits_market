import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class SellerMetaInfo extends StatelessWidget {
  final Seller seller;
  const SellerMetaInfo({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${seller.rating}", style: MyTextStyles.font14RegularGrey),
        Text(
          "2.5 KM",
          style: MyTextStyles.font14RegularGrey.copyWith(
            color: MyColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
