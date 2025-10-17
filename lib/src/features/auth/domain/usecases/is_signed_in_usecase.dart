import 'package:my_school/src/features/auth/domain/repository/auth_repository.dart';

class IsSignedInUseCase {
  final AuthRepository repository;

  IsSignedInUseCase({required this.repository});

  /// Returns true if a user is currently signed in.
  Future<bool> call() {
    return repository.isSignedIn();
  }
}
