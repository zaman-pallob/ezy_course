import 'package:ezy_course/app_components/app_colors.dart';
import 'package:ezy_course/app_components/app_images.dart';
import 'package:ezy_course/app_components/text_style.dart';
import 'package:ezy_course/common/custom_button.dart';
import 'package:ezy_course/common/custom_text_form_field.dart';
import 'package:ezy_course/utils/validators.dart';
import 'package:ezy_course/view/auth/components/remember_checkbox.dart';

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
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isChecked = false;
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      "Sign In",
                      style: font38.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Text("Email",
                      style: font17.copyWith(
                        color: AppColors.grey1.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(height: 5.h),
                  CustomTextFormField(
                    hintText: "Email",
                    controller: emailController,
                    validator: (p0) => Validators.checkEmailValidity(p0),
                  ),
                  SizedBox(height: 20.h),
                  Text("Password",
                      style: font17.copyWith(
                        color: AppColors.grey1.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(height: 5.h),
                  CustomTextFormField(
                    hintText: "Password",
                    isPassword: true,
                    controller: passwordController,
                    validator: (p0) => Validators.checkPasswordValidity(p0),
                  ),
                  SizedBox(height: 25.h),
                  RememberCheckbox(
                    onChecked: (v) {
                      isChecked = v;
                    },
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                    loading: false,
                    height: 60.h,
                    buttonColor: AppColors.yellow,
                    textColor: AppColors.primaryDark,
                    onPressed: () {},
                    buttonText: "Login",
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
