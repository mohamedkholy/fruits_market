import 'package:flutter/material.dart';
import 'package:fruits_market/features/on_boarding/ui/widgets/onboarding_page.dart';

class OnBoardingPageView extends StatelessWidget {
  final _onBoardingData = const [
    {"title": "E Shopping", "text": "Explore op organic fruits & grab them"},
    {"title": "Delivery Arrived", "text": "Order is arrived at your Place"},
    {"title": "Delivery Arrived", "text": "Order is arrived at your Place"},
  ];
  final PageController pageViewController;
  final void Function(int) onPageChanged;
  const OnBoardingPageView({
    super.key,
    required this.pageViewController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: PageView.builder(
        controller: pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) => OnboardingPage(
          title: _onBoardingData[index]["title"]!,
          text: _onBoardingData[index]["text"]!,
          selectedIndex: index,
        ),
      ),
    );
  }
}
