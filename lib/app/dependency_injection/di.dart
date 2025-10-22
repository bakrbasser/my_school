import 'package:get_it/get_it.dart';
import 'package:my_school/src/features/parent/data/repositories/supabase_parent_repository.dart';
import 'package:my_school/src/features/parent/domain/repositories/parent_repository.dart';
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
  _registerParent();
  _registerAuth();
}

void _registerParent() {
  //Repositories
  di.registerSingleton<ParentRepository>(
    SupabaseParentRepository(supabaseClient: _supabase.client),
  );
  //UseCases

  //Cubits / Blocs
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

  // Cubit/Bloc
  di.registerFactory<AuthCubit>(
    () => AuthCubit(
      signInUseCase: di.get<SignInUseCase>(),
      signOutUseCase: di.get<SignOutUseCase>(),
      isSignedInUseCase: di.get<IsSignedInUseCase>(),
    ),
  );
}


// void registerInstance() {
//   //Repositories
//   //UseCases
//   //Cubits / Blocs
// }

