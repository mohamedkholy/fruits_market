import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/assets_helper.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});
  final List<String> categories = const [
    Assets.imagesPngCategoryResturants,
    Assets.imagesPngCategoryFarms,
    Assets.imagesPngCategoryCoffee,
    Assets.imagesPngCategoryPharmacy,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                categories.length,
                (index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(25),
                  ),
                  color: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(25),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        categories[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
