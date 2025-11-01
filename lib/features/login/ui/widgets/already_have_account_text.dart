import 'package:complete_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          children: [
            TextSpan(
              text: "Already have an account? ",
              style:AppStyles.font12W400Black,
            ),
            TextSpan(
              text: "Sign Up",
              style:AppStyles.font12W600Blue,
            ),
          ]
      ),);
  }
}
