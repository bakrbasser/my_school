import 'package:my_school/src/core/error_handling/error_handler.dart';
import 'package:my_school/src/features/parent/data/models/parent_model.dart';
import 'package:my_school/src/features/parent/domain/entities/parent.dart';
import 'package:my_school/src/features/parent/domain/repositories/parent_repository.dart';
import 'package:supabase/supabase.dart';

class SupabaseParentRepository implements ParentRepository {
  final SupabaseClient _supabaseClient;

  SupabaseParentRepository({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;

  Parent? _currentParent;

  @override
  Parent get currentParent => _currentParent!;

  @override
  Future<void> fetchParent(String email) async {
    final response = await guardCall(
      call: () async {
        return await _supabaseClient
            .from('parent')
            .select()
            .eq('email', email)
            .single();
      },
    );
    _currentParent = ParentModel.fromJson(response);
  }
}
