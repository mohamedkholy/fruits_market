import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/assets_helper.dart';

class CategoriesRow extends StatelessWidget {
  final List<String> categories = const [
    Assets.imagesPngCategoryResturants,
    Assets.imagesPngCategoryFarms,
    Assets.imagesPngCategoryCoffee,
    Assets.imagesPngCategoryPharmacy,
  ];
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              4,
              (index) => Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(25),
                  ),
                  color: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(25),
                    child: Image.asset(categories[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
