import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:up_todo/core/widgets/up_todo.dart';
import 'core/utils/function/init_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await initMain();
  runApp(const UpTodo());
}
