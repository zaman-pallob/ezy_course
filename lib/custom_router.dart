// ignore_for_file: unused_local_variable

import 'package:ezy_course/repository/auth_repo.dart';
import 'package:ezy_course/view/auth/login_screen.dart';
import 'package:ezy_course/viewmodel/auth/login_viewmodel.dart';
import 'package:ezy_course/view/home/home.dart';
import 'package:ezy_course/viewmodel/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var arg = settings.arguments == null ? {} : settings.arguments as Map;
    switch (settings.name) {
      case LoginScreen.route:
        return routeBuilder(
            ChangeNotifierProvider(
              create: (context) => LoginViewmodel(AuthRepo()),
              child: const LoginScreen(),
            ),
            time: 0);
      case Home.route:
        return routeBuilder(
            ChangeNotifierProvider(
              create: (context) => HomeViewmodel(),
              child: const Home(),
            ),
            time: 0);
      default:
        return null;
    }
  }

  static PageRouteBuilder routeBuilder(Widget screen,
      {double? dx, double? dy, int? time}) {
    return PageRouteBuilder(
        opaque: true,
        transitionDuration: Duration(milliseconds: time ?? 100),
        pageBuilder: (BuildContext context, _, __) {
          return screen;
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(dx ?? 1, dy ?? 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        });
  }
}
