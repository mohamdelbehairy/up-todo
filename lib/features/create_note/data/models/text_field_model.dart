import 'package:flutter/material.dart';

class TextFieldModel {
  final int? maxLines;
  final TextEditingController controller;
  final String title;

  TextFieldModel({this.maxLines = 1, required this.controller,this.title = ''});
}
