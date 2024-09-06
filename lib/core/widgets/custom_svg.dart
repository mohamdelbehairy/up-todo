import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:up_todo/core/models/svg_model.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({super.key, required this.svgModel});
  final SvgModel svgModel;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgModel.image,
      height: svgModel.height,
      width: svgModel.width,
      fit: svgModel.fit,
      colorFilter: svgModel.colorFilter,
    );
  }
}
