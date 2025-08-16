import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/assets_helper.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/full_screen_dialog.dart';
import 'package:fruits_market/features/login/ui/widgets/facebook_button.dart';
import 'package:fruits_market/features/login/ui/widgets/policy_text_span.dart';
import 'package:fruits_market/features/login/ui/widgets/sign_in_button.dart';
import 'package:fruits_market/features/login/ui/widgets/sign_up_textspan.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.canPopOf(context) ?? false;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 32,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          if (canPop) {
                            Navigator.pop(context);
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              MyRoutes.navigationScreen,
                            );
                          }
                        },
                        child: Icon(
                          canPop ? Icons.arrow_back_ios : Icons.clear,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "F",
                        style: MyTextStyles.font47BoldPrimary,
                        children: [
                          TextSpan(
                            text: "ruit Market",
                            style: MyTextStyles.font42BoldPrimary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Welcome to Our app",
                      style: MyTextStyles.font28BoldBlack,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 52),
                    SignInButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          MyRoutes.phoneSignInScreen,
                        );
                      },
                      icon: Assets.imagesSvgPhone,
                      label: "Sign in with Phone Number",
                    ),
                    const SizedBox(height: 20),
                    SignInButton(
                      onPressed: () {
                        FullScreenLoader.show(context);
                      },
                      icon: Assets.imagesSvgGoogle,
                      label: "Sign in with Google",
                    ),
                    const SizedBox(height: 20),
                    FacebookButton(onPressed: () {}),
                    const SizedBox(height: 80),
                    const SignUpTextspan(),
                    const SizedBox(height: 60),
                    const PolicyTextSpan(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
