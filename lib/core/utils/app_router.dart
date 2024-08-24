import 'package:go_router/go_router.dart';
import 'package:up_todo/features/create_note/presentation/views/create_note_view.dart';
import 'package:up_todo/features/home/presentation/views/home_view.dart';
import 'package:up_todo/features/onboarding/presentation/views/on_boarding_view.dart';

import '../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const onBoardingView = '/onBoardingView';
  static const homeView = '/homeView';
  static const createNoteView = '/createNoteView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
          path: onBoardingView,
          builder: (context, state) => const OnBoardingView()),
      GoRoute(path: homeView, builder: (context, state) => const HomeView()),
      GoRoute(
          path: createNoteView,
          builder: (context, state) => const CreateNoteView()),
    ],
  );
}
