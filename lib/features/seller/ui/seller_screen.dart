import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/features/seller/ui/widgets/app_bar_background.dart';
import 'package:fruits_market/features/seller/ui/widgets/categories_row.dart';
import 'package:fruits_market/features/seller/ui/widgets/products_list.dart';

class SellerScreen extends StatelessWidget {
  final Seller seller;
  const SellerScreen({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        right: false,
        left: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 270,
                  automaticallyImplyLeading: false,
                  surfaceTintColor: Colors.white,
                  actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: MyColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: MyColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.symmetric(vertical: 10),
                    collapseMode: CollapseMode.pin,
                    background: AppBarBackground(seller: seller),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text("categories", style: MyTextStyles.font16BoldBlack),
                        SizedBox(height: 10),
                        CategoriesRow(),
                        SizedBox(height: 10),
                        Text("products", style: MyTextStyles.font16BoldBlack),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const ProductsList(products: []),
                const SliverToBoxAdapter(child: SizedBox(height: 30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
