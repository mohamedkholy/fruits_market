import 'package:flutter/material.dart';
import 'package:fruits_market/core/di/dependency_injection.dart';
import 'package:fruits_market/core/models/order.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/features/checkout/ui/checkout_screen.dart';
import 'package:fruits_market/features/checkout/ui/widgets/order_placement_status_layout.dart';
import 'package:fruits_market/features/contact_us/ui/contact_us_screen.dart';
import 'package:fruits_market/features/enter_phone/ui/enter_phone_screen.dart';
import 'package:fruits_market/features/login/ui/login_screen.dart';
import 'package:fruits_market/features/navigation/logic/navigation_cubit.dart';
import 'package:fruits_market/features/navigation/ui/navigation_screen.dart';
import 'package:fruits_market/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:fruits_market/features/order_tracking/ui/order_tracking_screen.dart';
import 'package:fruits_market/features/otp/ui/otp_screen.dart';
import 'package:fruits_market/features/phone_sign_in/ui/phone_sign_in_screen.dart';
import 'package:fruits_market/features/product_details/ui/product_details_screen.dart';
import 'package:fruits_market/features/profile/ui/widgets/terms_conditions_layout.dart';
import 'package:fruits_market/features/seller/ui/seller_screen.dart';
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
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<NavigationCubit>(),
            child: const NavigationScreen(),
          ),
          settings,
        );
      case MyRoutes.sellerScreen:
        return _createRoute(
          SellerScreen(seller: settings.arguments as Seller),
          settings,
        );
      case MyRoutes.productDetailsScreen:
        return _createRoute(
          ProductDetailsScreen(product: settings.arguments as Product),
          settings,
        );
      case MyRoutes.checkoutScreen:
        return _createRoute(const CheckoutScreen(), settings);
      case MyRoutes.orderPlacementScreen:
        return _createRoute(const OrderPlacementStatusLayout(), settings);
      case MyRoutes.orderTrackingScreen:
        return _createRoute(OrderTrackingScreen(order: settings.arguments as Order), settings);
      case MyRoutes.termsConditionsScreen:
        return _createRoute(const TermsConditionsLayout(), settings);
      case MyRoutes.contactUsScreen:
        return _createRoute(const ContactUsScreen(), settings);
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
