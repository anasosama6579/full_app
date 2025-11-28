import 'package:complete_app/core/theming/app_colors.dart';
import 'package:complete_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.enabledBorder,
      this.focusedBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.isObscureText,
      this.suffixIcon, this.backgroundColor, this.controller,required this.validator});

  final EdgeInsets? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundGray,
        isDense: true,
        contentPadding:contentPadding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        enabledBorder: enabledBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          gapPadding: 10.w,
          borderSide: const BorderSide(color: AppColors.lighterGray),
        ),
        focusedBorder: focusedBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          gapPadding: 10.w,
          borderSide: const BorderSide(color: AppColors.mainBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          gapPadding: 10.w,
          borderSide: const BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          gapPadding: 10.w,
          borderSide: const BorderSide(color: AppColors.red),
        ),
        hintStyle:hintStyle ?? AppStyles.font14W500InnerGray,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      cursorColor: AppColors.black,
      style: inputTextStyle ?? AppStyles.font14W500Black,
      validator: (value) => validator != null ? validator!(value) : null,
    );
  }
}
