import 'package:flutter/material.dart';
import 'package:my_school/src/core/presentation/app_colors.dart';
import 'package:my_school/src/core/presentation/fonts_manager.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // TODO: Implement forgot password functionality
      },
      child: Text(
        'هل نسيت كلمة المرور؟',
        style: IBMRegular(color: AppColors.primaryBlue),
      ),
    );
  }
}
