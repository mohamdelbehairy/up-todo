import 'package:flutter/material.dart';

class OnBoardringModel {
  final String image, title, description, buttonName;
  final Color colorOne, colorTwo, colorThree;

  OnBoardringModel(
      {required this.image,
      required this.title,
      required this.description,
      this.buttonName = 'Next',
      required this.colorOne,
      required this.colorTwo,
      required this.colorThree});
}
