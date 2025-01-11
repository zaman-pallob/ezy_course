import 'package:ezy_course/common/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
  static const route = "/home";
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        bottomNavigationBar: CustomBottomNavigation(
          onTap: (int index) {},
        ));
  }
}
