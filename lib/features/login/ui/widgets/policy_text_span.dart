import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class PolicyTextSpan extends StatelessWidget {
  const PolicyTextSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "by continuing you agree to our ",
        style: MyTextStyles.font18RegularBlack,
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: "Terms of Service",
            style: MyTextStyles.font18RegularBlueUnderline,
          ),
          const TextSpan(
            text: " and our ",
            style: MyTextStyles.font18RegularBlack,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: "Privacy Policy",
            style: MyTextStyles.font18RegularBlueUnderline,
          ),
        ],
      ),
    );
  }
}
