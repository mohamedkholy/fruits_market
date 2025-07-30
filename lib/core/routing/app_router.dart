import 'package:flutter/material.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:fruits_market/features/splash/ui/splash_screen.dart';

abstract class AppRouter {
 static Route?  getRoutes(RouteSettings settings) {
     switch (settings.name) {
      case MyRoutes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
         case MyRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
      default:
        return null;
    }
  }
}
