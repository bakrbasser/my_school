import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_school/src/core/presentation/app_colors.dart';
import 'package:my_school/src/core/presentation/dialogs.dart';
import 'package:my_school/src/core/presentation/fonts_manager.dart';
import 'package:my_school/src/core/presentation/screen_size_helper.dart';
import 'package:my_school/src/core/presentation/sizes.dart';
import 'package:my_school/src/features/initializer/presentation/cubit/initialization_cubit.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    context.read<InitializationCubit>().initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return InitialPageListener(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeightPercentage(context, 35)),
              Icon(Icons.home, color: AppColors.primaryBlue, size: Sizes.s60),
              SizedBox(height: Spacing.medium),
              Text('يجري جمع البيانات', style: IBMMedium(fontSize: Sizes.s24)),
              SizedBox(height: Spacing.medium),
              Text(
                'الرجاء الانتظار قليلا ريثما ينتهي التحميل',
                style: IBMMedium(fontSize: Sizes.s16, color: Colors.grey),
              ),
              SizedBox(height: Spacing.large),
              SizedBox(
                width: screenWidthPercentage(context, 90),
                child: LinearProgressIndicator(
                  color: AppColors.primaryBlue,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(RadiusV.v12),
                ),
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school_outlined,
                    color: AppColors.primaryBlue,
                    size: Sizes.s32,
                  ),
                  SizedBox(width: Spacing.medium),
                  Text('تطبيق مدرستي', style: IBMMedium(fontSize: Sizes.s20)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InitialPageListener extends StatelessWidget {
  const InitialPageListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitializationCubit, InitializationState>(
      listener: (context, state) {
        if (state is Initialized) {
          context.go('/children');
        } else if (state is InitializationFailed) {
          showAlertDialog(
            context,
            state.message,
            okMessage: 'إعادة المحاولة',
            // Retry initialization on OK
            onOk: () {
              context.read<InitializationCubit>().initializeApp();
            },
          );
        }
      },
      child: child,
    );
  }
}
