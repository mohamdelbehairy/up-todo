import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/features/create_note/data/models/text_field_model.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: textFieldModel.maxLines,
      controller: textFieldModel.controller,
      cursorColor: AppColors.secondaryColor,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
