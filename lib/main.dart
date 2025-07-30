import 'package:flutter/material.dart';
import 'package:fruits_market/core/di/dependency_injection.dart';
import 'package:fruits_market/core/routing/app_router.dart';
import 'package:fruits_market/core/theming/my_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "poppins",
        primaryColor: MyColors.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.getRoutes,
    );
  }
}
