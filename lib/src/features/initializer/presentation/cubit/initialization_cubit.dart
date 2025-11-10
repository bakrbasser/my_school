import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_school/src/features/classes/domain/usecases/fetch_class.dart';
import 'package:my_school/src/features/parent/domain/usecases/fetch_parent_usecase.dart';

part 'initialization_state.dart';

class InitializationCubit extends Cubit<InitializationState> {
  InitializationCubit({
    required FetchClassUseCase fetchClassUseCase,
    required FetchParentUsecase fetchParentUsecase,
  }) : _fetchClassUseCase = fetchClassUseCase,
       _fetchParentUsecase = fetchParentUsecase,
       super(InitializationInitial());

  final FetchParentUsecase _fetchParentUsecase;
  final FetchClassUseCase _fetchClassUseCase;

  Future<void> initializeApp() async {
    emit(Initializing());
    try {
      await _fetchParentUsecase.call();
      await _fetchClassUseCase.call();
      emit(Initialized());
    } catch (e) {
      emit(InitializationFailed(message: e.toString()));
    }
  }
}
