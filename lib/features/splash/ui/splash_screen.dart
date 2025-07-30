import 'package:flutter/material.dart';
import 'package:fruits_market/assets/assets.dart';

import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, MyRoutes.onBoardingScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(Assets.imagesPngSplash, fit: BoxFit.fill),
      ),
    );
  }
}
