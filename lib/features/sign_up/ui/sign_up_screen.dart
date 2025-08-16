import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/core/widgets/my_phone_number_form_field.dart';
import 'package:fruits_market/core/widgets/my_text_form_field.dart';
import 'package:fruits_market/features/sign_up/ui/widgets/sign_in_textspan.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _mobileFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
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
                        "Sign Up to Wikala",
                        style: MyTextStyles.font28BoldBlack,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      MyTextFormField(
                        controller: _fullNameController,
                        title: "Full Name",
                        hintText: "First and Last Name",
                        onFieldSubmitted: (p0) =>
                            _mobileFocusNode.requestFocus(),
                      ),
                      const SizedBox(height: 24),
                      MyPhoneNumberFormField(
                        controller: _phoneNumberController,
                        title: "Phone Number with Whatsapp",
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
                      const SizedBox(height: 60),
                      MyButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        text: "Sign Up",
                      ),
                      const SizedBox(height: 40),
                      const SignInTextspan(),
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
