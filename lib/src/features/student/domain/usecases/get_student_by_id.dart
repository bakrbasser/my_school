import 'package:my_school/src/features/student/domain/entities/student.dart';
import 'package:my_school/src/features/student/domain/repositories/student_repository.dart';

class GetStudentById {
  final StudentRepository repository;

  GetStudentById(this.repository);

  Student call(int studentId) {
    return repository.getStudentById(studentId);
  }
}
