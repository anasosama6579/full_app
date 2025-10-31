import 'package:complete_app/core/helpers/extensions.dart';
import 'package:complete_app/core/routing/routes.dart';
import 'package:complete_app/core/theming/app_colors.dart';
import 'package:complete_app/core/theming/app_styles.dart';
import 'package:complete_app/core/widgets/custom_button.dart';
import 'package:complete_app/features/onboarding/ui/widgets/doc_image_and_text.dart';
import 'package:complete_app/features/onboarding/ui/widgets/doc_logo_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 66.0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DocLogoAndName(),
              SizedBox(height: 50.h),
              const DocImageAndText(),
              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: Column(
                  children: [
                    Text(
                      "Manage and schedule all of your medical appointments easily with Doc App to get a new experience.",
                      style: AppStyles.font12W400Gray,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.h),
                    CustomButton(
                      title: "Get Started",
                      onPressed: () => context.pushNamed(Routes.login),
                      color: AppColors.mainBlue,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
