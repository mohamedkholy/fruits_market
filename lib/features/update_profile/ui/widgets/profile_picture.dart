import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/assets_helper.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/widgets/my_circular_avatar.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        children: [
          const MyCircularAvatar(
            imageUrl: Assets.imagesPngProfileAvatar,
            radius: 70,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade100,
              child: const Icon(Icons.edit, color: MyColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
