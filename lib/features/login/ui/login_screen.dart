import 'package:complete_app/core/theming/app_styles.dart';
import 'package:complete_app/core/widgets/app_text_form_field.dart';
import 'package:complete_app/core/widgets/custom_button.dart';
import 'package:complete_app/features/login/ui/widgets/already_have_account_text.dart';
import 'package:complete_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:complete_app/core/helpers/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back",
                            style: AppStyles.font24W700Blue,
                          ),
                          verticalSpacing(8),
                          Text(
                            "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                            style: AppStyles.font14W400Gray.copyWith(height: 1.8),
                          ),
                        ],
                      ),
                    ),
                    verticalSpacing(36),
                    Form(
                      key: loginFormKey,
                      child: Column(
                        children: [
                          AppTextFormField(hintText: "Email"),
                          verticalSpacing(16),
                          AppTextFormField(
                            hintText: "Password",
                            obscureText: isObscure,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              child: Icon(isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                          verticalSpacing(25),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              "Forgot Password?",
                              style: AppStyles.font14W400Blue,
                            ),
                          ),
                          verticalSpacing(40),
                          CustomButton(title: "Login", onPressed: (){}, ),
                          verticalSpacing(20),
                          TermsAndConditionsText(),
                          verticalSpacing(40),
                          AlreadyHaveAccountText(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
