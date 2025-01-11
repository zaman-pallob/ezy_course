import 'package:ezy_course/app_components/app_colors.dart';
import 'package:ezy_course/app_components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberCheckbox extends StatefulWidget {
  final Function(bool) onChecked;
  const RememberCheckbox({super.key, required this.onChecked});

  @override
  State<RememberCheckbox> createState() => _RememberCheckboxState();
}

class _RememberCheckboxState extends State<RememberCheckbox> {
  bool isRemembered = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16.w,
          height: 16.h,
          child: Checkbox(
            side: BorderSide(color: AppColors.white, width: 1.w),
            value: isRemembered,
            onChanged: (value) {
              setState(() {
                isRemembered = !isRemembered;
                widget.onChecked(isRemembered);
              });
            },
            checkColor: AppColors.primaryDark,
            activeColor: AppColors.yellow,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          "Remember me",
          style: font18.copyWith(
            color: AppColors.white,
          ),
        )
      ],
    );
  }
}
