import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_todo/core/utils/app_router.dart';
import 'package:up_todo/core/utils/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash.png',height: 100),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  void navigation() async {
    final prefs = await SharedPreferences.getInstance();
    final onBoarding = prefs.getString(Constants.kOnBoarding);
    Future.delayed(const Duration(seconds: 2), () {
      if (onBoarding == null) {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).go(AppRouter.onBoardingView);
      } else {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).go(AppRouter.homeView);
      }
    });
  }
}
