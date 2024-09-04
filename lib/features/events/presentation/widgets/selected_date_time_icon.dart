import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';

class SelectedDateAndTimeIcon extends StatelessWidget {
  const SelectedDateAndTimeIcon(
      {super.key, required this.onTap, required this.icon});
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon, color: AppColors.hiddenNotesColor),
    );
  }
}
