part of 'initialization_cubit.dart';

@immutable
sealed class InitializationState {}

final class InitializationInitial extends InitializationState {}

final class Initializing extends InitializationState {}

final class Initialized extends InitializationState {}

final class InitializationFailed extends InitializationState {
  final String message;

  InitializationFailed({required this.message});
}
