import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final String label;
  const SignInButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 15),
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Colors.grey[200]!, width: 2),
        ),
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(icon, height: 20),
      label: Text(label, style: MyTextStyles.font14RegularBlack),
    );
  }
}
