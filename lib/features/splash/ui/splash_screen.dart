import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/assets/assets.dart';

import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/features/splash/logic/splash_cubit.dart';
import 'package:fruits_market/features/splash/logic/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<SplashCubit>().checkFirstLaunch();
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        Future.delayed(const Duration(seconds: 2)).then((value) {
          if (context.mounted) {
            if (state is SplashOnboarding) {
              Navigator.pushReplacementNamed(
                context,
                MyRoutes.onBoardingScreen,
              );
            } else if (state is SplashHome) {
              Navigator.pushReplacementNamed(context, MyRoutes.navigationScreen);
            } else if (state is SplashLogin) {
              Navigator.pushReplacementNamed(context, MyRoutes.loginScreen);
            }
          }
        });
      },
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(Assets.imagesPngSplash, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
