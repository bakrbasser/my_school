import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_school/src/core/presentation/app_colors.dart';
import 'package:my_school/src/core/presentation/dialogs.dart';
import 'package:my_school/src/core/presentation/fonts_manager.dart';
import 'package:my_school/src/core/presentation/sizes.dart';
import 'package:my_school/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:my_school/src/features/auth/presentation/widgets/auth_fields.dart';
import 'package:my_school/src/features/auth/presentation/widgets/forgot_password.dart';
import 'package:my_school/src/features/auth/presentation/widgets/login_button.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AuthListener(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.s8),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: AppColors.primaryBlue,
                        size: Sizes.s60,
                      ),
                      SizedBox(height: Spacing.medium),
                      Text(
                        'اهلا بكم من جديد',
                        style: IBMBold(fontSize: Sizes.s28),
                      ),
                      SizedBox(height: Spacing.tiny),
                      Text(
                        'سجل دخولك للمتابعة',
                        style: IBMMedium(fontSize: Sizes.s16),
                      ),
                      SizedBox(height: Spacing.large),
                      EmailField(controller: emailController),

                      SizedBox(height: Spacing.medium),
                      PasswordField(controller: passwordController),

                      SizedBox(height: Spacing.medium),
                      ForgotPasswordButton(),
                      SizedBox(height: Spacing.medium),
                      LoginButton(
                        emailController: emailController,
                        passwordController: passwordController,
                        formKey: formKey,
                      ),
                      SizedBox(height: Spacing.huge),
                      AuthLoadingIndicator(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthListener extends StatelessWidget {
  const AuthListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSucceeded) {
          context.go('/');
        } else if (state is AuthFailed) {
          showAlertDialog(context, state.message);
        }
      },
      child: child,
    );
  }
}

class AuthLoadingIndicator extends StatelessWidget {
  const AuthLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return CircularProgressIndicator(color: AppColors.primaryBlue);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
