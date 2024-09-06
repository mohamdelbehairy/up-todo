import 'package:flutter/material.dart';

class NoNotesFoundModel {
  final String text;
  final TextStyle? style;
  final Color? backgroundColor;
  final AlignmentGeometry alignment;

  NoNotesFoundModel({required this.text, this.style, this.backgroundColor, this.alignment = Alignment.center});
}
