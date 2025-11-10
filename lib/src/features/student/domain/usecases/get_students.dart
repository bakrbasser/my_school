import 'package:my_school/src/features/student/domain/entities/student.dart';
import 'package:my_school/src/features/student/domain/repositories/student_repository.dart';

class GetStudentsUseCase {
  final StudentRepository repository;

  GetStudentsUseCase(this.repository);

  List<Student> call() {
    return repository.students;
  }
}
