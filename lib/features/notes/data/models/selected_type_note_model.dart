import 'package:flutter/material.dart';

class SelectedTypeNoteModel {
  final String name, image;
  final Color backgroundColor;

  final int index;

  SelectedTypeNoteModel(
      {required this.name,
      required this.image,
      required this.backgroundColor,
      required this.index});
}
