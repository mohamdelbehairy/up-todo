import 'package:flutter/material.dart';

class TextFieldModel {
  final int? maxLines;
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;

  TextFieldModel(
      {this.maxLines = 1,
      required this.controller,
      this.title = '',
      this.validator});
}
