import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_school/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:my_school/src/features/auth/domain/usecases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // Injected use-cases
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthCubit({
    required SignInUseCase signInUseCase,
    required SignOutUseCase signOutUseCase,
  }) : _signInUseCase = signInUseCase,
       _signOutUseCase = signOutUseCase,
       super(AuthInitial());

  // Signs in and emits states
  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await _signInUseCase.call(email: email, password: password);
      emit(AuthSucceeded());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  // Signs out and emits states
  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await _signOutUseCase.call();
      emit(AuthSucceeded());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
