import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/features/otp/ui/widgets/not_received_layout.dart';
import 'package:fruits_market/features/otp/ui/widgets/otp_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
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
                      "Enter Received OTP",
                      style: MyTextStyles.font28BoldBlack,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    MediaQuery.sizeOf(context).width < 360
                        ? FittedBox(
                            child: OtpField(otpController: _otpController),
                          )
                        : OtpField(otpController: _otpController),
                    const SizedBox(height: 60),
                    MyButton(
                      onPressed: () {
                        if (_otpController.text.length == 4) {}
                      },
                      text: "Confirm",
                    ),
                    const SizedBox(height: 40),
                    const NotReceivedLayout(),
                    const SizedBox(height: 60),
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
