import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';

class PageIndicator extends StatelessWidget {
  final int selectedPageIndex;
  final double size;
  final int length;
  const PageIndicator({
    super.key,
    required this.selectedPageIndex,
    required this.size,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          length,
          (index) => Container(
            width: size,
            height: size,
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: selectedPageIndex == index
                  ? MyColors.primaryColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(size),
              border: Border.all(color: MyColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
