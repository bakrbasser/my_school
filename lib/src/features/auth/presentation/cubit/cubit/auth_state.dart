part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSucceeded extends AuthState {}

// Include an optional message for failures
final class AuthFailed extends AuthState {
  final String message;
  AuthFailed([this.message = 'An error occurred']);
}

// Emit signed-in status result
final class AuthStatus extends AuthState {
  final bool isSignedIn;
  AuthStatus(this.isSignedIn);
}
