import 'package:complete_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              children: [
                TextSpan(
                  text: "By logging, you agree to our ",
                  style: AppStyles.font12W400Gray
                ),
                TextSpan(
                  text: "Terms & Conditions ",
                  style: AppStyles.font12W400Black,
                ),
                TextSpan(
                    text: "and ",
                    style: AppStyles.font12W400Gray
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: AppStyles.font12W400Black,
                ),
              ]
          )),
    );
  }
}
