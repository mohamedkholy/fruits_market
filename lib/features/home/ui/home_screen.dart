import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/features/home/ui/widgets/ads_layout.dart';
import 'package:fruits_market/features/home/ui/widgets/categories_row.dart';
import 'package:fruits_market/features/home/ui/widgets/sellers_list.dart';
import 'package:fruits_market/features/home/ui/widgets/show_all_selers_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1.0),
        ),
        title: const Text(
          "Fruit Market",
          style: MyTextStyles.font24BoldPrimary,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconData(0xe803, fontFamily: "search"),
              color: MyColors.primaryColor,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconData(0xe801, fontFamily: "settings"),
              color: MyColors.primaryColor,
              size: 24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: const Column(
                      children: [
                        SizedBox(height: 8),
                        AdsLayout(),
                        SizedBox(height: 16),
                        CategoriesRow(),
                        SizedBox(height: 16),
                        ShowAllSelersLayout(),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SellersList(),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
