import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/core/widgets/my_circular_avatar.dart';
import 'package:fruits_market/features/seller/ui/widgets/seller_details_column.dart';

class SellerInfo extends StatelessWidget {
  final Seller seller;
  const SellerInfo({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCircularAvatar(imageUrl: seller.imageUrl, radius: 10, size: 70),
          const SizedBox(width: 24),
          Expanded(child: SellerDetailsColumn(seller: seller)),
        ],
      ),
    );
  }
}
