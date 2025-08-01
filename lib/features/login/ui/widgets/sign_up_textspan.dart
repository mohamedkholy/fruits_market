import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class SignUpTextspan extends StatelessWidget {
  const SignUpTextspan({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Don't have an account? ",
        style: MyTextStyles.font18RegularGrey,
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pushNamed(context, MyRoutes.signupScreen);
            },
            text: "Sign up",
            style: MyTextStyles.font18RegularBlueUnderline,
          ),
        ],
      ),
    );
  }
}
