import 'package:complete_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle font24W700Black = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font32W700Blue = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: Colors.blue,
  );

  static TextStyle font12W400Gray = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );

  static TextStyle font16W600White = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

}
