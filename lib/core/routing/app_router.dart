import 'package:flutter/material.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/features/splash/ui/splash_screen.dart';

abstract class AppRouter {
 static Route?  getRoutes(RouteSettings settings) {
     switch (settings.name) {
      case MyRoutes.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      default:
        return null;
    }
  }
}
