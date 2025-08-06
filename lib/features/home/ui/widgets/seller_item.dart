import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/widgets/my_circular_avatar.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';
import 'package:fruits_market/features/home/ui/widgets/seller_details_column.dart';
import 'package:fruits_market/features/home/ui/widgets/seller_meta_info.dart';

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
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyCircularAvatar(imageUrl: '', radius: 40),
              const SizedBox(width: 24),
              Expanded(child: SellerDetailsColumn(seller: seller)),
              SellerMetaInfo(seller: seller),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
