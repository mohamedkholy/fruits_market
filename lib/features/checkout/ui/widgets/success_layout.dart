import 'package:flutter/material.dart';
import 'package:fruits_market/assets/assets.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';

class SuccessLayout extends StatelessWidget {
  const SuccessLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FractionallySizedBox(
          widthFactor: .8,
          child: Image.asset(Assets.imagesPngPayConfirm),
        ),
        const SizedBox(height: 20),
        const Text(
          "YOUR ORDER IS CONFIRMED!",
          textAlign: TextAlign.center,
          style: MyTextStyles.font24BoldPrimary,
        ),
        const SizedBox(height: 20),
        const Text(
          "Your order code: #243188",
          textAlign: TextAlign.center,
          style: MyTextStyles.font16MediumGrey,
        ),
        const Text(
          "Thank you for choosing our products!",
          textAlign: TextAlign.center,
          style: MyTextStyles.font16MediumGrey,
        ),
        const SizedBox(height: 32),
        FractionallySizedBox(
          widthFactor: .8,
          child: MyButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: "Continue Shopping",
          ),
        ),
        const SizedBox(height: 20),
        FractionallySizedBox(
          widthFactor: .8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: MyColors.primaryColor,
              minimumSize: const Size.fromHeight(50),
              textStyle: MyTextStyles.font16BoldBlack,
              backgroundColor: Colors.white,
              side: const BorderSide(color: MyColors.primaryColor),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Track Order"),
          ),
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}
