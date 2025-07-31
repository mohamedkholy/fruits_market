import 'package:flutter/material.dart';
import 'package:fruits_market/core/di/dependency_injection.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/features/login/ui/login_screen.dart';
import 'package:fruits_market/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:fruits_market/features/sign_up/ui/sign_up_screen.dart';
import 'package:fruits_market/features/splash/logic/splash_cubit.dart';
import 'package:fruits_market/features/splash/ui/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Route? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.splashScreen:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<SplashCubit>(),
            child: const SplashScreen(),
          ),
        );
      case MyRoutes.onBoardingScreen:
        return _createRoute(const OnBoardingScreen());
      case MyRoutes.loginScreen:
        return _createRoute(const LoginScreen());

      case MyRoutes.signupScreen:
        return _createRoute(const SignUpScreen());
      default:
        return null;
    }
  }

  static Widget _slideFromRight(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

    final offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(curved);

    return SlideTransition(position: offsetAnimation, child: child);
  }

  static Route<dynamic> _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: _slideFromRight,
      transitionDuration: const Duration(milliseconds: 1000),
    );
  }
}
