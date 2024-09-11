import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/app_router.dart';
import 'package:up_todo/core/utils/colors.dart';

import 'up_todo_multi_bloc_provider.dart';

class UpTodo extends StatelessWidget {
  const UpTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return UpTodoMultiBlocProvider(
        child: MaterialApp.router(
            title: 'UpTodo',
            theme: ThemeData(
                useMaterial3: false,
                scaffoldBackgroundColor: AppColors.backgroundColor),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router));
  }
}
