import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class SignInTextspan extends StatelessWidget {
  const SignInTextspan({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Already have an account? ",
        style: MyTextStyles.font18RegularGrey,
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(MyRoutes.loginScreen),
                );
              },
            text: "Sign in",
            style: MyTextStyles.font18RegularBlueUnderline,
          ),
        ],
      ),
    );
  }
}
