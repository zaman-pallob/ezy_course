import 'package:ezy_course/app_components/app_colors.dart';
import 'package:ezy_course/app_components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final Color? borderColor;
  final bool? isFilled;
  final Color? fillColor;
  final Color? inputTextColor;
  final double? borderRadius;
  final bool isDigit;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? sufix;
  final Function()? onPressed;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final bool? isEnabled;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? number;
  final String? lable;
  final bool? isCenterAlign;
  final int? characterLimit;
  final double? topContentPadding;
  final double? bottomContentPadding;
  final FocusNode? focusNode;
  const CustomTextFormField({
    super.key,
    this.fillColor = AppColors.white10,
    this.isFilled = true,
    required this.hintText,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.prefixIcon,
    this.sufix,
    this.suffixIcon,
    this.onPressed,
    this.onChanged,
    this.isEnabled,
    this.textInputType,
    this.number = 1,
    this.textInputAction,
    this.onEditingComplete,
    this.lable,
    this.isDigit = false,
    this.inputTextColor = AppColors.white,
    this.borderColor,
    this.isCenterAlign,
    this.characterLimit,
    this.topContentPadding,
    this.bottomContentPadding,
    this.borderRadius,
    this.focusNode,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller!,
      builder: (context, TextEditingValue value, __) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: 50.h),
          child: TextFormField(
            focusNode: widget.focusNode,
            cursorColor: AppColors.white,
            inputFormatters: widget.isDigit == true
                ? [FilteringTextInputFormatter.digitsOnly]
                : widget.characterLimit != null
                    ? [LengthLimitingTextInputFormatter(widget.characterLimit)]
                    : null,
            onEditingComplete: widget.onEditingComplete,
            maxLines: widget.number,
            minLines: widget.number,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            enabled: widget.isEnabled,
            onChanged: widget.onChanged,
            obscureText: widget.isPassword == true ? isObscured : false,
            controller: widget.controller,
            validator: widget.validator,
            textAlignVertical:
                widget.isCenterAlign == true ? TextAlignVertical.center : null,
            style: font19.copyWith(color: AppColors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              errorMaxLines: 1,
              errorStyle: font14.copyWith(color: AppColors.red),
              filled: widget.isFilled,
              fillColor: widget.fillColor,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      child: Icon(
                        isObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.white,
                      ),
                    )
                  : widget.suffixIcon,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  width: 1.w,
                  color: AppColors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10.r),
                borderSide: BorderSide(
                  width: 1.w,
                  color: AppColors.red,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10.r),
                borderSide: BorderSide(
                  width: 1.w,
                  color: widget.borderColor ??
                      AppColors.borderColor.withValues(alpha: 0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10.r),
                borderSide: BorderSide(
                  width: 1.w,
                  color: AppColors.white,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: font19.copyWith(
                  color: AppColors.white.withValues(alpha: 0.7)),
              suffix: widget.sufix,
            ),
          ),
        );
      },
    );
  }
}
