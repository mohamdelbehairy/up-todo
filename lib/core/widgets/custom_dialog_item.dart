import 'package:flutter/material.dart';
import 'package:up_todo/core/models/svg_model.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/core/widgets/custom_svg.dart';

import '../models/custom_dialog_model.dart';

class CustomDialogItem extends StatelessWidget {
  const CustomDialogItem({super.key, required this.customDialogModel});
  final CustomDialogModel customDialogModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: customDialogModel.onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: customDialogModel.backgroundColor,
            child: CustomSvg(
              svgModel: SvgModel(
                  image: customDialogModel.image,
                  height: 22,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            ),
          ),
          const SizedBox(width: 12),
          Text(customDialogModel.title,
              style: Styles.styleSemiBold9.copyWith(fontSize: 18))
        ],
      ),
    );
  }
}
