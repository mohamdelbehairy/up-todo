import 'package:flutter/material.dart';
import 'package:up_todo/core/models/app_bar_model.dart';
import 'package:up_todo/core/models/svg_model.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/styles.dart';

import 'custom_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.appBarModel});
  final AppBarModel appBarModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(appBarModel.title, style: Styles.styleBold26),
        InkWell(
            onTap: appBarModel.onTap,
            child: CustomSvg(
                svgModel: SvgModel(image: Assets.imagesCircleSetting)))
      ],
    );
  }
}
