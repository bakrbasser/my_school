// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_school/src/core/presentation/app_colors.dart';
import 'package:my_school/src/core/presentation/fonts_manager.dart';
import 'package:my_school/src/core/presentation/sizes.dart';

InputDecoration authInputDecoration({
  required String hintText,
  Widget? prefix,
}) {
  return InputDecoration(
    prefix: prefix,
    hintText: hintText,
    alignLabelWithHint: false,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(RadiusV.v16),
      borderSide: BorderSide.none,
    ),
    fillColor: AppColors.inputBg,
    filled: true,
    labelStyle: IBMRegular(),
  );
}

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('البريد الالكتروني', style: IBMMedium(fontSize: Sizes.s16)),
        SizedBox(height: Spacing.medium),
        TextFormField(
          controller: controller,
          decoration: authInputDecoration(hintText: 'ادخل البريد الالكتروني'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء ادخال البريد الالكتروني';
            }
            // Simple email validation
            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
            if (!emailRegex.hasMatch(value)) {
              return 'الرجاء ادخال بريد الكتروني صالح';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('كلمة المرور', style: IBMMedium(fontSize: Sizes.s16)),
        SizedBox(height: Spacing.medium),
        TextFormField(
          controller: controller,
          obscureText: true,
          decoration: authInputDecoration(hintText: 'ادخل كلمة المرور'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء ادخال كلمة المرور';
            }
            if (value.length < 8) {
              return 'كلمة المرور يجب ان تكون 8 احرف على الاقل';
            }
            return null;
          },
        ),
      ],
    );
  }
}
