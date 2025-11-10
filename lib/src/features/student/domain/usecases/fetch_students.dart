import 'package:my_school/src/features/parent/domain/usecases/get_parent.dart';
import 'package:my_school/src/features/student/domain/repositories/student_repository.dart';

class FetchStudentsUseCase {
  final StudentRepository repository;
  final GetParentUseCase getParentUseCase;

  FetchStudentsUseCase({
    required this.repository,
    required this.getParentUseCase,
  });

  Future<void> call() async {
    final parent = getParentUseCase.call();
    await repository.fetchStudents(parent.id);
  }
}
