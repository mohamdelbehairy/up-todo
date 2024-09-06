import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_todo/core/utils/app_router.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'custom_slide_text.dart';

class SplashTextAnimation extends StatefulWidget {
  const SplashTextAnimation({super.key});

  @override
  State<SplashTextAnimation> createState() => _SplashTextAnimationState();
}

class _SplashTextAnimationState extends State<SplashTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animationLeft, _animationRight;

  @override
  void initState() {
    initAnimation();
    navigation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSlideText(animation: _animationLeft, text: 'Up'),
              CustomSlideText(animation: _animationRight, text: 'Todo'),
            ],
          );
        });
  }

  void initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationLeft = Tween<Offset>(begin: const Offset(-5, 0), end: Offset.zero)
        .animate(_animationController);

    _animationRight = Tween<Offset>(begin: const Offset(5, 0), end: Offset.zero)
        .animate(_animationController);
    _animationController.forward();
  }

  void navigation() async {
    final prefs = await SharedPreferences.getInstance();
    final onBoarding = prefs.getString(Constants.kOnBoarding);
    Future.delayed(const Duration(seconds: 4), () {
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
