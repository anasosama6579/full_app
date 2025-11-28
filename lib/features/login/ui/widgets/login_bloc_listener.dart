import 'package:complete_app/core/helpers/extensions.dart';
import 'package:complete_app/core/routing/routes.dart';
import 'package:complete_app/core/theming/app_colors.dart';
import 'package:complete_app/core/theming/app_styles.dart';
import 'package:complete_app/features/login/logic/login_cubit.dart';
import 'package:complete_app/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Failure || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainBlue,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.popDialog();
            context.pushNamed(Routes.homeScreen);
          },
          failure: (errorMessage) {
            context.popDialog();

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
                content: Text(
                  errorMessage,
                  style: AppStyles.font14W400Black,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      "Got it",
                      style: AppStyles.font14W600Blue,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
