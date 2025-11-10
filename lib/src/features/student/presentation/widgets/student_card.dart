import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_school/src/core/presentation/app_colors.dart';
import 'package:my_school/src/core/presentation/fonts_manager.dart';
import 'package:my_school/src/core/presentation/screen_size_helper.dart';
import 'package:my_school/src/core/presentation/sizes.dart';
import 'package:my_school/src/features/student/domain/entities/student.dart';
import 'package:my_school/src/features/student/presentation/cubit/choose_student/choose_student_cubit.dart';

class StudentCard extends StatefulWidget {
  const StudentCard({super.key, required this.student});
  final Student student;

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  String className = '';
  @override
  void initState() {
    super.initState();
    if (widget.student.classId != null) {
      className = context.read<ChooseStudentCubit>().studentClassName(
        widget.student.classId!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person, size: Sizes.s32),
      tileColor: Colors.white,
      minTileHeight: screenHeightPercentage(context, 10),
      title: Text(widget.student.name),
      subtitle: Text('${widget.student.yearInArabic}, الشعبة :$className'),
      subtitleTextStyle: IBMRegular(color: Colors.grey),
      titleTextStyle: IBMMedium(fontSize: Sizes.s20),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(RadiusV.v32),
        side: BorderSide(
          color: const Color.fromARGB(255, 220, 218, 218),
          width: 2,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      iconColor: AppColors.primaryBlue,
      onTap: () {
        context.go('/dashboard/${widget.student.id}');
      },
    );
  }
}

class StudentCardsList extends StatelessWidget {
  const StudentCardsList({super.key, required this.students});
  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) => StudentCard(student: students[index]),
      padding: EdgeInsets.only(bottom: Spacing.huge),
    );
  }
}
