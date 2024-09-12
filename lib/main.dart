import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:up_todo/core/widgets/up_todo.dart';
import 'core/utils/function/init_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initMain();

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const UpTodo(),
  ));
}
