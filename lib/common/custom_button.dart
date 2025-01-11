import 'package:ezy_course/app_components/app_colors.dart';
import 'package:ezy_course/app_components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Function()? onPressed;
  final Color buttonColor;
  final Color textColor;
  final bool? loading;
  final Widget? icon;
  final Color? borderColor;
  final double? width, height;
  final EdgeInsetsGeometry? pading;
  const CustomButton(
      {super.key,
      this.buttonText,
      this.onPressed,
      required this.buttonColor,
      required this.textColor,
      this.loading,
      this.icon,
      this.borderColor,
      this.width,
      this.pading,
      this.height});

  @override
  Widget build(BuildContext context) {
    return loading != true
        ? MaterialButton(
            padding: pading ?? EdgeInsets.zero,
            elevation: 0,
            height: height ?? 50.h,
            minWidth: width ?? MediaQuery.of(context).size.width,
            onPressed: onPressed,
            color: buttonColor,
            disabledColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: borderColor != null
                  ? BorderSide(
                      color: borderColor!,
                      width: 2.w,
                    )
                  : BorderSide.none,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: icon,
                      )
                    : Container(),
                buttonText == null && buttonText!.isEmpty
                    ? Container()
                    : Text(buttonText ?? "",
                        style: font18.copyWith(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.w600,
                        )),
              ],
            ),
          )
        : MaterialButton(
            elevation: 0,
            height: height ?? 50.h,
            minWidth: width ?? MediaQuery.of(context).size.width,
            onPressed: () {},
            color: borderColor != null ? buttonColor : AppColors.borderColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: borderColor != null ? const BorderSide() : BorderSide.none,
            ),
            child: Center(
              child: SizedBox(
                height: 25.h,
                width: 25.w,
                child: CircularProgressIndicator(color: textColor),
              ),
            ),
          );
  }
}
