import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/app_router.dart';

import 'core/utils/colors.dart';

void main() {
  runApp(const UpTodo());
}

class UpTodo extends StatelessWidget {
  const UpTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.onBoardingBackgroundColor),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router);
  }
}
