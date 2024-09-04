import 'package:flutter/material.dart';
import 'package:up_todo/core/models/svg_model.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/core/widgets/custom_svg.dart';

class CreateNewEventWidget extends StatelessWidget {
  const CreateNewEventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: const Color(0xffEDEDF1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            CustomSvg(svgModel: SvgModel(image: Assets.imagesSqureCreateEvent)),
            const SizedBox(width: 12),
            Text('Create New Event', style: Styles.styleRegular14)
          ],
        ),
      ),
    );
  }
}
