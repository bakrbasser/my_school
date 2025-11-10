import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_school/src/features/classes/domain/usecases/get_class_by_id.dart';
import 'package:my_school/src/features/student/domain/entities/student.dart';
import 'package:my_school/src/features/student/domain/usecases/fetch_students.dart';
import 'package:my_school/src/features/student/domain/usecases/get_students.dart';

part 'choose_student_state.dart';

class ChooseStudentCubit extends Cubit<ChooseStudentState> {
  ChooseStudentCubit(
    this._fetchStudentsUseCase,
    this._getStudents,
    this._getClassById,
  ) : super(ChooseStudentInitial());

  final FetchStudentsUseCase _fetchStudentsUseCase;
  final GetStudentsUseCase _getStudents;
  final GetClassById _getClassById;

  Future<void> fetchStudents() async {
    emit(FetchingStudent());
    try {
      await _fetchStudentsUseCase.call();
    } catch (e) {
      emit(FetchingStudentsFailed(message: e.toString()));
      return;
    }
    List<Student> students = _getStudents.call();
    if (students.isEmpty) {
      emit(NoAvailableStudent());
    } else {
      emit(FetchedStudents(students: students));
    }
  }

  String studentClassName(int classId) {
    final cls = _getClassById.call(classId);
    return cls.name;
  }
}
