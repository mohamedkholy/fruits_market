import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fruits_market/core/di/dependency_injection.dart';
import 'package:fruits_market/core/notifications/notifications_manager.dart';
import 'package:fruits_market/core/routing/app_router.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await dotenv.load();
  await initFirebase();
  await NotificationsManager().initNotifications();
  runApp(const MyApp());
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: kIsWeb ? DefaultFirebaseOptions.currentPlatform : null,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: MediaQuery.of(
              context,
            ).textScaler.clamp(minScaleFactor: 1, maxScaleFactor: 1),
          ),
          child: child!,
        );
      },
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
        ),
        dividerColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          scrolledUnderElevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "poppins",
        primaryColor: MyColors.primaryColor,
        primaryColorLight: MyColors.primaryColor.withAlpha(100),
        primaryColorDark: MyColors.primaryColor.withAlpha(200),
        radioTheme: const RadioThemeData(
          fillColor: WidgetStatePropertyAll(MyColors.primaryColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.getRoutes,
    );
  }
}
