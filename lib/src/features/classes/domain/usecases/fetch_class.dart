import 'package:my_school/src/features/classes/domain/class_repo.dart';

class FetchClassUseCase {
  final ClassRepo _classRepo;

  FetchClassUseCase({required ClassRepo classRepo}) : _classRepo = classRepo;

  Future<void> call() {
    return _classRepo.fetchClasses();
  }
}
