import 'package:my_school/src/features/classes/domain/class.dart';
import 'package:my_school/src/features/classes/domain/class_repo.dart';

class GetClassesByYear {
  final ClassRepo _classRepo;

  GetClassesByYear({required ClassRepo classRepo}) : _classRepo = classRepo;

  List<Class> call(int yearId) {
    return _classRepo.getClassesByYear(yearId);
  }
}
