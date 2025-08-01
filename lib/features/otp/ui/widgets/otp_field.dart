import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class OtpField extends StatefulWidget {
  final TextEditingController otpController;
  const OtpField({super.key, required this.otpController});

  @override
  State<OtpField> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: OtpTextField(
          autoFocus: true,
          cursorColor: MyColors.primaryColor,
          showFieldAsBox: true,
          enabledBorderColor: Colors.grey.shade300,
          focusedBorderColor: MyColors.primaryColor,
          textStyle: MyTextStyles.font14RegularBlack,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          fieldWidth: 50,
          fieldHeight: 50,
          borderRadius: BorderRadius.circular(25),
          onCodeChanged: (value) {
            widget.otpController.value = TextEditingValue(text: value);
          },
        ),
      ),
    );
  }
}
