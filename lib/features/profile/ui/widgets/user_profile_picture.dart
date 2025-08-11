import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/assets_helper.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/core/widgets/my_circular_avatar.dart';

class UserProfilePicture extends StatefulWidget {
  const UserProfilePicture({super.key});

  @override
  State<UserProfilePicture> createState() => _UserProfilePictureState();
}

class _UserProfilePictureState extends State<UserProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyCircularAvatar(
          imageUrl: Assets.imagesPngProfileAvatar,
          radius: 50,
        ),
        const SizedBox(height: 16),
        Text(
          "Welcome, Fruit Market",
          style: MyTextStyles.font24BoldPrimary.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        FractionallySizedBox(
          widthFactor: 0.8,
          child: MyButton(onPressed: () {}, text: "Login"),
        ),
      ],
    );
  }
}
