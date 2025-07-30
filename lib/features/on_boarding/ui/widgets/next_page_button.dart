import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class NextPageButton extends StatelessWidget {
  final void Function()? onPressed;
  final int selectedPageIndex;

  const NextPageButton({
    super.key,
    this.onPressed,
    required this.selectedPageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(177, 50)),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStatePropertyAll(MyColors.primaryColor),
        textStyle: WidgetStatePropertyAll(MyTextStyles.font16MediumWhite),
      ),
      onPressed: onPressed,
      child: Text(selectedPageIndex == 2 ? "Get Started" : "Next"),
    );
  }
}
