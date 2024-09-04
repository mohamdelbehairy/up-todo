import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/features/events/presentation/widgets/events_selected_date_time_and_save_section.dart';

import 'events_text_fields_section.dart';

class EventsBottomSheetBody extends StatelessWidget {
  const EventsBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text('Add Event', style: Styles.styleBold26),
          const SizedBox(height: 8),
          const EventsTextFieldsSection(),
          const SizedBox(height: 16),
          const EventsSelectedDateTimeAndSaveSection(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
