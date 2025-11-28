import 'package:complete_app/core/helpers/spacing.dart';
import 'package:complete_app/core/theming/app_styles.dart';
import 'package:complete_app/core/widgets/custom_button.dart';
import 'package:complete_app/core/widgets/terms_and_conditions_text.dart';
import 'package:complete_app/features/signup/logic/signup_cubit.dart';
import 'package:complete_app/features/signup/ui/widgets/already_have_account_text.dart';
import 'package:complete_app/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:complete_app/features/signup/ui/widgets/signup_info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Account",
                        style: AppStyles.font24W700Blue,
                      ),
                      verticalSpacing(8),
                      Text(
                        "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                        style: AppStyles.font14W400Gray.copyWith(height: 1.8),
                      ),
                    ],
                  ),
                ),
                verticalSpacing(36),
                SignupInfoForm(),
                verticalSpacing(40),
                CustomButton(title: "Create Account", onPressed: (){
                  validateAndSignup(context);
                }),
                verticalSpacing(40),
                TermsAndConditionsText(),
                verticalSpacing(20),
                AlreadyHaveAccountText(),
                SignupBlocListener()

              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSignup(BuildContext context) {
    if(context.read<SignupCubit>().formKey.currentState!.validate()){
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}

