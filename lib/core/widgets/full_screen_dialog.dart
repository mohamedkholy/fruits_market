import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/assets_helper.dart';
import 'package:lottie/lottie.dart';

class FullScreenLoader {
  static void show(BuildContext context, {String message = "Loading..."}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (_) => PopScope(
        canPop: false,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.black.withValues(alpha: 0.7)),
            ),
            Center(
              child: Lottie.asset(
                Assets.imagesLottieLoadingCircle,
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
