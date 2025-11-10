import 'package:my_school/src/core/error_handling/error_handler.dart';
import 'package:my_school/src/features/classes/data/class_model.dart';
import 'package:my_school/src/features/classes/domain/class.dart';
import 'package:my_school/src/features/classes/domain/class_repo.dart';
import 'package:supabase/supabase.dart';

class SupabaseClassRepo implements ClassRepo {
  List<Class> _classes = [];

  final SupabaseClient _supabaseClient;

  SupabaseClassRepo({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;

  @override
  Future<void> fetchClasses() async {
    await guardCall(
      call: () async {
        final classes = await _supabaseClient.from('class').select();
        _classes = List.generate(
          classes.length,
          (index) => ClassModel.fromJson(classes[index]),
        );
      },
    );
  }

  @override
  Class getClassById(int classId) {
    return _classes.firstWhere((element) => element.id == classId);
  }

  @override
  List<Class> getClassesByYear(int yearId) {
    return List.from(_classes.where((element) => element.yearId == yearId));
  }
}
