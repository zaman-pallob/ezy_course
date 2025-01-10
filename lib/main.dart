import 'package:ezy_course/custom_router.dart';
import 'package:ezy_course/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_components/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.transparent,
              systemNavigationBarDividerColor: AppColors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light),
        ),
      ),
      initialRoute: LoginScreen.route,
      onGenerateRoute: CustomRouter.onGenerateRoute,
    );
  }
}
