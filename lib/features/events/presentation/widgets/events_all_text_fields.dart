import 'package:flutter/material.dart';

import '../../../create_note/data/models/text_field_model.dart';
import 'events_text_field.dart';

class EventsTextFieldsSection extends StatelessWidget {
  const EventsTextFieldsSection({super.key, required this.items});
  final List<TextFieldModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        return Padding(
            padding: EdgeInsets.only(bottom: index == 0 ? 8 : 0),
            child: EventsTextField(textFieldModel: items[index]));
      }),
    );
  }
}
