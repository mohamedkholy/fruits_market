import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/widgets/my_circular_avatar.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';
import 'package:fruits_market/features/home/ui/widgets/seller_details_column.dart';

class SellerItem extends StatelessWidget {
  final Seller seller;
  const SellerItem({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MyRoutes.sellerScreen, arguments: seller);
      },
      child: ShadowContainer(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyCircularAvatar(imageUrl: ''),
            const SizedBox(width: 20),
            Expanded(child: SellerDetailsColumn(seller: seller)),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
