import 'package:get_it/get_it.dart';
import 'package:my_school/src/features/auth/domain/usecases/get_email_usecase.dart';
import 'package:my_school/src/features/classes/data/supabase_class_repo.dart';
import 'package:my_school/src/features/classes/domain/class_repo.dart';
import 'package:my_school/src/features/classes/domain/usecases/fetch_class.dart';
import 'package:my_school/src/features/classes/domain/usecases/get_class_by_id.dart';
import 'package:my_school/src/features/classes/domain/usecases/get_classes_by_year.dart';
import 'package:my_school/src/features/initializer/presentation/cubit/initialization_cubit.dart';
import 'package:my_school/src/features/parent/data/repositories/supabase_parent_repository.dart';
import 'package:my_school/src/features/parent/domain/repositories/parent_repository.dart';
import 'package:my_school/src/features/parent/domain/usecases/fetch_parent_usecase.dart';
import 'package:my_school/src/features/parent/domain/usecases/get_parent.dart';
import 'package:my_school/src/features/student/data/repositories/supabase_student_repository.dart';
import 'package:my_school/src/features/student/domain/repositories/student_repository.dart';
import 'package:my_school/src/features/student/domain/usecases/fetch_students.dart';
import 'package:my_school/src/features/student/domain/usecases/get_student_by_id.dart';
import 'package:my_school/src/features/student/domain/usecases/get_students.dart';
import 'package:my_school/src/features/student/presentation/cubit/choose_student/choose_student_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Add auth imports
import 'package:my_school/src/features/auth/data/repository/supabase_auth_repository.dart';
import 'package:my_school/src/features/auth/domain/repository/auth_repository.dart';
import 'package:my_school/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:my_school/src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:my_school/src/features/auth/domain/usecases/is_signed_in_usecase.dart';
import 'package:my_school/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';

final di = GetIt.instance;
final _supabase = Supabase.instance;

void setupDI() {
  // Register your dependencies here
  _registerAuth();
  _registerParent();
  _registerClass();
  _registerInitialization();
  _registerStudent();
}

void _registerParent() {
  //Repositories
  di.registerSingleton<ParentRepository>(
    SupabaseParentRepository(supabaseClient: _supabase.client),
  );
  //UseCases
  di.registerLazySingleton<FetchParentUsecase>(
    () => FetchParentUsecase(
      repository: di.get<ParentRepository>(),
      getEmailUsecase: di.get<GetEmailUsecase>(),
    ),
  );
  di.registerLazySingleton<GetParentUseCase>(
    () => GetParentUseCase(di.get<ParentRepository>()),
  );

  //Cubits / Blocs
}

void _registerInitialization() {
  //Cubits / Blocs
  di.registerFactory<InitializationCubit>(
    () => InitializationCubit(
      fetchParentUsecase: di.get<FetchParentUsecase>(),
      fetchClassUseCase: di.get<FetchClassUseCase>(),
    ),
  );
}

// Register auth repository and use cases
void _registerAuth() {
  // Repositories
  di.registerSingleton<AuthRepository>(
    SupabaseAuthRepository(client: _supabase.client),
  );

  // UseCases
  di.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(repository: di.get<AuthRepository>()),
  );
  di.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(repository: di.get<AuthRepository>()),
  );
  di.registerLazySingleton<IsSignedInUseCase>(
    () => IsSignedInUseCase(repository: di.get<AuthRepository>()),
  );
  di.registerLazySingleton<GetEmailUsecase>(
    () => GetEmailUsecase(repository: di.get<AuthRepository>()),
  );

  // Cubit/Bloc
  di.registerFactory<AuthCubit>(
    () => AuthCubit(
      signInUseCase: di.get<SignInUseCase>(),
      signOutUseCase: di.get<SignOutUseCase>(),
    ),
  );
}

void _registerStudent() {
  //Repositories
  di.registerLazySingleton<StudentRepository>(
    () => SupabaseStudentRepository(supabaseClient: _supabase.client),
  );
  //UseCases
  di.registerLazySingleton<FetchStudentsUseCase>(
    () => FetchStudentsUseCase(
      repository: di.get<StudentRepository>(),
      getParentUseCase: di.get<GetParentUseCase>(),
    ),
  );
  di.registerLazySingleton<GetStudentsUseCase>(
    () => GetStudentsUseCase(di.get<StudentRepository>()),
  );
  di.registerLazySingleton<GetStudentById>(
    () => GetStudentById(di.get<StudentRepository>()),
  );
  //Cubits / Blocs
  di.registerFactory<ChooseStudentCubit>(
    () => ChooseStudentCubit(
      di.get<FetchStudentsUseCase>(),
      di.get<GetStudentsUseCase>(),
      di.get<GetClassById>(),
    ),
  );
}

void _registerClass() {
  //Repositories
  di.registerLazySingleton<ClassRepo>(
    () => SupabaseClassRepo(supabaseClient: _supabase.client),
  );
  //UseCases
  di.registerLazySingleton<FetchClassUseCase>(
    () => FetchClassUseCase(classRepo: di.get<ClassRepo>()),
  );
  di.registerLazySingleton<GetClassById>(
    () => GetClassById(classRepo: di.get<ClassRepo>()),
  );
  di.registerLazySingleton<GetClassesByYear>(
    () => GetClassesByYear(classRepo: di.get<ClassRepo>()),
  );
  //Cubits / Blocs
}

// void registerInstance() {
//   //Repositories
//   //UseCases
//   //Cubits / Blocs
// }
