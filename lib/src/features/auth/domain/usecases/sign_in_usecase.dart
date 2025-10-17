import 'package:my_school/src/features/auth/domain/repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase({required this.repository});

  /// Signs in using [email] and [password]. Delegates to [AuthRepository.signIn].
  Future<void> call({required String email, required String password}) {
    return repository.signIn(email, password);
  }
}
