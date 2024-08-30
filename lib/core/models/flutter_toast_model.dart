import 'package:flutter/material.dart';

class FlutterToastModel {
  final String message;
  final Color? backgroundColor, textColor;

  FlutterToastModel(
      {required this.message, this.backgroundColor, this.textColor});
}
