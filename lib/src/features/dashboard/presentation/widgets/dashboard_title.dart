import 'package:flutter/material.dart';
import 'package:my_school/src/core/presentation/app_colors.dart';
import 'package:my_school/src/core/presentation/fonts_manager.dart';
import 'package:my_school/src/core/presentation/sizes.dart';
import 'package:my_school/src/features/student/domain/entities/student.dart';

class DashboardTitle extends StatelessWidget {
  const DashboardTitle({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 248, 186, 0),
          child: Icon(
            Icons.person,
            size: Sizes.s32,
            color: AppColors.primaryBlue,
          ),
        ),
        SizedBox(width: Spacing.medium),
        Column(
          children: [
            Text('مرحبا بعودتك', style: IBMLight()),
            Text(student.name, style: IBMMedium(fontSize: Sizes.s20)),
          ],
        ),
      ],
    );
  }
}
