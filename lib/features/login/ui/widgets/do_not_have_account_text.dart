import 'package:complete_app/core/helpers/extensions.dart';
import 'package:complete_app/core/routing/routes.dart';
import 'package:complete_app/core/theming/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccountText extends StatelessWidget {
  const DoNotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account  ",
              style:AppStyles.font12W400Black,
            ),
            TextSpan(
              text: "Sign Up",
              style:AppStyles.font12W600Blue,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                context.pushReplacementNamed(Routes.signupScreen);
                },
            ),
          ]
      ),);
  }
}
