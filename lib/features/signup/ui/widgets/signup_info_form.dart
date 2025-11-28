import 'package:complete_app/core/helpers/app_regex.dart';
import 'package:complete_app/core/helpers/spacing.dart';
import 'package:complete_app/core/widgets/app_text_form_field.dart';
import 'package:complete_app/core/widgets/password_validation.dart';
import 'package:complete_app/features/signup/logic/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupInfoForm extends StatefulWidget {
  const SignupInfoForm({super.key});

  @override
  State<SignupInfoForm> createState() => _SignupInfoFormState();
}

class _SignupInfoFormState extends State<SignupInfoForm> {
  bool isObscured = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordListener();
  }

  void setupPasswordListener() {
    passwordController.addListener(() {
      final password = passwordController.text;

      setState(() {
        hasLowercase = AppRegex.hasLowercase(password);
        hasUppercase = AppRegex.hasUppercase(password);
        hasNumber = AppRegex.hasNumber(password);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(password);
        hasMinLength = AppRegex.hasMinLength(password);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpacing(20),
          AppTextFormField(
            controller: context.read<SignupCubit>().phoneController,
            hintText: "Phone Number",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              if (!AppRegex.isValidPhoneNumber(value)) {
                return 'Please enter a valid phone number';
              }
            },
          ),
          verticalSpacing(20),
          AppTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hintText: "Email",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!AppRegex.isValidEmail(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpacing(20),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: "Password",
            isObscureText: isObscured,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
              child: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (AppRegex.isValidPassword(value) == false) {
                return 'Password is not strong enough';
              }
            },
          ),
          verticalSpacing(20),
          AppTextFormField(
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
            hintText: "Confirm Password",
            isObscureText: isObscured,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
              child: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (AppRegex.isValidPassword(value) == false) {
                return 'Password is not strong enough';
              }
            },
          ),
          verticalSpacing(20),
          PasswordValidation(
              hasLowercase: hasLowercase,
              hasUppercase: hasUppercase,
              hasNumber: hasNumber,
              hasSpecialCharacter: hasSpecialCharacter,
              hasMinLength: hasMinLength),
        ],
      ),
    );
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
