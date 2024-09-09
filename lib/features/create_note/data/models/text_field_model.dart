import 'package:flutter/material.dart';

class TextFieldModel {
  final int? maxLines;
  final TextEditingController? controller;
  final String title;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? suffixTap;

  TextFieldModel(
      {this.maxLines = 1,
      this.controller,
      this.title = '',
      this.validator,
      this.onChanged,
      this.suffixTap});
}
