import 'package:my_school/src/core/error_handling/error_handler.dart';
import 'package:my_school/src/features/student/data/models/student_model.dart';
import 'package:my_school/src/features/student/domain/entities/student.dart';
import 'package:my_school/src/features/student/domain/repositories/student_repository.dart';
import 'package:supabase/supabase.dart';

class SupabaseStudentRepository implements StudentRepository {
  List<Student> _students = [];

  final SupabaseClient _supabaseClient;

  SupabaseStudentRepository({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;

  @override
  Future<void> fetchStudents(String parentId) async {
    final response = await guardCall(
      call: () {
        return _supabaseClient
            .from('student')
            .select()
            .eq('parent_id', parentId);
      },
    );
    _students = List.generate(response.length, (int index) {
      final studentJson = response[index];
      return StudentModel.fromJson(studentJson);
    });
  }

  @override
  List<Student> get students => _students;

  @override
  Student getStudentById(int id) {
    return _students.firstWhere((element) => element.id == id);
  }
}
