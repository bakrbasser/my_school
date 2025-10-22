import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_school/src/core/presentation/app_colors.dart';
import 'package:my_school/src/core/presentation/fonts_manager.dart';
import 'package:my_school/src/core/presentation/sizes.dart';
import 'package:my_school/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: AppColors.primaryBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusV.v12),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context.read<AuthCubit>().signIn(
            email: emailController.text,
            password: passwordController.text,
          );
        }
      },
      child: Text('تسجيل الدخول', style: IBMBold(color: Colors.white)),
    );
  }
}
