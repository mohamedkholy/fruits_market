import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/core/widgets/my_phone_number_form_field.dart';
import 'package:fruits_market/core/widgets/my_text_form_field.dart';
import 'package:fruits_market/features/login/ui/widgets/sign_up_textspan.dart';

class PhoneSignInScreen extends StatefulWidget {
  const PhoneSignInScreen({super.key});

  @override
  State<PhoneSignInScreen> createState() => _PhoneSignInScreenState();
}

class _PhoneSignInScreenState extends State<PhoneSignInScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _mobileFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _mobileFocusNode.dispose();
    _passwordFocusNode.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios, size: 24),
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
                        "Sign in to Wikala",
                        style: MyTextStyles.font28BoldBlack,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      MyPhoneNumberFormField(
                        controller: _phoneNumberController,
                        title: "Phone Number",
                        hintText: "Mobile Number",
                        focusNode: _mobileFocusNode,
                        onFieldSubmitted: (p0) =>
                            _passwordFocusNode.requestFocus(),
                      ),
                      const SizedBox(height: 24),
                      MyTextFormField(
                        controller: _passwordController,
                        title: "Password",
                        hintText: "Enter your password",
                        isPassword: true,
                        focusNode: _passwordFocusNode,
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: RichText(
                          text: TextSpan(
                            text: "Forgot password?",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                  context,
                                  MyRoutes.enterPhoneScreen,
                                );
                              },
                            style: MyTextStyles.font18RegularBlueUnderline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      MyButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        text: "Sign in",
                      ),
                      const SizedBox(height: 40),
                      const SignUpTextspan(),
                      const SizedBox(height: 60),
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
