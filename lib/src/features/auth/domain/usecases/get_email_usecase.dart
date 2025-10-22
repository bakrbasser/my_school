import 'package:my_school/src/features/auth/domain/repository/auth_repository.dart';

class GetEmailUsecase {
  final AuthRepository repository;

  GetEmailUsecase({required this.repository});

  String? call() {
    return repository.getEmail();
  }
}
