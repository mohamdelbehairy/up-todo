import 'package:flutter/material.dart';
import 'package:up_todo/core/models/svg_model.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/widgets/custom_svg.dart';

import 'selected_date_time_icon.dart';

class EventsSelectedDateTimeAndSaveButton extends StatelessWidget {
  const EventsSelectedDateTimeAndSaveButton({super.key, required this.onTapSave});
  final Function() onTapSave;

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
            onTap: onTapSave,
            child: CustomSvg(svgModel: SvgModel(image: Assets.imagesSendEvent)))
      ],
    );
  }
}
