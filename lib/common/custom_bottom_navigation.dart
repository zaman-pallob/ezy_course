import 'package:ezy_course/app_components/app_colors.dart';
import 'package:ezy_course/app_components/app_icons.dart';
import 'package:ezy_course/app_components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigation extends StatefulWidget {
  final Function(int) onTap;
  const CustomBottomNavigation({super.key, required this.onTap});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
            color: AppColors.black.withValues(alpha: 0.4),
            offset: const Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 2)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconWidget(AppIcons.community, "Community", 0),
          iconWidget(AppIcons.logout, "Logout", 1),
        ],
      ),
    );
  }

  Widget iconWidget(String icon, String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
          widget.onTap(index);
        });
      },
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              currentIndex == index ? AppColors.primaryLight : AppColors.black,
              BlendMode.srcIn,
            ),
          ),
          Text(
            title,
            style: font12.copyWith(
              fontWeight: FontWeight.w700,
              color: currentIndex == index
                  ? AppColors.primaryLight
                  : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
