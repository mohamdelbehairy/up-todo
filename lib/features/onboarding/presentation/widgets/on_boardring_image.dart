import 'package:flutter/material.dart';

class OnBoardringImage extends StatelessWidget {
  const OnBoardringImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(image));
  }
}