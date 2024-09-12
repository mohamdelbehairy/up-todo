import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';

class CustomBackWidget extends StatelessWidget {
  const CustomBackWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_back_ios, color: AppColors.secondaryColor),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text('Back', style: Styles.styleSemiBold14))
        ],
      ),
    );
  }
}
