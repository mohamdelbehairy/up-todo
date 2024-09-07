import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/cached_svg.dart';
import '../bloc_observer.dart';
import 'init_hive.dart';
import 'setup_service_locator.dart';

Future<void> initMain() async {
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  CachedSvg.cachedSvg();
  await initHive();
}