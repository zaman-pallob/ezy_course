import 'package:ezy_course/app_database/app_database.dart';
import 'package:ezy_course/custom_router.dart';
import 'package:ezy_course/network/client.dart';
import 'package:ezy_course/utils/local_storage.dart';
import 'package:ezy_course/view/auth/login_screen.dart';
import 'package:ezy_course/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_components/app_colors.dart';

late AppDatabase db;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initialize();
  await Client.initializeDio();
  db = AppDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(440, 956),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              bottomSheetTheme: const BottomSheetThemeData(
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
              ),
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: AppColors.transparent,
                    systemNavigationBarDividerColor: AppColors.transparent,
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.light),
              ),
            ),
            initialRoute: LocalStorage.getAccessToken() == ""
                ? LoginScreen.route
                : Home.route,
            onGenerateRoute: CustomRouter.onGenerateRoute,
          );
        });
  }
}
