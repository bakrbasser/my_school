import 'package:flutter/material.dart';
import 'package:my_school/app/dependency_injection/di.dart';
import 'package:my_school/src/features/dashboard/presentation/widgets/dashboard_title.dart';
import 'package:my_school/src/features/student/domain/entities/student.dart';
import 'package:my_school/src/features/student/domain/usecases/get_student_by_id.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.studentId});
  final int studentId;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Student currentStudent;

  @override
  void initState() {
    super.initState();
    currentStudent = di.get<GetStudentById>().call(widget.studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: DashboardTitle(student: currentStudent)),
      ),
    );
  }
}
