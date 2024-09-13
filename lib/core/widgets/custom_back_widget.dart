import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';

class CustomBackWidget extends StatelessWidget {
  const CustomBackWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Icon(Icons.arrow_back_ios, color: AppColors.secondaryColor),
    );
  }
}
