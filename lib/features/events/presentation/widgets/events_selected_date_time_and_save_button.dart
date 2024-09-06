import 'package:flutter/material.dart';
import 'package:up_todo/core/models/svg_model.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/widgets/custom_svg.dart';

import '../../data/models/events_tap_model.dart';
import 'selected_date_time_icon.dart';

class EventsSelectedDateTimeAndSaveButton extends StatelessWidget {
  const EventsSelectedDateTimeAndSaveButton(
      {super.key, required this.eventsTapModel});
  final EventsTapModel eventsTapModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SelectedDateAndTimeIcon(
                onTap: eventsTapModel.onTapDate, icon: Icons.calendar_month),
            const SizedBox(width: 20),
            SelectedDateAndTimeIcon(
                onTap: eventsTapModel.onTapTime, icon: Icons.schedule),
          ],
        ),
        InkWell(
            onTap: eventsTapModel.onTapSave,
            child: CustomSvg(svgModel: SvgModel(image: Assets.imagesSendEvent)))
      ],
    );
  }
}
