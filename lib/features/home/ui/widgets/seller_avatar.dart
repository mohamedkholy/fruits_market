import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_market/assets/assets.dart';

class SellerAvatar extends StatelessWidget {
  final String imageUrl;
  const SellerAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ClipOval(child: SvgPicture.asset(Assets.imagesSvgCompanyLogo)),
      ),
    );
  }
}
