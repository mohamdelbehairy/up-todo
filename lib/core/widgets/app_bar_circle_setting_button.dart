import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/assets.dart';

import '../models/svg_model.dart';
import 'custom_svg.dart';

class AppBarCircleSettingButton extends StatelessWidget {
  const AppBarCircleSettingButton({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: CustomSvg(
            svgModel: SvgModel(
                height: 22, width: 22, image: Assets.imagesCircleSetting)));
  }
}
