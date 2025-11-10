import 'package:my_school/src/features/parent/domain/entities/parent.dart';
import 'package:my_school/src/features/parent/domain/repositories/parent_repository.dart';

class GetParentUseCase {
  final ParentRepository _repository;

  GetParentUseCase(this._repository);

  Parent call() {
    return _repository.currentParent;
  }
}
