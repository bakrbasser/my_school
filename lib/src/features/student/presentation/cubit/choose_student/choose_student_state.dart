part of 'choose_student_cubit.dart';

@immutable
sealed class ChooseStudentState {}

final class ChooseStudentInitial extends ChooseStudentState {}

final class FetchingStudent extends ChooseStudentState {}

final class NoAvailableStudent extends ChooseStudentState {}

final class FetchedStudents extends ChooseStudentState {
  final List<Student> students;

  FetchedStudents({required this.students});
}

final class FetchingStudentsFailed extends ChooseStudentState {
  final String message;

  FetchingStudentsFailed({required this.message});
}
