import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/app_router.dart';

import 'core/utils/bloc_observer.dart';
import 'core/utils/colors.dart';
import 'features/home/presentation/manager/bottom_navigation/bottom_navigation_cubit.dart';
import 'features/onboarding/presentation/manager/on_boardring/on_boardring_cubit.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const UpTodo());
}

class UpTodo extends StatelessWidget {
  const UpTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardringCubit()),
        BlocProvider(create: (context) => BottomNavigationCubit()),
      ],
      child: MaterialApp.router(
          theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router),
    );
  }
}
