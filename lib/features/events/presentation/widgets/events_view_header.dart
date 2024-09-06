import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/function/formatted_date.dart';
import 'package:up_todo/core/utils/styles.dart';

import '../../../../core/widgets/app_bar_circle_setting_button.dart';

class EventsViewHeader extends StatelessWidget {
  const EventsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formattedData(), style: Styles.styleRegular13),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Events', style: Styles.styleBold26),
            AppBarCircleSettingButton(onTap: () {})
          ],
        ),
      ],
    );
  }
}
