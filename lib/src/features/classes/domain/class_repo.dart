import 'package:my_school/src/features/classes/domain/class.dart';

abstract class ClassRepo {
  Future<void> fetchClasses();
  List<Class> getClassesByYear(int yearId);
  Class getClassById(int classId);
}
