import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_school/app/dependency_injection/di.dart';
import 'package:my_school/src/features/auth/domain/usecases/is_signed_in_usecase.dart';
import 'package:my_school/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:my_school/src/features/auth/presentation/page/auth_page.dart';
import 'package:my_school/src/features/dashboard/presentation/page/dashboard_page.dart';
import 'package:my_school/src/features/initializer/presentation/cubit/initialization_cubit.dart';
import 'package:my_school/src/features/initializer/presentation/pages/initial_page.dart';
import 'package:my_school/src/features/student/presentation/cubit/choose_student/choose_student_cubit.dart';
import 'package:my_school/src/features/student/presentation/pages/choose_student_page.dart';

class Routing {
  Routing._();

  static Routing instance = Routing._();

  final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/Auth',
        builder: (context, state) => BlocProvider(
          create: (context) => di.get<AuthCubit>(),
          child: AuthPage(),
        ),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => di.get<InitializationCubit>(),
          child: InitialPage(),
        ),
        redirect: (context, state) {
          if (di.get<IsSignedInUseCase>().call()) {
            return '/';
          } else {
            return '/Auth';
          }
        },
      ),
      GoRoute(
        path: '/children',
        builder: (context, state) => BlocProvider(
          create: (context) => di.get<ChooseStudentCubit>(),
          child: ChooseStudentPage(),
        ),
      ),
      GoRoute(
        path: '/dashboard/:studentId',

        builder: (context, state) {
          int studentId = int.parse(state.pathParameters['studentId']!);
          return DashboardPage(studentId: studentId);
        },
      ),
    ],
  );
}
