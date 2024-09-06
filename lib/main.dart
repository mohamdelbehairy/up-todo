import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/function/init_hive.dart';
import 'package:up_todo/core/widgets/up_todo.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/function/setup_service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  await initHive();
  runApp(const UpTodo());
}
