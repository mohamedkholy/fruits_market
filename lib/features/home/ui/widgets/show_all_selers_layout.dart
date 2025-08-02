import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class ShowAllSelersLayout extends StatelessWidget {
  const ShowAllSelersLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Sellers", style: MyTextStyles.font16BoldBlack),
        GestureDetector(
          onTap: () {},
          child: const Text("Show All", style: MyTextStyles.font16BoldBlue),
        ),
      ],
    );
  }
}
