import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class MyButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final double width;
  const MyButton({super.key,required this.onPressed, required this.text, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:  ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(width, 50)),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        backgroundColor: const WidgetStatePropertyAll(MyColors.primaryColor),
        textStyle: const WidgetStatePropertyAll(MyTextStyles.font16MediumWhite),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}