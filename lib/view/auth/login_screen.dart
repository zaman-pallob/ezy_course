import 'package:ezy_course/app_components/app_colors.dart';
import 'package:ezy_course/app_components/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const route = "/login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: AppColors.transparent, elevation: 0),
      body: SizedBox(
        width: double.infinity,
        child: SvgPicture.asset(
          AppImages.loginBackground,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
