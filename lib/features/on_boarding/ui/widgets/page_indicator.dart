import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';

class PageIndicator extends StatelessWidget {
  final int selectedPageIndex;
  const PageIndicator({super.key, required this.selectedPageIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          3,
          (index) => Container(
            width: 12,
            height: 12,
            margin: EdgeInsetsDirectional.symmetric(
              horizontal: index == 1 ? 12 : 0,
            ),
            decoration: BoxDecoration(
              color: selectedPageIndex == index
                  ? MyColors.primaryColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: MyColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
