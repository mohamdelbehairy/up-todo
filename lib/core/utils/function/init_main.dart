import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/cached_images.dart';
import 'package:up_todo/core/widgets/up_todo.dart';
import '../bloc_observer.dart';
import 'init_hive.dart';
import 'setup_service_locator.dart';

Future<void> initMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));

  setupServiceLocator();
  await initHive();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await CachedImages.loadImages(scaffoldMessengerKey.currentContext!);
  });

  runApp(UpTodo(scaffoldMessengerKey: scaffoldMessengerKey));
}
