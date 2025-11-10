import 'package:my_school/src/features/classes/domain/class.dart';
import 'package:my_school/src/features/classes/domain/class_repo.dart';

class GetClassById {
  final ClassRepo _classRepo;

  GetClassById({required ClassRepo classRepo}) : _classRepo = classRepo;

  Class call(int id) {
    return _classRepo.getClassById(id);
  }
}
