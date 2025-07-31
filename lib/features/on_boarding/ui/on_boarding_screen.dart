import 'package:flutter/material.dart';
import 'package:fruits_market/core/di/dependency_injection.dart';
import 'package:fruits_market/core/helpers/shared_preferences_keys.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/features/on_boarding/ui/widgets/on_boarding_page_view.dart';
import 'package:fruits_market/features/on_boarding/ui/widgets/page_indicator.dart';
import 'package:fruits_market/features/on_boarding/ui/widgets/skip_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pageViewController = PageController();
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 32,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SkipButton(),
                      const SizedBox(height: 60),
                      OnBoardingPageView(
                        pageViewController: _pageViewController,
                        onPageChanged: (index) {
                          setState(() {
                            _selectedPageIndex = index;
                          });
                        },
                      ),
                      const SizedBox(height: 50),
                      PageIndicator(selectedPageIndex: _selectedPageIndex),
                      const SizedBox(height: 90),
                      MyButton(
                        text: _selectedPageIndex == 2 ? "Get Started" : "Next",
                        onPressed: () {
                          if (_selectedPageIndex != 2) {
                            _pageViewController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear,
                            );
                          } else {
                            getIt<SharedPreferences>().setBool(
                              SharedPreferencesKeys.isFirstLaunch,
                              false,
                            );
                            Navigator.pushReplacementNamed(
                              context,
                              MyRoutes.loginScreen,
                            );
                          }
                        },
                        width: 177,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
