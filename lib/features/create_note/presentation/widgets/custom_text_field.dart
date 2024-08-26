import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/features/create_note/data/models/text_field_model.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.styleBold26.copyWith(fontSize: 20),
      maxLines: textFieldModel.maxLines,
      controller: textFieldModel.controller,
      cursorColor: AppColors.secondaryColor,
      validator: textFieldModel.validator,
      decoration: const InputDecoration(border: InputBorder.none),
    );
  }
}
