import 'package:flutter/material.dart';

import '../../../create_note/data/models/text_field_model.dart';

class EventsFormModel {
  final GlobalKey<FormState> formKey;
  final List<TextFieldModel> items;
  final TextEditingController title, decsription;

  EventsFormModel(
      {required this.formKey,
      required this.items,
      required this.title,
      required this.decsription});
}
