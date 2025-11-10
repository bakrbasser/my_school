import 'package:my_school/src/core/error_handling/error_handler.dart';
import 'package:my_school/src/features/auth/domain/usecases/get_email_usecase.dart';
import 'package:my_school/src/features/parent/domain/repositories/parent_repository.dart';

class FetchParentUsecase {
  final ParentRepository _repository;
  final GetEmailUsecase _getEmailUsecase;

  FetchParentUsecase({
    required ParentRepository repository,
    required GetEmailUsecase getEmailUsecase,
  }) : _getEmailUsecase = getEmailUsecase,
       _repository = repository;

  Future<void> call() async {
    final email = _getEmailUsecase.call();
    if (email == null) {
      throw UnAuthenticated();
    }
    await _repository.fetchParent(email);
  }
}
