import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/function/init_hive.dart';
import 'package:up_todo/core/widgets/up_todo.dart';
import 'core/utils/bloc_observer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await initHive();
  runApp(const UpTodo());
}

