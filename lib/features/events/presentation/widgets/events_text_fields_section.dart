import 'package:flutter/material.dart';

import '../../../create_note/data/models/text_field_model.dart';
import 'events_text_field.dart';

class EventsTextFieldsSection extends StatelessWidget {
  const EventsTextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventsTextField(
            textFieldModel: TextFieldModel(
                title: 'Event Title', controller: TextEditingController())),
        const SizedBox(height: 8),
        EventsTextField(
            textFieldModel: TextFieldModel(
                title: 'Event Description',
                controller: TextEditingController())),
      ],
    );
  }
}
