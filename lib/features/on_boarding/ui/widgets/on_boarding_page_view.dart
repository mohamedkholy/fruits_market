import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/features/on_boarding/ui/widgets/onboarding_page.dart';

class OnBoardingPageView extends StatelessWidget {
  final _onBoardingData = const [
    {"title": "E Shopping", "text": "Explore organic fruits & grab them"},
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
    return ExpandablePageView(
      controller: pageViewController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: onPageChanged,
      children: _onBoardingData
          .map(
            (e) => OnboardingPage(
              title: e["title"]!,
              text: e["text"]!,
              selectedIndex: _onBoardingData.indexOf(e),
            ),
          )
          .toList(),
    );
  }
}
