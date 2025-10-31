import 'package:complete_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.color});

  final String title;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize:  Size(double.infinity, 52.h),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Text(
        title,
        style: AppStyles.font16W600White,
      ),
    );
  }
}
