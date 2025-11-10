import 'package:my_school/src/features/parent/domain/entities/parent.dart';

abstract class ParentRepository {
  Future<void> fetchParent(String email);
  Parent get currentParent;
}
