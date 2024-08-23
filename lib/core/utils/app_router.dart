import 'package:go_router/go_router.dart';
import 'package:up_todo/features/onboarding/presentation/views/on_boarding_view.dart';

import '../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const onBoardingView = '/onBoardingView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
          path: onBoardingView,
          builder: (context, state) => const OnBoardingView()),
    ],
  );
}
