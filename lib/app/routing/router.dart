import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_school/app/dependency_injection/di.dart';
import 'package:my_school/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:my_school/src/features/auth/presentation/page/auth_page.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => di.get<AuthCubit>(),
        child: AuthPage(),
      ),
    ),
  ],
);
