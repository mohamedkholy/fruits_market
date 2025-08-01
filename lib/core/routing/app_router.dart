import 'package:flutter/material.dart';
import 'package:fruits_market/core/di/dependency_injection.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/features/enter_phone/ui/enter_phone_screen.dart';
import 'package:fruits_market/features/home/ui/home_screen.dart';
import 'package:fruits_market/features/login/ui/login_screen.dart';
import 'package:fruits_market/features/navigation/ui/navigation_screen.dart';
import 'package:fruits_market/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:fruits_market/features/otp/ui/otp_screen.dart';
import 'package:fruits_market/features/phone_sign_in/ui/phone_sign_in_screen.dart';
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
          settings,
        );
      case MyRoutes.onBoardingScreen:
        return _createRoute(const OnBoardingScreen(), settings);
      case MyRoutes.loginScreen:
        return _createRoute(const LoginScreen(), settings);

      case MyRoutes.signupScreen:
        return _createRoute(const SignUpScreen(), settings);
      case MyRoutes.phoneSignInScreen:
        return _createRoute(const PhoneSignInScreen(), settings);
      case MyRoutes.enterPhoneScreen:
        return _createRoute(const EnterPhoneScreen(), settings);
      case MyRoutes.otpScreen:
        return _createRoute(const OtpScreen(), settings);
        case MyRoutes.navigationScreen:
        return _createRoute(const NavigationScreen(), settings);
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

  static Route<dynamic> _createRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: _slideFromRight,
      transitionDuration: const Duration(milliseconds: 1000),
    );
  }
}
