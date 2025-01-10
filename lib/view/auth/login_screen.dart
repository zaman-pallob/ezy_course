import 'package:ezy_course/app_components/app_colors.dart';
import 'package:ezy_course/app_components/app_images.dart';
import 'package:ezy_course/app_components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static const route = "/login_screen";
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
      bottomSheet: Container(
        height: 533.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        decoration: BoxDecoration(
            color: AppColors.primaryLight,
            border: Border(
                top: BorderSide(
              color: AppColors.shadow1,
              width: 4.h,
            )),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Text(
                "Sign In",
                style: font38.copyWith(
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
