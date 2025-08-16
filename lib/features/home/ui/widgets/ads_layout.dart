import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/assets_helper.dart';
import 'package:fruits_market/core/widgets/page_indicator.dart';
import 'package:fruits_market/features/home/ui/widgets/ads_view_page.dart';

class AdsLayout extends StatefulWidget {
  const AdsLayout({super.key});

  @override
  State<AdsLayout> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AdsLayout> {
  int _selectedPageIndex = 0;
  final PageController _controller = PageController();
  List<String> ads = [
    Assets.imagesPngAdExample6,
    Assets.imagesPngAdExample4,
    Assets.imagesPngAdExample5,
    Assets.imagesPngAdExample6,
  ];

  @override
  void initState() {
    _startAdsTimer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return AdsViewPage(
                ads: ads,
                pageController: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _selectedPageIndex = index;
                  });
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        PageIndicator(
          selectedPageIndex: _selectedPageIndex,
          size: 10,
          length: ads.length - 1,
        ),
      ],
    );
  }

  void _startAdsTimer() {
    Future.delayed(
      Duration(milliseconds: _selectedPageIndex == ads.length - 2 ? 500 : 3000),
    ).then((value) {
      if (mounted) {
        if (_selectedPageIndex == ads.length - 1) {
          _controller.jumpToPage(0);
          _startAdsTimer();
        } else {
          _controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          _startAdsTimer();
        }
      }
    });
  }
}
