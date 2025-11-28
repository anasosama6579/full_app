import 'package:complete_app/core/helpers/extensions.dart';
import 'package:complete_app/core/routing/routes.dart';
import 'package:complete_app/core/theming/app_styles.dart';
import 'package:flutter/gestures.dart';
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
              text: "Already have an account  ",
              style:AppStyles.font12W400Black,
            ),
            TextSpan(
              text: "Login",
              style:AppStyles.font12W600Blue,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementNamed(Routes.loginScreen);
                },
            ),
          ]
      ),);
  }
}
