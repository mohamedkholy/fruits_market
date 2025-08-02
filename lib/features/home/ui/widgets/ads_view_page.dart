import 'package:flutter/material.dart';

class AdsViewPage extends StatelessWidget {
  final List<String> ads;
  final void Function(int) onPageChanged;
  final PageController pageController;
  const AdsViewPage({
    super.key,
    required this.ads,   
    required this.pageController, required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 400 / 130,
      child: SizedBox(
        child: PageView.builder(
          controller: pageController,
          itemCount: ads.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(ads[index], fit: BoxFit.fill),
              ),
            );
          },
          onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}
