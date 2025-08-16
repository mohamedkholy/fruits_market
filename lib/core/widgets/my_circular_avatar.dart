import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_market/core/helpers/assets_helper.dart';

class MyCircularAvatar extends StatelessWidget {
  final String imageUrl;
  final double? radius;
  final double? size;
  const MyCircularAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 40,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? radius! * 2,
      height: size ?? radius! * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ClipOval(
        child: imageUrl == ""
            ? SvgPicture.asset(Assets.imagesSvgCompanyLogo)
            : Image.asset(imageUrl),
      ),
    );
  }
}
