import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';

import '../../../create_note/data/models/text_field_model.dart';

class EventsTextField extends StatelessWidget {
  const EventsTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFieldModel.controller,
      validator: textFieldModel.validator,
      style: Styles.styleBold26.copyWith(fontSize: 14),
      decoration: InputDecoration(
        hintText: textFieldModel.title,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primaryColor)),
      ),
    );
  }
}
