import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/core/widgets/my_circular_avatar.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';
import 'package:fruits_market/features/seller/ui/widgets/seller_details_column.dart';

class SellerInfo extends StatelessWidget {
  final Seller seller;
  const SellerInfo({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyCircularAvatar(imageUrl: '', radius: 10, size: 70),
          const SizedBox(width: 24),
          Expanded(child: SellerDetailsColumn(seller: seller)),
        ],
      ),
    );
  }
}
