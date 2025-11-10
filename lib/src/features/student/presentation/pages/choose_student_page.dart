import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_school/src/core/presentation/app_colors.dart';
import 'package:my_school/src/core/presentation/dialogs.dart';
import 'package:my_school/src/core/presentation/fonts_manager.dart';
import 'package:my_school/src/core/presentation/sizes.dart';
import 'package:my_school/src/features/student/presentation/cubit/choose_student/choose_student_cubit.dart';
import 'package:my_school/src/features/student/presentation/widgets/student_card.dart';

class ChooseStudentPage extends StatefulWidget {
  const ChooseStudentPage({super.key});

  @override
  State<ChooseStudentPage> createState() => _ChooseStudentPageState();
}

class _ChooseStudentPageState extends State<ChooseStudentPage> {
  @override
  void initState() {
    super.initState();
    context.read<ChooseStudentCubit>().fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('اختر الطالب')),
        body: ChooseStudentListener(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<ChooseStudentCubit, ChooseStudentState>(
              builder: (context, state) {
                if (state is FetchingStudent) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryBlue,
                    ),
                  );
                } else if (state is FetchedStudents) {
                  return Center(
                    child: StudentCardsList(students: state.students),
                  );
                } else if (state is NoAvailableStudent) {
                  return _noAvailableStudents();
                }
                return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ChooseStudentListener extends StatelessWidget {
  const ChooseStudentListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChooseStudentCubit, ChooseStudentState>(
      child: child,
      listener: (context, state) {
        if (state is FetchingStudentsFailed) {
          showAlertDialog(
            context,
            okMessage: 'اعادة المحاولة',
            state.message,
            onOk: () {
              context.read<ChooseStudentCubit>().fetchStudents();
            },
          );
        }
      },
    );
  }
}

Widget _noAvailableStudents() {
  return Center(
    child: Text(
      'لا يوجد طلاب مسجلين في المدرسة يرجى مراجعة الادارة في حال وجود مشكلة ما',
      style: IBMMedium(fontSize: Sizes.s24),
      textAlign: TextAlign.center,
    ),
  );
}
