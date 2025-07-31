import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_market/assets/assets.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class FacebookButton extends StatelessWidget {
  final VoidCallback onPressed;
  const FacebookButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 15),
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color(0xff235C95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(Assets.imagesSvgFacebook, height: 20),
      label: const Text(
        "Sign in with Facebook",
        style: MyTextStyles.font14RegularWhite,
      ),
    );
  }
}
