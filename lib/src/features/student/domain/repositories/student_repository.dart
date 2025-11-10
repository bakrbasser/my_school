import 'package:my_school/src/features/student/domain/entities/student.dart';

abstract class StudentRepository {
  Future<void> fetchStudents(String parentId);
  List<Student> get students;
  Student getStudentById(int id);
}
