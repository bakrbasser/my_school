import 'package:my_school/src/core/error_handling/error_handler.dart';
import 'package:my_school/src/features/auth/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository implements AuthRepository {
  final SupabaseClient _client;

  SupabaseAuthRepository({required SupabaseClient client}) : _client = client;

  /// Expose client for tests or advanced operations without changing behavior.
  SupabaseClient get client => _client;

  @override
  Future<bool> isSignedIn() async {
    return _client.auth.currentSession != null;
  }

  @override
  Future<void> signIn(String email, String password) async {
    await guardCall(
      call: () {
        return _client.auth.signInWithPassword(
          email: email,
          password: password,
        );
      },
    );
  }

  @override
  Future<void> signOut() async {
    await guardCall(
      call: () {
        return _client.auth.signOut();
      },
    );
  }
}
