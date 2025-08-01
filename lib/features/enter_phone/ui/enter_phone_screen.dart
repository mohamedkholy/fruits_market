import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/core/widgets/my_phone_number_form_field.dart';

class EnterPhoneScreen extends StatefulWidget {
  const EnterPhoneScreen({super.key});

  @override
  State<EnterPhoneScreen> createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneNumberController.dispose();
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
                        "Enter your number",
                        style: MyTextStyles.font28BoldBlack,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 28),
                      MyPhoneNumberFormField(
                        controller: _phoneNumberController,
                        title: "Phone Number",
                        hintText: "Mobile Number",
                      ),

                      const SizedBox(height: 60),
                      MyButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        text: "Submit",
                      ),
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
