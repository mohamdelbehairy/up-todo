import 'package:flutter/material.dart';
import 'package:up_todo/features/onboarding/data/models/on_boardring_model.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator({super.key, required this.onBoardringModel});
  final OnBoardringModel onBoardringModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
                height: 5, color: onBoardringModel.colorOne)),
        Expanded(
            flex: 1,
            child: Container(
                height: 5, color: onBoardringModel.colorTwo)),
        Expanded(
            flex: 1,
            child: Container(
                height: 5, color: onBoardringModel.colorThree))
      ],
    );
  }
}