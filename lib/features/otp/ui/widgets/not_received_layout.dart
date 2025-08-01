import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class NotReceivedLayout extends StatefulWidget {
  const NotReceivedLayout({super.key});

  @override
  State<NotReceivedLayout> createState() => _NotReceivedLayoutState();
}

class _NotReceivedLayoutState extends State<NotReceivedLayout> {
  int _seconds = 30;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _seconds == 0
        ? RichText(
            text: TextSpan(
              text: "Not received? ",
              style: MyTextStyles.font18RegularGrey,
              children: [
                TextSpan(
                  text: "Send Again",
                  style: MyTextStyles.font18RegularBlueUnderline,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        _seconds = 30;
                        startTimer();
                      });
                    },
                ),
              ],
            ),
          )
        : RichText(
            text: TextSpan(
              text: "Resend code in",
              style: MyTextStyles.font18RegularGrey,
              children: [
                TextSpan(
                  text: " $_seconds",
                  style: MyTextStyles.font20RegularBlue,
                ),
                const TextSpan(
                  text: " seconds",
                  style: MyTextStyles.font18RegularGrey,
                ),
              ],
            ),
          );
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
        startTimer();
      }
    });
  }
}
