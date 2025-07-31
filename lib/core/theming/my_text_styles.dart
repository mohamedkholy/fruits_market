import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/font_weight_helper.dart';
import 'package:fruits_market/core/theming/my_colors.dart';

abstract class MyTextStyles {
  static const TextStyle font15RegularGrey = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.regular,
    color: MyColors.grey,
  );

  static const TextStyle font14RegularGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: MyColors.grey,
  );

  static const TextStyle font14RegularlightGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: MyColors.lightGrey,
  );
  static const TextStyle font16MediumWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static const TextStyle font22BoldBlack = TextStyle(
    fontSize: 22,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static const TextStyle font28BoldBlack = TextStyle(
    fontSize: 28,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static const TextStyle font14RegularBlack = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );

  static const TextStyle font18RegularBlack = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );

  static const TextStyle font18RegularBlueUnderline = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
    color: MyColors.blue,
    decoration: TextDecoration.underline,
  );

  static const TextStyle font14RegularWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static const TextStyle font17RegularGrey = TextStyle(
    fontSize: 17,
    fontWeight: FontWeightHelper.regular,
    color: MyColors.grey,
  );

  static const TextStyle font42BoldPrimary = TextStyle(
    fontSize: 42,
    fontWeight: FontWeightHelper.bold,
    color: MyColors.primaryColor,
  );

  static const TextStyle font47BoldPrimary = TextStyle(
    fontSize: 47,
    fontWeight: FontWeightHelper.bold,
    color: MyColors.primaryColor,
  );
  
}
