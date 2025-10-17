import 'package:my_school/src/features/auth/domain/repository/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase({required this.repository});

  /// Signs the current user out. Delegates to [AuthRepository.signOut].
  Future<void> call() {
    return repository.signOut();
  }
}
