import 'package:complete_app/core/theming/app_colors.dart';
import 'package:complete_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.backgroundColor,
      this.textStyle,
      this.height,
      this.width,
      this.radius});

  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width?.w ?? double.infinity, height?.h ?? 52.h),
        backgroundColor: backgroundColor ?? AppColors.mainBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius?.r ?? 16.r),
        ),
      ),
      child: Text(
        title,
        style: textStyle ?? AppStyles.font16W600White,
      ),
    );
  }
}
