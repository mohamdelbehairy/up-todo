import 'package:flutter/material.dart';
import 'package:up_todo/core/models/svg_model.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/widgets/custom_svg.dart';

import '../../data/models/bottom_navigation_model.dart';

BottomNavigationBarItem customNavigationBarItem(
    {required BottomNavigationModel bottomNavigationModel,
    required bool activeIndex}) {
  return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: CustomSvg(
            svgModel: SvgModel(
                image: bottomNavigationModel.image,
                colorFilter: ColorFilter.mode(
                    activeIndex
                        ? AppColors.secondaryColor
                        : AppColors.primaryColor,
                    BlendMode.srcIn))),
      ),
      label: bottomNavigationModel.label);
}
