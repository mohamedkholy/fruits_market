import 'package:flutter/material.dart';
import 'package:fruits_market/assets/assets.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class FailureLayout extends StatelessWidget {
  const FailureLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 120),
        Image.asset(Assets.imagesPngFailureOrder),
        const SizedBox(height: 70),
        Text(
          "OPS!",
          style: MyTextStyles.font24BoldPrimary.copyWith(color: Colors.red),
        ),
        const SizedBox(height: 20),
        const Text(
          "Error while confirming your payment/order",
          textAlign: TextAlign.center,
          style: MyTextStyles.font16MediumGrey,
        ),
        const SizedBox(height: 50),
        FractionallySizedBox(
          widthFactor: .8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              textStyle: MyTextStyles.font16BoldBlack,
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Back"),
          ),
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}
