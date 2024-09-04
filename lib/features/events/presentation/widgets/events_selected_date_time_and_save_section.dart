import 'package:flutter/material.dart';
import 'package:up_todo/core/models/svg_model.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/widgets/custom_svg.dart';

import 'selected_date_time_icon.dart';

class EventsSelectedDateTimeAndSaveSection extends StatelessWidget {
  const EventsSelectedDateTimeAndSaveSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SelectedDateAndTimeIcon(onTap: () {}, icon: Icons.schedule),
            const SizedBox(width: 20),
            SelectedDateAndTimeIcon(onTap: () {}, icon: Icons.calendar_month),
          ],
        ),
        InkWell(
            onTap: () {},
            child: CustomSvg(svgModel: SvgModel(image: Assets.imagesSendEvent)))
      ],
    );
  }
}
