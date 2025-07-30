import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/font_weight_helper.dart';
import 'package:fruits_market/core/theming/my_colors.dart';

abstract class MyTextStyles {
  static const TextStyle font15RegularGrey = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.regular,
    color: MyColors.grey,
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
  static const TextStyle font17RegularGrey = TextStyle(
    fontSize: 17,
    fontWeight: FontWeightHelper.regular,
    color: MyColors.grey,
  );
}
