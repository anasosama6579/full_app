import 'package:complete_app/core/helpers/spacing.dart';
import 'package:complete_app/core/theming/app_colors.dart';
import 'package:complete_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation(
      {super.key,
        required this.hasLowercase,
        required this.hasUppercase,
        required this.hasNumber,
        required this.hasSpecialCharacter,
        required this.hasMinLength});

  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildValidationRow("At least 1 lowercase letter", hasLowercase),
        verticalSpacing(2),
        _buildValidationRow("At least 1 uppercase letter", hasUppercase),
        verticalSpacing(2),
        _buildValidationRow("At least 1 number", hasNumber),
        verticalSpacing(2),
        _buildValidationRow("At least 1 special character", hasSpecialCharacter),
        verticalSpacing(2),
        _buildValidationRow("At least 8 characters long", hasMinLength),
      ],
    );
  }

  Widget _buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.grey,
        ),
        horizontalSpacing(6),
        Text(
          text,
          style: AppStyles.font14W500Black.copyWith(
            fontSize: 13,
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.grey : AppColors.black,
          ),
        ),
      ],
    );
  }
}
