import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/styles.dart';

class CustomSlideText extends StatelessWidget {
  const CustomSlideText(
      {super.key, required this.animation, required this.text});

  final Animation<Offset> animation;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: animation, child: Text(text, style: Styles.styleBold40));
  }
}
