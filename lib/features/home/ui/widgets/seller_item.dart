import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/features/home/ui/widgets/seller_avatar.dart';
import 'package:fruits_market/features/home/ui/widgets/seller_details_column.dart';
import 'package:fruits_market/features/home/ui/widgets/seller_meta_info.dart';

class SellerItem extends StatelessWidget {
  final Seller seller;
  const SellerItem({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
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
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SellerAvatar(imageUrl: seller.imageUrl),
            const SizedBox(width: 24),
            Expanded(child: SellerDetailsColumn(seller: seller)),
            SellerMetaInfo(seller: seller),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
