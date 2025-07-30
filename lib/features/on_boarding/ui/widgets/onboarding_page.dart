import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_market/assets/assets.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String text;
  final int selectedIndex;
  const OnboardingPage({
    super.key,
    required this.title,
    required this.text,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.imagesSvgOnboardingIcon),
        const SizedBox(height: 24),
        Text(
          title,
          style: MyTextStyles.font22BoldBlack,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          text,
          textAlign: TextAlign.center,
          style: MyTextStyles.font17RegularGrey,
        ),
      ],
    );
  }
}
