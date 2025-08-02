import 'package:flutter/material.dart';
import 'package:fruits_market/assets/assets.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/features/seller/ui/widgets/seller_info.dart';

class AppBarBackground extends StatelessWidget {
  final Seller seller;
  const AppBarBackground({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          Assets.download,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 230,
        ),
        Transform(
          transform: Matrix4.translationValues(0, 180, 0),
          child: Container(
            height: 125,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: SellerInfo(seller: seller),
          ),
        ),
      ],
    );
  }
}
