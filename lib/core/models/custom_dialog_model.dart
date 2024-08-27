import 'package:flutter/material.dart';

class CustomDialogModel {
  final Color backgroundColor;
  final String image;
  final Function() onTap;

  CustomDialogModel(
      {required this.backgroundColor,
      required this.image,
      required this.onTap});
}
