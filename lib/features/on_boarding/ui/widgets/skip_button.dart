import 'package:flutter/material.dart';
import 'package:fruits_market/core/di/dependency_injection.dart';
import 'package:fruits_market/core/helpers/shared_preferences_keys.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 20, top: 20),
      child: Align(
        alignment: Alignment.topRight,
        child: IntrinsicWidth(
          child: InkWell(
            onTap: () {
              getIt<SharedPreferences>().setBool(SharedPreferencesKeys.isFirstLaunch, false);
              Navigator.pushReplacementNamed(context, MyRoutes.loginScreen);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Skip", style: MyTextStyles.font15RegularGrey),
                const SizedBox(height: 5),
                Container(color: Colors.black, height: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
