import 'package:complete_app/core/theming/app_styles.dart';
import 'package:complete_app/core/widgets/custom_button.dart';
import 'package:complete_app/features/login/logic/login_cubit.dart';
import 'package:complete_app/features/login/ui/widgets/do_not_have_account_text.dart';
import 'package:complete_app/features/login/ui/widgets/email_and_password.dart';
import 'package:complete_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:complete_app/core/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:complete_app/core/helpers/spacing.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                        style:
                            AppStyles.font14W400Gray.copyWith(height: 1.8),
                      ),
                    ],
                  ),
                ),
                verticalSpacing(36),
                Column(
                  children: [
                    EmailAndPassword(),
                    verticalSpacing(25),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: AppStyles.font14W400Blue,
                      ),
                    ),
                    verticalSpacing(40),
                    CustomButton(
                      title: "Login",
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpacing(20),
                    TermsAndConditionsText(),
                    verticalSpacing(40),
                    DoNotHaveAccountText(),
                    const LoginBlocListener()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().loginFormKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
