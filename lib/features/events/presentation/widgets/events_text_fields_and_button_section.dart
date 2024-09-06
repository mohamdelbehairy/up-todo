import 'package:flutter/material.dart';
import '../../../create_note/data/models/text_field_model.dart';
import 'events_all_text_fields.dart';
import 'events_selected_date_time_and_save_button.dart';

class EventsTextFieldsAndButtonsSection extends StatefulWidget {
  const EventsTextFieldsAndButtonsSection({super.key});

  @override
  State<EventsTextFieldsAndButtonsSection> createState() =>
      _EventsTextFieldsAndButtonsSectionState();
}

class _EventsTextFieldsAndButtonsSectionState
    extends State<EventsTextFieldsAndButtonsSection> {
  late TextEditingController title, decsription;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    title = TextEditingController();
    decsription = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    decsription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextFieldModel> items = [
      TextFieldModel(
          title: 'Event Title',
          controller: title,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a title';
            }
            if (value.length < 5) {
              return 'Title must be at least 5 characters';
            }
            if (value.length > 20) {
              return 'Title must be less than 20 characters';
            }
            return null;
          }),
      TextFieldModel(
          title: 'Event Description',
          controller: decsription,
          validator: (value) {
            if (value!.isEmpty &&
                title.text.isNotEmpty &&
                title.text.length >= 5 &&
                title.text.length < 20) {
              return 'Please enter a description';
            }
            if (value.length < 5 &&
                title.text.isNotEmpty &&
                title.text.length >= 5 &&
                title.text.length < 20) {
              return 'Description must be at least 5 characters';
            }
            if (value.length > 20 &&
                title.text.isNotEmpty &&
                title.text.length >= 5 &&
                title.text.length < 20) {
              return 'Description must be less than 20 characters';
            }
            return null;
          }),
    ];
    return Form(
      key: formKey,
      child: Column(
        children: [
          EventsTextFieldsSection(items: items),
          const SizedBox(height: 16),
          EventsSelectedDateTimeAndSaveButton(
            onTapSave: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              }
            },
          ),
        ],
      ),
    );
  }
}
